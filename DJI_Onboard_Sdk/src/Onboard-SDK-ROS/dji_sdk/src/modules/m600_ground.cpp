#include<serial/serial.h>
#include<iostream>
#include<cstring>
#include<stddef.h>
#include<string.h>
#include<ros/ros.h>
#include <stdio.h>
#include <exception>
#include<geometry_msgs/Twist.h>
//#include <dji_sdk/dji_sdk_node.h>
#include<dji_sdk/GimCtr.h>
#include<dji_sdk/HotpointMission.h>
#include<dji_sdk/WaypointMission.h>
#include<dji_sdk/Emergency.h>
#include<nav_msgs/Odometry.h>
#include<sensor_msgs/NavSatFix.h>
#include<sensor_msgs/Imu.h>
#include<pthread.h>
#include <iomanip>

class M600_Ground{

private:
	//align in one byte
	#pragma pack (1)
	struct HeartBeat{
		uint8_t sysPingHealth;
		uint8_t systemRetention[8];	
	};

	struct SystemStatus{
		int32_t battery;
		char lock_flag;
		uint8_t  systemRetention[14];
	};

	struct GpsStatus{
		uint8_t positionSta;
		uint8_t effectiveSatelliteNum;
		uint32_t latitude;
		uint32_t longitude;
		uint16_t altitude;
		uint16_t groudVel;
		uint16_t gpsYaw;
		uint8_t hours;
		uint8_t minutes;
		uint8_t seconds;
		int16_t gpsXVel;
		int16_t gpsYVel;
		int16_t gpsZVel;	
	};
	
	struct ImuStatus{
		int16_t imuPitch;
		int16_t imuRoll;
		int16_t imuYaw;
		int16_t imuPitchVel;
		int16_t imuRollVel;
		int16_t imuYawVel;
		int16_t imuXAcss;
		int16_t imuYAcss;
		int16_t imuZAcss;
		int16_t imuXMSig;
		int16_t imuYMSig;
		int16_t imuZMSig;
	};

	struct FlyCtrData{
		uint8_t emFlag;
		uint8_t mode;
		int16_t ref1;
		int16_t ref2;
		int16_t ref3;
		int16_t ref4;
		uint32_t latitude;
		uint32_t longitude;
	};
	
	struct GimCtrData{
		int16_t pitchCtr;
		int16_t yawCtr;
		int16_t setMutiple;
		int16_t setFocus;
		int8_t reset;
		int8_t camSOS;
		int8_t camSOR;
	};

	struct WaypointMission{
		uint8_t missionIndex;
		uint8_t latLntCount;
		int32_t ** latLntList;
		uint8_t actionCount;
		uint8_t ** waypointAction;
		uint16_t altitude;
		uint8_t velocity;
		uint8_t finishAction;
		uint8_t headingMode;
		int16_t gimbalAngle;
		int8_t repeatTimes;
		int8_t isUseCam;
		int8_t sor;
		int8_t shootVel;
	};

	struct HotpointMission{
		uint8_t missionIndex;
		int32_t latLnt[2];
		uint8_t startHotPoint;
		uint8_t headingMode;
		uint16_t altitude;
		uint8_t angleVel;
		uint8_t radius;
		int16_t gimbalAngle;
		uint8_t isUseCam;
		uint8_t sor;
		uint8_t shootVel;	
	};

	template <class T> 
	struct DataFrame{
		uint8_t frameHead[2];
		uint8_t  dataLen;
		uint8_t  frameIndex;
		uint8_t  systemNum;
		uint8_t  moduleNum;
		uint8_t  msgPkgNum;
		T*	 data ;
		uint8_t checkSum[2];
	};
	#pragma pack ()
	//enum download data
	enum DownLoadData{
		REV_ODOM,
		REV_GPS,
		REV_IMU,
	};

	//private class contribute 

	DataFrame<HeartBeat>* heartDataFrame = NULL;
	DataFrame<FlyCtrData>*  flyCtrDataFrame = NULL;
	DataFrame<GimCtrData>*  gimCtrDataFrame = NULL;
	DataFrame<HotpointMission>*  hotpointMissionFrame = NULL; 


	SystemStatus* revSystemStatus =NULL;
	GpsStatus* revGpsStatus = NULL;
	ImuStatus* revImuStatus = NULL;
	serial::Serial* mySerial = NULL;
	ros::Subscriber fCtrSub;
	ros::Subscriber gimCtrSub;
	ros::Publisher	gpsPub;
	ros::Publisher	odomPub;
	ros::Publisher	imuPub;
	sensor_msgs::Imu imuData;
	nav_msgs::Odometry odomData;
	sensor_msgs::NavSatFix gosData;
	pthread_t revLoopThread;


