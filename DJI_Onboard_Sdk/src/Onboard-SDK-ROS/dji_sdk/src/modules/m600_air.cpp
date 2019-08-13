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
#include<nav_msgs/Odometry.h>
#include<sensor_msgs/NavSatFix.h>
#include<sensor_msgs/Imu.h>
#include<sensor_msgs/Joy.h>
#include<pthread.h>
#include <iomanip>
#include <dji_sdk/DroneTaskControl.h>
#include <dji_sdk/SDKControlAuthority.h>
//#include "dji_sdk/dji_sdk.h"

//#define MY_DEBUG 1

class M600_Air{

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
	// tw
	enum CtrData{
		REV_FCTR,
		REV_GIMCTR,
	};

	// class private contribute
	DataFrame<SystemStatus>* systemStatusFrame = NULL;
	DataFrame<GpsStatus>*  gpsStatusFrame = NULL;
	DataFrame<ImuStatus>*  imuStatusFrame = NULL;	

	HeartBeat* revHeartBeat =NULL;
	FlyCtrData* revFlyCtrData = NULL;
	GimCtrData* revGimCtrData = NULL;
	serial::Serial* mySerial = NULL;

	ros::Subscriber imuSub;
	ros::Subscriber odomSub;
	ros::Subscriber gpsSub;

	sensor_msgs::Imu imuData ;
	nav_msgs::Odometry odomData;
	sensor_msgs::NavSatFix gpsData;

	ros::Publisher	fCtrPub;
	sensor_msgs::Joy joyVelCtr;

	ros::Publisher	gimCtrPub;
	dji_sdk::GimCtr gimCtr;

	ros::Rate send_data_rate = 5;

	pthread_t revLoopThread;

	//service client
   	ros::ServiceClient sdk_ctrl_authority_service;
	ros::ServiceClient drone_task_service;

