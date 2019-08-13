#include<ros/ros.h>
#include<sensor_msgs/Joy.h>
class Test{

private:
	ros::Publisher pubCtr;
	void initSubPub(ros::NodeHandle &nh){
		//pubCtr = nh.advertise<sensor_msgs::Joy>("",10);
	}
public:

	Test(ros::NodeHandle & nh){}
	~Test(){}


};

int main(int argc,char **argv){
	ros::init(argc,argv,"M600_TEST");
	ros::NodeHandle nh;
	sensor_msgs::Joy joy;
	ros::Publisher  pubCtr = nh.advertise<sensor_msgs::Joy>("dji_sdk/flight_control_setpoint_ENUvelocity_yawrate",10);
	joy.axes.push_back(4);
	joy.axes.push_back(0);
	joy.axes.push_back(0);
	joy.axes.push_back(0);
	//joy.axes.push_back(10000);
	//joy.axes.push_back(-5000);	
	ros::Rate loop_rate = 45;
	while(ros::ok()){
		pubCtr.publish(joy);
		loop_rate.sleep();
		ros::spinOnce();
	}
	
	return 0;
}