	//set and send byte data to serial
	template <class T> 
	void setAndSendByteArray(DataFrame<T> * dataFrame, int dataSize){
		uint16_t checksum = 0x0000;
		uint8_t * dataBuffer = new uint8_t[255];
		memmove(dataBuffer,dataFrame,7);
		//std::cout<<dataBuffer<<std::endl;
		memmove(&dataBuffer[7],dataFrame->data,dataSize);
		for(int i = 0 ;i<dataSize+7;i++){
			checksum += dataBuffer[i];
		}
		memmove(&dataBuffer[dataSize+7],&checksum,2);
		mySerial->write(dataBuffer,dataSize+7+2);
		std::cout<<dataBuffer<<std::endl;
		delete dataBuffer;
	}



	//send  waypoint mission  byte data   ---max waypoint count is 40
	void setAndSendWMissionByteArray(DataFrame<WaypointMission>*  dataFrame, uint8_t waypointCount,uint8_t actionCount){
		uint16_t checksum = 0x0000;
		uint8_t * dataBuffer = new uint8_t[500];
		memmove(dataBuffer,dataFrame,7);
		
		memmove(&dataBuffer[7],dataFrame->data,2);
		for(int i = 0;i< waypointCount;i++){
			memmove(&dataBuffer[9+i*8],&dataFrame->data->latLntList[i][0],4);  
			memmove(&dataBuffer[9+4+i*8],&dataFrame->data->latLntList[i][1],4);
			
			//memmove(&dataBuffer[9+i*8],&dataFrame->data->latLntList[i],8);  can be better
					
		}
		memmove(&dataBuffer[9+waypointCount*8],&dataFrame->data->actionCount,1);
		for(int i = 0;i< actionCount;i++){
			memmove(&dataBuffer[9+waypointCount*8+1+i*2],&dataFrame->data->waypointAction[i][0],1);
			memmove(&dataBuffer[9+1+waypointCount*8+1+i*2],&dataFrame->data->waypointAction[i][1],1);
			//memmove(&dataBuffer[9+waypointCount*8+1+i*2],&dataFrame->data->waypointAction[i],2);  can be better
		}		
		memmove(&dataBuffer[9+waypointCount*8+1+actionCount*2],&dataFrame->data->altitude,11);

		for(int i = 0 ;i<7+2+waypointCount*8+1+actionCount*2+11;i++){
			checksum += dataBuffer[i];
		}

		memmove(&dataBuffer[7+2+waypointCount*8+1+actionCount*2+11],&checksum,2);
		std::cout<<"byte0"<<std::endl;
		for(int i=0;7+2+waypointCount*8+1+actionCount*2+11+2;i++){
			printf(" %x ",dataBuffer[i]);
		}
		std::cout<<std::endl;
		mySerial->write(dataBuffer,7+2+waypointCount*8+1+actionCount*2+11+2);
		//std::cout<<dataBuffer<<std::endl;
		delete dataBuffer;
	}


	// control the velocity
	void fCtrSubCallBack(const geometry_msgs::Twist::ConstPtr& fMsg){
		ROS_INFO("YYYYYYYYYYY");
		if(flyCtrDataFrame == NULL){
			flyCtrDataFrame = new DataFrame<FlyCtrData>();
			flyCtrDataFrame->data = new FlyCtrData();
			flyCtrDataFrame->frameHead[0] = 0xFE;
			flyCtrDataFrame->frameHead[1] = 0xEF;
			flyCtrDataFrame->dataLen = 27;
			flyCtrDataFrame->frameIndex = 1;
			flyCtrDataFrame->systemNum = 0x01;
			flyCtrDataFrame->moduleNum = 0x00;
			flyCtrDataFrame->msgPkgNum = 0x10;
		}else{
			flyCtrDataFrame->frameIndex +=1;
		}	
		flyCtrDataFrame->data->emFlag = 0;
		flyCtrDataFrame->data->mode = 2;
		flyCtrDataFrame->data->ref1 = fMsg->linear.x*10;
		flyCtrDataFrame->data->ref2 = fMsg->linear.y*10;
		flyCtrDataFrame->data->ref3 = fMsg->linear.z*10;
		flyCtrDataFrame->data->ref4 = fMsg->angular.z*10;
		flyCtrDataFrame->data->latitude = 0;
		flyCtrDataFrame->data->longitude = 0;
		setAndSendByteArray<FlyCtrData>(flyCtrDataFrame,18);		
	}