	//set and send byte data to serial
	template <class T> 
	void setAndSendByteArray(DataFrame<T> * dataFrame, int dataSize){
		uint16_t checksum = 0x0000;
		uint8_t * dataBuffer = new uint8_t[255];
		memmove(dataBuffer,dataFrame,7);
		std::cout<<dataBuffer<<std::endl;
		memmove(&dataBuffer[7],dataFrame->data,dataSize);
		for(int i = 0 ;i<dataSize+7;i++){
			checksum += dataBuffer[i];
		}
		memmove(&dataBuffer[dataSize+7],&checksum,2);
		mySerial->write(dataBuffer,dataSize+7+2);
		std::cout<<dataBuffer<<std::endl;
		delete dataBuffer;
	}
	//get new odom data
	void odomSubCallback(const nav_msgs::Odometry& odomMsg){
		this->odomData = odomMsg;
	}
	//get new gps data
	void gpsSubCallback(const sensor_msgs::NavSatFix& gpsMsg){
		this->gpsData = gpsMsg;
	}
	//get new imu data
	void imuSubCallback(const sensor_msgs::Imu& imuMsg){
		this->imuData = imuMsg;
	}
	// init Pub and Sub
	void initSubPub(ros::NodeHandle &nh){
		imuSub = nh.subscribe("m600_imu",10,&M600_Air::imuSubCallback,this);
		odomSub = nh.subscribe("m600_odom",10,&M600_Air::odomSubCallback,this);
		gpsSub = nh.subscribe("m600_gps",10,&M600_Air::gpsSubCallback,this);
		fCtrPub = nh.advertise<sensor_msgs::Joy>("/dji_sdk/flight_control_setpoint_ENUvelocity_yawrate",10);
		gimCtrPub = nh.advertise<dji_sdk::GimCtr>("/m600_gimCtr",10);
		sdk_ctrl_authority_service = nh.serviceClient<dji_sdk::SDKControlAuthority> ("dji_sdk/sdk_control_authority");

 		drone_task_service = nh.serviceClient<dji_sdk::DroneTaskControl>("dji_sdk/drone_task_control");
	}
	//  UAV send imu gps odom data to ground in 5 HZ
	void sendUavDataLoop(){
		while(ros::ok()){
			sendImuByteData();
			sendGpsByteData();
			//sendOdomByteData();
			send_data_rate.sleep();
		}	
	}
	// send imu byte data to p900 port
	void sendImuByteData(){
		if(imuStatusFrame == NULL){
			imuStatusFrame = new DataFrame<ImuStatus>();
			imuStatusFrame->data = new ImuStatus();
			imuStatusFrame->frameHead[0] = 0xFE;
			imuStatusFrame->frameHead[1] = 0xEF;
			imuStatusFrame->dataLen = 33;
			imuStatusFrame->frameIndex = 1;
			imuStatusFrame->systemNum = 0x01;
			imuStatusFrame->moduleNum = 0x00;
			imuStatusFrame->msgPkgNum = 0x02;
		}else{
			imuStatusFrame->frameIndex+=1;
		}
		imuStatusFrame->data->imuPitch = 0;
		imuStatusFrame->data->imuRoll = 0;
		imuStatusFrame->data->imuYaw = 0;
		imuStatusFrame->data->imuPitchVel = this->imuData.angular_velocity.x;
		imuStatusFrame->data->imuRollVel = this->imuData.angular_velocity.x;
		imuStatusFrame->data->imuYawVel = this->imuData.angular_velocity.x;
		imuStatusFrame->data->imuXAcss = this->imuData.linear_acceleration.x;
		imuStatusFrame->data->imuYAcss = this->imuData.linear_acceleration.y;
		imuStatusFrame->data->imuZAcss = this->imuData.linear_acceleration.z;
		imuStatusFrame->data->imuXMSig = 0;
		imuStatusFrame->data->imuYMSig = 0;
		imuStatusFrame->data->imuZMSig = 0;
		setAndSendByteArray<ImuStatus>(imuStatusFrame,24);
	}
	// send gps byte data to p900 port
	void sendGpsByteData(){
		if(gpsStatusFrame == NULL){
			gpsStatusFrame = new DataFrame<GpsStatus>();
			gpsStatusFrame->data = new GpsStatus();
			gpsStatusFrame->frameHead[0] = 0xFE;
			gpsStatusFrame->frameHead[1] = 0xEF;
			gpsStatusFrame->dataLen = 34;
			gpsStatusFrame->frameIndex = 1;
			gpsStatusFrame->systemNum = 0x01;
			gpsStatusFrame->moduleNum = 0x00;
			gpsStatusFrame->msgPkgNum = 0x02;
		}else{
			gpsStatusFrame->frameIndex+=1;
		}
		gpsStatusFrame->data->positionSta = 0;
		gpsStatusFrame->data->effectiveSatelliteNum = 0;
		gpsStatusFrame->data->latitude = this->gpsData.latitude;
		gpsStatusFrame->data->longitude =  this->gpsData.longitude;
		gpsStatusFrame->data->altitude = this->gpsData.altitude;
		gpsStatusFrame->data->groudVel = 0;
		gpsStatusFrame->data->gpsYaw = 0;
		gpsStatusFrame->data->hours = 0;
		gpsStatusFrame->data->minutes = 0;
		gpsStatusFrame->data->seconds = 0;
		gpsStatusFrame->data->gpsXVel = 0;
		gpsStatusFrame->data->gpsYVel = 0;
		gpsStatusFrame->data->gpsZVel = 0;
		setAndSendByteArray<GpsStatus>(gpsStatusFrame,25);	
	}
	// send odom byte data to p900 port
	void sendOdomByteData(){
		
	}

	static void* revByteDataLoopStatic(void* object){
		reinterpret_cast<M600_Air*>(object)->revByteDataLoop();
		return 0;
	}
    ////等各个线程退出后，进程才结束，否则进程强制结束了，线程可能还没反应过来；
    //pthread_exit(NULL);

