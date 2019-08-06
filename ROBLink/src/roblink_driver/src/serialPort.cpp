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
	for(i=0;i<len+6;i++)
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
#pragma pack(1)//设定为 1 字节对齐
struct GimbalCtl_TypeDef{
	int16_t pitch;
	int16_t yaw;
	int16_t zoom;
	int16_t focus;
	uint8_t  home;
	uint8_t  TakePicture;
	uint8_t  cameraModeChange;
};
#pragma pack()

void GimbalCtl_send(void)
{
	//参数初始化
	GimbalCtl_TypeDef GC_data;
	uint8_t GimbalCtl_buffer[sizeof(GC_data)+1];	
	memset(GimbalCtl_buffer,0,sizeof(GimbalCtl_buffer));
		
	//测试用，后期待删除
	GimbalCtl_data.pitch = -0.3;
	GimbalCtl_data.yaw = -0.5;
	GimbalCtl_data.zoom = -5.1;
	GimbalCtl_data.focus = 3.4;
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
	
	//结构体数据转化为数组
	memcpy(GimbalCtl_buffer+1,&GC_data,sizeof(GimbalCtl_buffer));
	
	//数据打包与发送
	data_out(GimbalCtl_buffer,sizeof(GimbalCtl_buffer));
}


void GimbalCtl_decode(uint8_t *data)
{
	//参数初始化
	GimbalCtl_TypeDef GC_data;
	uint8_t GC_buffer[sizeof(GC_data)];
	
	//提取有效数据
	memcpy(GC_buffer, &data[7], sizeof(GC_data));	
	
	//数组数据转化为结构体
	memcpy(&GC_data,GC_buffer,sizeof(GC_buffer));

	//根据协议缩放数据
	GimbalCtl_data.pitch = GC_data.pitch*0.1;
	GimbalCtl_data.yaw   = GC_data.yaw*0.1;
	GimbalCtl_data.zoom  = GC_data.zoom*0.1;
	GimbalCtl_data.focus = GC_data.focus*0.1;
	GimbalCtl_data.home  = GC_data.home;
	GimbalCtl_data.TakePicture = GC_data.TakePicture;
	GimbalCtl_data.cameraModeChange = GC_data.cameraModeChange;
	
	//调试用，后期待删除
	std::cout  << " out:"  << GimbalCtl_data.pitch << ", " << GimbalCtl_data.yaw << ", " << GimbalCtl_data.zoom << ", " << GimbalCtl_data.focus ;
	std::cout  << ", "  << GimbalCtl_data.home << ", " << GimbalCtl_data.TakePicture<< ", " << GimbalCtl_data.cameraModeChange  << "\r\n";
}


/**********************************************************************************************
函数名称 :  RecePro(uint8_t *data)
功    能: 解析接收到的数据
输    入: 数据缓存指针
输    出: null
日    期：8.2
作    者：
**********************************************************************************************/
int  RecePro(uint8_t *data)
{
	uint16_t cSum=0;	//bug修复，初始值必须清零
	uint8_t cSum_L = 0, cSum_H = 0;
	int i=0;				
	
	//帧头校验
	if(data[0]==0XFE && data[1]==0xEF) 
	{}
	else
	{
		return 0;
	}
	
	//和校验
	for(i=0;i<data[2]-2;i++)
	{
		cSum += data[i];
	}
	cSum_L = (uint8_t)cSum; //低字节
	cSum_H = (uint8_t)(cSum >> 8);	//高字节
	if(cSum_L == data[i]  && cSum_H == data[i+1])
	{}
	else
	{
		return 0;
	}
	
	//提取数据
	if(data[6] == 0x00)
	{
		//心跳包
		debug_break[0]++;
	}
	else if(data[6] == 0x11) 
	{
		//云台控制
		debug_break[1]++;
		GimbalCtl_decode(data);
	}
		
	return 1;
}

//接收数据解析，多帧数据同时到达
int Receive_data_decode(uint8_t *buf_data,int len)
{
	int out=0;
	int i=0;
	for(i=0;i<len;i++)
	{
		if(RecePro(&buf_data[i]))
		{
			out = i + buf_data[i+2];	//
			i = i + buf_data[i+2] - 1;	//-1表示自加，跳过已经处理部分数据
		}
	}
	
	return out;
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
  static uint8_t serial_buffer[1024];
  static int serial_len=0;
  int len_sub;

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

  while (ros::ok())
  {
    //获取数据长度
    len = ser.available();     

    if(len>0)    //接收数据
    {  
	  	uint8_t buffer_receive[len];		
      	//通过ROS串口对象读取串口信息，存放于缓冲区
      	ser.read(buffer_receive,len);  	
		memcpy(serial_buffer+serial_len,buffer_receive,len);
		serial_len=serial_len+len;			
    }
	
	//循环队列，提取有用数据  
	len_sub = Receive_data_decode(serial_buffer,serial_len);
	
	//减去已经处理的数据 
	if(len_sub>0)
	{		
		serial_len = serial_len - len_sub;
		if(serial_len<0)
		{
			serial_len = 0;
			memset(serial_buffer,0,sizeof(serial_buffer));
		}
		else
		{
			uint8_t buffer_temp1[serial_len];
			memcpy(buffer_temp1,&serial_buffer[len_sub],serial_len);
			memset(serial_buffer,0,sizeof(serial_buffer));
			memcpy(serial_buffer,buffer_temp1,serial_len);
		}	
		std::cout << std::dec << " b1:" << debug_break[0]<< " b2:" << debug_break[1]<< " len_sub:" << len_sub << " len:" << serial_len  << "\r\n";	
	}
	  	
	//防止溢出
	if(serial_len>1000)
	{
		//保留最后一百个数据
		uint8_t buffer_temp[100];
		memcpy(buffer_temp,serial_buffer+(serial_len-100),100);
		memset(serial_buffer,0,sizeof(serial_buffer));
		memcpy(serial_buffer,buffer_temp,100);
		serial_len=100; 
	}

    //断点数据分析，后期待删除
    static int debug_100ms=0;
    debug_100ms++;
    if(debug_100ms >= 5) //5*20ms=100ms
    {
     	//std::cout << std::dec << " b1:" << debug_break[0]<< " b2:" << debug_break[1]<< " len_sub:" << len_sub << " len:" << serial_len  << "\r\n";	
      	//std::cout << "f1:" << debug_break_float[0]<< " f2:" << debug_break_float[1] << " f3:" << debug_break_float[2]  << "\r\n";
      	//std::cout << " b1:" << sizeof(GimbalCtl_data)<< " b2:" << sizeof(GimbalCtl_data)<< " b3:" << debug_break[2]  << "\r\n";	
		
		debug_100ms=0;    
   
		GimbalCtl_send();
	}
	  
    ros::spinOnce();
    loop_rate.sleep();
  }
}