	// home or land or hover
	void emergency (const dji_sdk::Emergency::ConstPtr& emMsg){
		
		if(flyCtrDataFrame == NULL){
			flyCtrDataFrame = new DataFrame<FlyCtrData>();
			flyCtrDataFrame->data = new FlyCtrData();
			flyCtrDataFrame->frameHead[0] = 0xFE;
			flyCtrDataFrame->frameHead[1] = 0xEF;
			flyCtrDataFrame->dataLen = 27;
			flyCtrDataFrame->frameIndex = 1;
			flyCtrDataFrame->systemNum = 0x01;
			flyCtrDataFrame->moduleNum = 0x00;
			flyCtrDataFrame->msgPkgNum = 0x10;
		}else{
			flyCtrDataFrame->frameIndex +=1;
		}

		flyCtrDataFrame->data->emFlag = 1;
		if(emMsg->home.data !=0 ){	
			flyCtrDataFrame->data->mode = 4;
		}else if(emMsg->land.data !=0){
			flyCtrDataFrame->data->mode = 5;
		}else if(emMsg->hover.data !=0){
			
		}else if(emMsg->takeOff.data !=0){
			flyCtrDataFrame->data->mode = 6;
		}
		flyCtrDataFrame->data->ref1 = 0;
		flyCtrDataFrame->data->ref2 = 0;
		flyCtrDataFrame->data->ref3 = 0;
		flyCtrDataFrame->data->ref4 = 0;
		flyCtrDataFrame->data->latitude = 0;
		flyCtrDataFrame->data->longitude = 0;
		setAndSendByteArray<FlyCtrData>(flyCtrDataFrame,18);		
	}


	//control gimbal
	void gimCtrSubCallBack(const dji_sdk::GimCtr::ConstPtr& gimMsg){
		if(gimCtrDataFrame == NULL){
			gimCtrDataFrame = new DataFrame<GimCtrData>();
			gimCtrDataFrame->data = new GimCtrData();
			gimCtrDataFrame->frameHead[0] = 0xFE;
			gimCtrDataFrame->frameHead[1] = 0xEF;
			gimCtrDataFrame->dataLen = 20;
			gimCtrDataFrame->frameIndex = 1;
			gimCtrDataFrame->systemNum = 0x01;
			gimCtrDataFrame->moduleNum = 0x00;
			gimCtrDataFrame->msgPkgNum = 0x11;
			
		}else{
			gimCtrDataFrame->frameIndex +=1;	
		}	
		gimCtrDataFrame->data->pitchCtr = gimMsg->pry.x;
		gimCtrDataFrame->data->yawCtr = gimMsg->pry.z;
		gimCtrDataFrame->data->setMutiple = gimMsg->mutiple.data;
		gimCtrDataFrame->data->setFocus = gimMsg->setFcus.data;
		gimCtrDataFrame->data->reset = gimMsg->reset.data;
		gimCtrDataFrame->data->camSOS = gimMsg->sos.data;
		gimCtrDataFrame->data->camSOR = gimMsg->sor.data;
		setAndSendByteArray<GimCtrData>(gimCtrDataFrame,11);
	}