	void revByteDataLoopThread(){
		int result = pthread_create(&revLoopThread,NULL,&M600_Air::revByteDataLoopStatic,this);
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
			//std::cout<<"yyyyyyyyyy"<<std::endl;
			int len = mySerial->available();
			if(len > 2 || (dataLen !=0 && len>0)){
				mySerial->read(&dataBuffer[dataLen],len);
				std::cout<<"byte1";
				for(int i = 0;i<dataLen+len;i++){
					printf(" %x ",dataBuffer[i]);
				}
				std::cout<<std::endl;
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
					if(i == len+dataLen-3){
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
		#ifdef MY_DEBUG
		#endif My_DEBUG
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
				std::cout<<"good byteArray"<<std::endl;
				uint8_t *key_data = new uint8_t[255];
				memmove(&key_data[0],&byteData[7],byteData[2] - 9);
				byteDataToFrame(key_data,byteData[2] - 9,byteData[6]);
				delete key_data;
			}
		}
				
	}


	//convert byte data to frame struct 
	void byteDataToFrame(uint8_t * keyData,int len,uint8_t dataKind){
		if(dataKind == 0x00){	


		}else if(dataKind == 0x10){
			std::cout<<"byte2";
			for(int i = 0;i<len;i++){
				printf(" %x ",keyData[i]);
			}
			std::cout<<std::endl;
			revFlyCtrData = (FlyCtrData*)keyData;
			frameToPubTopic((void*)revFlyCtrData,REV_FCTR);

		}else if(dataKind == 0x11){
			std::cout<<"byte3";
			for(int i = 0;i<len;i++){
				printf(" %x ",keyData[i]);
			}
			std::cout<<std::endl;
			revGimCtrData = (GimCtrData*)keyData;
			frameToPubTopic((void*)revGimCtrData,REV_GIMCTR);
		}else{
			std::cout<<"byteToFrame error"<<std::endl;
		}
	}

	// parse  a frame and publish a topic 

	void frameToPubTopic(void* frameData, CtrData revData){
		switch(revData){
			case M600_Air::REV_FCTR:
				pubFCtrTopic((FlyCtrData*)frameData);
				break;
				
			case M600_Air::REV_GIMCTR:
				pubGimCtrTopic((GimCtrData*)frameData);
				break;
			default:
				break;
		}
	}
	//pub one FCtr Topic
	void pubFCtrTopic(FlyCtrData * frameData){
		uint8_t * temp = (uint8_t *)frameData;
		std::cout<<"byte3";
				for(int i = 0;i<18;i++){
					printf(" %x ",temp[i]);
				}
		std::cout<<std::endl;
		if(frameData ->emFlag == 1){
			flightKeyCtr((int)frameData->mode);
		}else if(frameData ->emFlag == 0){
			joyVelCtr.axes.push_back(frameData ->ref1/10);
			joyVelCtr.axes.push_back(frameData ->ref2/10);
			joyVelCtr.axes.push_back(frameData ->ref3/10);
			joyVelCtr.axes.push_back(frameData ->ref4/10);
			joyVelCtr.axes.push_back(10000.0);
			joyVelCtr.axes.push_back(-5000.0);
			fCtrPub.publish(joyVelCtr);
			joyVelCtr.axes.clear();
		}
	}


	void flightKeyCtr(int kind){
		dji_sdk::DroneTaskControl droneTaskControl;
		droneTaskControl.request.task = kind;
		drone_task_service.call(droneTaskControl);
		//sdk_ctrl_authority_service
	}
	
	//pub one GimCtr Topic
	void pubGimCtrTopic(GimCtrData * frameData){
		gimCtr.pry.x = frameData->pitchCtr;
		gimCtr.pry.z = frameData->yawCtr;
		gimCtr.mutiple.data = frameData->setMutiple;
		gimCtr.setFcus.data = frameData->setFocus;
		gimCtr.reset.data = frameData->reset;
		gimCtr.sos.data = frameData->camSOS;
		gimCtr.sor.data = frameData->camSOR;
		gimCtrPub.publish(gimCtr);
	}
	

public:
	//class structer init
	M600_Air(ros::NodeHandle &nh){initMySerial();initSubPub(nh);revByteDataLoopThread();}
	~M600_Air(){mySerial->close();}


	//init p900 serial
	void initMySerial(){
		if(mySerial == NULL){
			mySerial = new serial::Serial();
		}
		mySerial->setPort("/dev/ttyUSB1");
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
	ros::init(argc,argv,"M600_Air");
	ros::NodeHandle nh;
	M600_Air* m600_air = new M600_Air(nh);	
	ros::spin();
	return 0;
}
	
