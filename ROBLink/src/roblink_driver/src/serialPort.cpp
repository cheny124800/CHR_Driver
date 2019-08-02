#include <ros/ros.h> 
#include <serial/serial.h>  //ROS已经内置了的串口包 
#include <std_msgs/String.h>
#include <std_msgs/Empty.h> 
#include <string>
#include <vector>
#include <sstream>
#include <cmath>
#include <cstdlib>//string转化为double
#include <iomanip>//保留有效小数
#include <iostream>
#include "roblink_driver/GimbalCtl.h"



/********        全局变量        **********/
serial::Serial ser; //声明串口对象
roblink_driver::GimbalCtl GimbalCtl_data;//全局变量，解析后数据
int debug_break[10];
float debug_break_float[10];

/**********************************************************************************************
函数名称: data_out(uint8_t *data, uint8_t len)
功    能: 数据打包
输    入: null
输    出: null
日    期：2019.8.1
作    者： 
**********************************************************************************************/
void data_out(uint8_t *data, uint8_t len)
{
	static uint8_t s_buffer[255];
	static uint8_t seq=0;//帧序号
	uint16_t sum=0,i=0;
	
	memset(s_buffer,0,sizeof(s_buffer));
	
	//帧头
	s_buffer[0] = 0xFE;
	s_buffer[1] = 0xEF;
	
	//帧长，一帧数据的长度
	s_buffer[2] = len+8;
	
	//帧序号
	s_buffer[3] = seq++;

	//系统编号
	s_buffer[4] = 0x01;
	
	//模块编号
	s_buffer[5] = 0x32;	
	
	//实际传输数据
	for(i=0;i<len;i++)
	{
		s_buffer[i+6] = data[i];
	}
	
	//和校验
	for(i=0;i<len;i++)
	{
		sum += s_buffer[i];
	}
	s_buffer[len+6] = (uint8_t)sum;			//低字节
	s_buffer[len+7] = (uint8_t)(sum >> 8);	//高字节
	
	//调用串口函数发送
	ser.write(s_buffer,len+8);
	
}

/**********************************************************************************************
函数名称: heartbeat(void)
功    能: 心跳包
输    入: null
输    出: null
日    期：2019.8.1
作    者： 
***************************************sizeof(GimbalCtl_data)*******************************************************/
void heartbeat_send(void)
{
	uint8_t heartbeat_buffer[10];
	memset(heartbeat_buffer,0,sizeof(heartbeat_buffer));
	data_out(heartbeat_buffer,sizeof(heartbeat_buffer));
}


/**********************************************************************************************
函数名称: GimbalCtl_send(void)
功    能: 云台控制包
输    入: null
输    出: null
备    注：输入数据为处理之后的数据，便于传输 
**********************************************************************************************/
struct GimbalCtl_TypeDef{
	int16_t pitch;
	int16_t yaw;
	int16_t zoom;
	int16_t focus;
	char  home;
	char  TakePicture;
	char  cameraModeChange;
};

void GimbalCtl_send(void)
{
	uint8_t GimbalCtl_buffer[11+1];
	GimbalCtl_TypeDef GC_data;
	
	memset(GimbalCtl_buffer,0,sizeof(GimbalCtl_buffer));
	
	
	//测试用，后期待删除
	GimbalCtl_data.pitch = -1.1;
	GimbalCtl_data.yaw = 2.2;
	GimbalCtl_data.zoom = -3.3;
	GimbalCtl_data.focus = 4.4;
	GimbalCtl_data.home = 5;
	GimbalCtl_data.TakePicture = 6;
	GimbalCtl_data.cameraModeChange = 7;
	
	//消息包编号
	GimbalCtl_buffer[0]=0x11;
	
	//消息数据
	GC_data.pitch = GimbalCtl_data.pitch*10;
	GC_data.yaw = GimbalCtl_data.yaw*10;
	GC_data.zoom = GimbalCtl_data.zoom*10;
	GC_data.focus = GimbalCtl_data.focus*10;
	GC_data.home = GimbalCtl_data.home;
	GC_data.TakePicture = GimbalCtl_data.TakePicture;
	GC_data.cameraModeChange = GimbalCtl_data.cameraModeChange;

	
	memcpy(GimbalCtl_buffer+1,&GC_data,sizeof(GimbalCtl_buffer));
		
	data_out(GimbalCtl_buffer,sizeof(GimbalCtl_buffer));
}

/**********************************************************************************************
函数名称: main(int argc, char** argv)
功    能: 主函数
输    入: null
输    出: null
日    期：2019.8.1
作    者： 
**********************************************************************************************/
int main(int argc, char** argv)
{
  static int len;
  static int len_total;

  //初始化节点
  ros::init(argc, argv, "serial_node");
  //声明节点句柄
  ros::NodeHandle nh;
  //注册Publisher到话题GimbalCtl
  ros::Publisher GimbalCtl_pub = nh.advertise<roblink_driver::GimbalCtl>("GimbalCtl",1000);
  try
  {
    //串口设置
    ser.setPort("/dev/ttyS1");
    ser.setBaudrate(57600);
    serial::Timeout to = serial::Timeout::simpleTimeout(1000);
    ser.setTimeout(to);
    ser.open();
  }
  catch (serial::IOException& e)
  {
    ROS_ERROR_STREAM("Unable to open Serial Port !");
    return -1;
  }
  if (ser.isOpen())
  {
    ROS_INFO_STREAM("Serial Port initialized");
  }
  else
  {
    return -1;
  }

  //设置循环的频率 50HZ 20ms 要求循环频率大于数据接收频率
  ros::Rate loop_rate(50);

  std::string strRece;
  while (ros::ok())
  {
    //获取数据长度
    len = ser.available();     

    if (len>0)    //接收数据
    {  
      //通过ROS串口对象读取串口信息，存放于缓冲区
      strRece += ser.read(ser.available());
      //std::cout << strRece ;   
    }
  
    //数据处理，提取有效数据
    //int Rece_out=RecePro(strRece,len_total);    

    //缓冲区处理，清除已经提取的数据
    //if(Rece_out>0)
    //{strRece = strRece.substr(Rece_out);debug_break[0]++;}

    //防止缓冲区过大，3s数据量 2100=700×3
    if(strRece.length()>2100)
    {strRece.clear();debug_break[1]++;}

    //发布话题消息
    //if(Rece_out>0)
    //{GimbalCtl_pub.publish(GimbalCtl_data);debug_break[2]++;}

    //断点数据分析，后期待删除
    static int debug_100ms=0;
    debug_100ms++;
    if(debug_100ms >= 5) //5*20ms=100ms
    {
     	//std::cout << " b1:" << debug_break[0]<< " b2:" << debug_break[1]<< " b3:" << debug_break[2]  << "\r\n";	
      	//std::cout << "f1:" << debug_break_float[0]<< " f2:" << debug_break_float[1] << " f3:" << debug_break_float[2]  << "\r\n";
      	std::cout << " b1:" << sizeof(GimbalCtl_data)<< " b2:" << sizeof(GimbalCtl_data)<< " b3:" << debug_break[2]  << "\r\n";	
		
		debug_100ms=0;    
   
		heartbeat_send();
	}
	  
    ros::spinOnce();
    loop_rate.sleep();
  }
}