	 void waypointMissionCallback(const  dji_sdk::WaypointMission::ConstPtr& wpMsg){
		DataFrame<WaypointMission>* wpMissionFrame = new DataFrame<WaypointMission>();
		wpMissionFrame->data = new WaypointMission();
		wpMissionFrame->data->latLntList = new int32_t*[wpMsg->latLntCount.data];
		for(int i=0;i<wpMsg->latLntCount.data;i++){
			wpMissionFrame->data->latLntList[i] = new int32_t[2];
		}
		wpMissionFrame->data->waypointAction = new uint8_t*[wpMsg->actionCount.data];
		for(int i=0;i<wpMsg->actionCount.data;i++){
			wpMissionFrame->data->waypointAction[i] = new uint8_t[2];
		}
		wpMissionFrame->frameHead[0] = 0xFE;
		wpMissionFrame->frameHead[1] = 0xEF;
		wpMissionFrame->dataLen = 14+wpMsg->latLntCount.data*8+wpMsg->actionCount.data*2;
		wpMissionFrame->frameIndex = 1;
		wpMissionFrame->systemNum = 0x01;
		wpMissionFrame->moduleNum = 0x00;
		wpMissionFrame->msgPkgNum = 0x11;
		

		wpMissionFrame->data->missionIndex = wpMsg->missionIndex.data;
		wpMissionFrame->data->latLntCount = wpMsg->latLntCount.data;
		wpMissionFrame->data->actionCount = wpMsg->actionCount.data;
		wpMissionFrame->data->altitude = wpMsg->altitude.data;
		wpMissionFrame->data->velocity = wpMsg->velocity.data;
		wpMissionFrame->data->finishAction = wpMsg->finishAction.data;
		wpMissionFrame->data->headingMode = wpMsg->headingMode.data;
		wpMissionFrame->data->gimbalAngle = wpMsg->gimbalAngle.data;
		wpMissionFrame->data->repeatTimes = wpMsg->repeatTimes.data;
		wpMissionFrame->data->isUseCam = wpMsg->isUseCam.data;
		wpMissionFrame->data->sor = wpMsg->sor.data;
		wpMissionFrame->data->shootVel = wpMsg->shootVel.data;

		for(int i = 0;i <(int)wpMsg->latLntCount.data;i++){
			wpMissionFrame->data->latLntList[i][0] = (int)wpMsg->latLntList[i].x*pow(10,7);
			wpMissionFrame->data->latLntList[i][1] = (int)wpMsg->latLntList[i].y*pow(10,7);
		}
		for(int i = 0;i <(int)wpMsg->actionCount.data;i++){
			wpMissionFrame->data->waypointAction[i][0] = (int)wpMsg->waypointAction[i].x;
			wpMissionFrame->data->waypointAction[i][1] = (int)wpMsg->waypointAction[i].y;
		}
		
		setAndSendWMissionByteArray(wpMissionFrame,wpMsg->latLntCount.data,wpMsg->actionCount.data);
	}




	void hotpointMissionCallback(const dji_sdk::HotpointMission::ConstPtr& hpMsg){
		if(hotpointMissionFrame == NULL){
			hotpointMissionFrame = new DataFrame<HotpointMission>();
			hotpointMissionFrame->data = new HotpointMission();
			hotpointMissionFrame->frameHead[0] = 0xFE;
			hotpointMissionFrame->frameHead[1] = 0xEF;
			hotpointMissionFrame->dataLen = 25;
			hotpointMissionFrame->frameIndex = 1;
			hotpointMissionFrame->systemNum = 0x01;
			hotpointMissionFrame->moduleNum = 0x00;
			hotpointMissionFrame->msgPkgNum = 0x11;
			
		}else{
			hotpointMissionFrame->frameIndex +=1;	
		}
	
		hotpointMissionFrame->data->missionIndex = hpMsg->missionIndex.data;
		hotpointMissionFrame->data->latLnt[0] = (int)hpMsg->hotpoint.x;
		hotpointMissionFrame->data->latLnt[1] = (int)hpMsg->hotpoint.y;
		hotpointMissionFrame->data->startHotPoint = hpMsg->startHotPoint.data;
		hotpointMissionFrame->data->headingMode = hpMsg->headingMode.data;
		hotpointMissionFrame->data->altitude = hpMsg->altitude.data;
		hotpointMissionFrame->data->angleVel = hpMsg->angleVel.data;
		hotpointMissionFrame->data->radius = hpMsg->radius.data;
		hotpointMissionFrame->data->gimbalAngle = hpMsg->gimbalAngle.data;
		hotpointMissionFrame->data->isUseCam = hpMsg->isUseCam.data;
		hotpointMissionFrame->data->sor = hpMsg->sor.data;
		hotpointMissionFrame->data->shootVel = hpMsg->shootVel.data;
		setAndSendByteArray<HotpointMission>(hotpointMissionFrame,16);
	}
	
	// init Sub and Pub
	void initSubPub(ros::NodeHandle &nh){
		
		fCtrSub = nh.subscribe("m600_velCtr",10,&M600_Ground::fCtrSubCallBack,this);
		gimCtrSub = nh.subscribe("m600_gimCtr",10,&M600_Ground::gimCtrSubCallBack,this);
		gpsPub = nh.advertise<sensor_msgs::NavSatFix>("m600_gps",100);
		odomPub = nh.advertise<nav_msgs::Odometry>("m600_odom",100);
		imuPub = nh.advertise<sensor_msgs::Imu>("m600_imu",100);
	}

	static void* revByteDataLoopStatic(void* object){
		reinterpret_cast<M600_Ground*>(object)->revByteDataLoop();
		return 0;
	}

  ////等各个线程退出后，进程才结束，否则进程强制结束了，线程可能还没反应过来；
    //pthread_exit(NULL);
	void revByteDataLoopThread(){
		int result = pthread_create(&revLoopThread,NULL,&M600_Ground::revByteDataLoopStatic,this);
		if(result != 0){
			std::cout<<"pthread_create error:error_code ="<<result<<std::endl;
		}
	}


	// continue to receive byte data from p900 port 
	void revByteDataLoop(){
		int dataLen = 0;
		uint8_t * dataBuffer = new uint8_t[255];
		uint8_t * completeOneData = new uint8_t[255];
		while(ros::ok()){
			int len = mySerial->available();
			if(len >2){
				mySerial->read(&dataBuffer[dataLen],len);
				for(int i = 0; i< len+dataLen - 2; i++){
					if(dataBuffer[i] == 0xFE && dataBuffer[i+1] == 0xEF){
						if(dataBuffer[i+2] <= len+dataLen - i){
							memmove(&completeOneData[0],&dataBuffer[i],dataBuffer[i+2]);
							parseOneFrame(completeOneData,dataBuffer[i+2]);
						}else{
							memmove(&dataBuffer[0],&dataBuffer[i],len+dataLen - i);
							dataLen = len+dataLen - i;
							break;
						}				
					}
					if(i == len-3){
						dataLen = 0;
					}	
				}
			}
		}
		delete dataBuffer;
		delete completeOneData;
	}


	// parse one complete byte data and convert it to a frameStruct
	void parseOneFrame(uint8_t * byteData, int len){
		uint16_t checkSum = 0x0000;
		uint8_t	low = 0x00;
		uint8_t high = 0x00;
		
		if(byteData[0] == 0xFE && byteData[1] == 0xEF && byteData[2] ==len){
			for(int i =0 ;i<byteData[2]-2;i++){
				checkSum +=byteData[i];
			}
			low = checkSum;
			high = checkSum>>8;
			if(high == byteData[len - 1] && low == byteData[len - 2]){
				uint8_t *key_data = new uint8_t[100];
				memmove(key_data,&byteData[7],byteData[2] - 9);
				byteDataToFrame(key_data,byteData[2] - 9,byteData[6]);
				delete key_data;
			}
		}
				
	}

	//convert byte data to frame struct 
	void byteDataToFrame(uint8_t * keyData,int len,uint8_t dataKind){
		if(dataKind == 0x01){
			if(revSystemStatus == NULL){
				revSystemStatus = new SystemStatus();			
			}
			memmove(revSystemStatus,keyData,len);
		}else if(dataKind == 0x02){
			if(revGpsStatus == NULL){
				revGpsStatus = new GpsStatus();			
			}
			memmove(revGpsStatus,keyData,len);
		}else if(dataKind == 0x04){
			if(revImuStatus == NULL){
				revImuStatus = new ImuStatus();			
			}
			memmove(revImuStatus,keyData,len);
		}else{
			std::cout<<"byteToFrame error"<<std::endl;
		}
	}

	// parse  a frame and publish a topic 
	
	void frameToPubTopic(void* frameData, DownLoadData revData){
		switch(revData){
			case M600_Ground::REV_ODOM:
				
				break;
			case M600_Ground::REV_GPS:
				break;
			case M600_Ground::REV_IMU:
				break;
			default:
				break;
		}
	}
	

public:
	M600_Ground(ros::NodeHandle &nh){initMySerial();initSubPub(nh);revByteDataLoopThread();}
	~M600_Ground(){mySerial->close();}


	//init p900 serial
	void initMySerial(){
		if(mySerial == NULL){
			mySerial = new serial::Serial();
		}
		mySerial->setPort("/dev/ttyUSB0");
		mySerial->setBaudrate(115200);
		serial::Timeout to = serial::Timeout::simpleTimeout(1000);
    		mySerial->setTimeout(to);
    		mySerial->open();
		if (mySerial->isOpen()){
			ROS_INFO("Serial Port initialized");
		}
	};
};

int main(int argc ,char **argv){
	ros::init(argc,argv,"M600_Ground");
	ros::NodeHandle nh;
	M600_Ground* m600_ground = new M600_Ground(nh);	
	ros::spin();
	return 0;
}
	
