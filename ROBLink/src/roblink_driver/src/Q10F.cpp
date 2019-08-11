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



#define Q10F_UP 1
#define Q10F_DOWN 2
#define Q10F_LEFT 3
#define Q10F_RIGHT 4
#define Q10F_STOP 5


//全局变量
serial::Serial serial_Q10f; //声明串口对象

uint8_t Q10FTxBuffer[256];
uint8_t Q10FTxnum=0;

//按角度
uint8_t UpAng[9]		=		{0x81,0x01,0x0A,0x01,0x00,0x00,0x03,0x01,0xff};  //81 01 0A 01 00 32 03 01 FF
uint8_t DownAng[9]		=		{0x81,0x01,0x0A,0x01,0x00,0x00,0x03,0x02,0xff};
uint8_t RightAng[9]		=		{0x81,0x01,0x0A,0x01,0x00,0x00,0x02,0x03,0xff};
uint8_t LeftAng[9]		=		{0x81,0x01,0x0A,0x01,0x00,0x00,0x01,0x03,0xff};
uint8_t StopAng[9]		= 		{0x81,0x01,0x0A,0x01,0x00,0x00,0x03,0x03,0xff};

//相机变倍
uint8_t ZoomOut[7]		=	{0xff,0x01,0x00,0x40,0x00,0x00,0x41};
uint8_t ZoomIn[7]		=	{0xff,0x01,0x00,0x20,0x00,0x00,0x21};
uint8_t ZoomStop[6] 		=	{0x81,0x01,0x04,0x07,0x00,0xff};

//相机变倍的VISCA协议
uint8_t ZoomTable[30][9] 	= 	{
{0x81,0x01,0x04,0x47,0x00,0x00,0x00,0x00,0xff},//1
{0x81,0x01,0x04,0x47,0x01,0x07,0x0f,0x0f,0xff},
{0x81,0x01,0x04,0x47,0x02,0x02,0x02,0x02,0xff},
{0x81,0x01,0x04,0x47,0x02,0x08,0x03,0x04,0xff},//4
{0x81,0x01,0x04,0x47,0x02,0x0c,0x09,0x00,0xff},
{0x81,0x01,0x04,0x47,0x02,0x0f,0x0d,0x08,0xff},
{0x81,0x01,0x04,0x47,0x03,0x02,0x07,0x0d,0xff},//7
{0x81,0x01,0x04,0x47,0x03,0x04,0x0b,0x0d,0xff},
{0x81,0x01,0x04,0x47,0x03,0x06,0x0b,0x03,0xff},
{0x81,0x01,0x04,0x47,0x03,0x08,0x05,0x00,0xff},//10
{0x81,0x01,0x04,0x47,0x03,0x09,0x0a,0x03,0xff},
{0x81,0x01,0x04,0x47,0x03,0x0a,0x0b,0x07,0xff},
{0x81,0x01,0x04,0x47,0x03,0x0b,0x0a,0x05,0xff},//13
{0x81,0x01,0x04,0x47,0x03,0x0c,0x06,0x0d,0xff},
{0x81,0x01,0x04,0x47,0x03,0x0d,0x00,0x04,0xff},
{0x81,0x01,0x04,0x47,0x03,0x0d,0x08,0x01,0xff},//16
{0x81,0x01,0x04,0x47,0x03,0x0d,0x0f,0x02,0xff},
{0x81,0x01,0x04,0x47,0x03,0x0e,0x04,0x0a,0xff},
{0x81,0x01,0x04,0x47,0x03,0x0e,0x09,0x05,0xff},//19
{0x81,0x01,0x04,0x47,0x03,0x0e,0x0e,0x00,0xff},
{0x81,0x01,0x04,0x47,0x03,0x0f,0x00,0x06,0xff},
{0x81,0x01,0x04,0x47,0x03,0x0f,0x03,0x08,0xff},//22
{0x81,0x01,0x04,0x47,0x03,0x0f,0x05,0x0e,0xff},
{0x81,0x01,0x04,0x47,0x03,0x0f,0x08,0x03,0xff},
{0x81,0x01,0x04,0x47,0x03,0x0f,0x0a,0x09,0xff},//25
{0x81,0x01,0x04,0x47,0x03,0x0f,0x0c,0x0e,0xff},
{0x81,0x01,0x04,0x47,0x03,0x0f,0x0e,0x07,0xff},
{0x81,0x01,0x04,0x47,0x04,0x00,0x00,0x00,0xff},//28
{0x81,0x01,0x04,0x47,0x04,0x00,0x00,0x00,0xff},
{0x81,0x01,0x04,0x47,0x04,0x00,0x00,0x00,0xff},//30
};

//相机手动聚焦
uint8_t focusOut[7]		=	{0xff,0x01,0x00,0x80,0x00,0x00,0x81};
uint8_t focusIn[7]		=	{0xff,0x01,0x01,0x00,0x00,0x00,0x02};
uint8_t focusStop[7]		=	{0xff,0x01,0x00,0x00,0x00,0x00,0x01};

//相机模式切换及拍照
uint8_t cameraModeChange[7]	=	{0xff,0x01,0x00,0x07,0x00,0x67,0x6f};
uint8_t takePicture[7]		=	{0xff,0x01,0x00,0x07,0x00,0x55,0x5d};//在拍照模式下拍照，在录像模式下录像或者停止录像

//一键回中
uint8_t homePosition[9]		=	{0x81,0x01,0x0A,0x01,0x00,0x00,0x03,0x03,0xFF};

//航向跟随控制
uint8_t cmd_follow_yaw_disable[11]	  =     {0x3E,0x1F,0x06,0x25,0x01,0x1F,0x00,0x00,0x00,0x00,0x20};
uint8_t cmd_follow_yaw_enable[11]	  =     {0x3E,0x1F,0x06,0x25,0x01,0x1F,0x01,0x00,0x00,0x00,0x21};


bool Q10FInit(void)
{
    Q10FTxnum=0;
	//Q10FHomePosition();
    return true;
}


uint8_t Check8Bit(uint8_t Input[],uint8_t num)
{
    uint8_t sum=0;
    for(int i=0; i<num; i++)
    {
        sum+=Input[i];
    }
    return sum;
}


//云台姿态控制，角度控制
bool Q10FRotateSpeed(uint8_t type,uint8_t angle)
{
    if(angle>180)angle=180;
    if(type==Q10F_UP)
    {
        UpAng[5]=angle;
		serial_Q10f.write(UpAng,9);
    }
    else if(type==Q10F_DOWN)
    {
        DownAng[5]=angle;
        serial_Q10f.write(DownAng,9);
    }
    else if(type==Q10F_LEFT)
    {
        LeftAng[5]=angle;     
        serial_Q10f.write(LeftAng,9);
    }
    else if(type==Q10F_RIGHT)
    {
        RightAng[5]=angle;      
        serial_Q10f.write(RightAng,9);
    }
    else if(type==Q10F_STOP)
    {
        serial_Q10f.write(StopAng,9);
    }
    else
    {
        return false;
    }
		//delay_us(2);
    return true;
}


//输入为Q10F相机的倍数，正常值为1-30倍
bool Q10FZoomTableCtrl(uint8_t multiple)
{
	if(multiple<1)multiple=1;
	if(multiple>30)multiple=30;
	multiple=multiple-1;
	
	serial_Q10f.write(ZoomTable[multiple],9);
	//delay_us(2);
	return true;
}

bool Q10FCameraZoomIn(void)
{
  serial_Q10f.write(ZoomIn,7);
	//delay_us(2);
	return true;
}

bool Q10FCameraZoomOut(void)
{
  serial_Q10f.write(ZoomOut,7);
	//delay_us(2);
	return true;
}

bool Q10FCameraZoomStop(void)
{
  serial_Q10f.write(ZoomStop,6);
	//delay_us(2);
	return true;
}

bool Q10FCameraModeChange(void)
{
  serial_Q10f.write(cameraModeChange,7);
	//delay_us(2);
	return true;
}

bool Q10FTakePicture(void)
{
  serial_Q10f.write(takePicture,7);
	//delay_us(2);
	return true;
}

bool Q10FfocusOut(void)
{
  serial_Q10f.write(focusOut,7);
	//delay_us(2);
	return true;
}

bool Q10FfocusIn(void)
{
  serial_Q10f.write(focusIn,7);
	//delay_us(2);
	return true;
}

bool Q10FfocusStop(void)
{
  serial_Q10f.write(focusStop,7);
	//delay_us(2);
	return true;
}

bool Q10FHomePosition(void)
{
  serial_Q10f.write(homePosition,9);
	//delay_us(2);
	return true;
}


bool Q10FHYawFollowEnable(void)
{
  serial_Q10f.write(cmd_follow_yaw_enable,11);
	//delay_us(2);
	return true;
}
bool Q10FHYawFollowDisable(void)
{
  serial_Q10f.write(cmd_follow_yaw_disable,11);
	//delay_us(2);
	return true;
}

int q10f_pitch=0;
int q10f_yaw=0;
int q10f_zoom=1;
int q10f_focus=0;
int q10f_home=0;
int q10f_TakePicture=0;
int q10f_cameraModeChange=0;
int q10f_yawfollow=0;
int stop_zoom_flag=0;
int stop_focus_flag=0;
int take_picture_2s_flag=0;

void display_q10f_status(void)
{
	
	std::cout << "pit:" << q10f_pitch << "\ty:" << q10f_yaw << "\tzoom:" << q10f_zoom << "\tfocus:" << q10f_focus;
	std::cout << "\thome:" << q10f_home << " takePic:" << q10f_TakePicture<< " modeC:" << q10f_cameraModeChange<< " yawf:" << q10f_yawfollow  << "\r\n";
}

void chatterCallback(const roblink_driver::GimbalCtl::ConstPtr& msg)
{

	uint8_t temp;
	q10f_home=msg->home;
	q10f_TakePicture=msg->TakePicture;
	q10f_cameraModeChange=msg->cameraModeChange;

	
	//俯仰控制
	if(msg->pitch != 0)
	{
		q10f_pitch += msg->pitch;
		
		if(q10f_pitch>60)
		{
			q10f_pitch=60;
		}
		if(q10f_pitch<-90)
		{
			q10f_pitch=-90;
		}
		
		if(q10f_pitch>0)
		{
			temp = (uint8_t)q10f_pitch;
			Q10FRotateSpeed(Q10F_UP,temp);
		}
		else
		{
			temp = (uint8_t)(-q10f_pitch);
			Q10FRotateSpeed(Q10F_DOWN,temp);
		}
		
		display_q10f_status();
		
		return;
	}
	
	//航向控制
	if(msg->yaw != 0)
	{
		q10f_yaw += msg->yaw;
		
		if(q10f_yaw>140)
		{
			q10f_yaw=140;
		}
		if(q10f_yaw<-140)
		{
			q10f_yaw=-140;
		}
		
		if(q10f_yaw>0)
		{
			temp = (uint8_t)q10f_yaw;
			Q10FRotateSpeed(Q10F_RIGHT,temp);
		}
		else
		{
			temp = (uint8_t)(-q10f_yaw);
			Q10FRotateSpeed(Q10F_LEFT,temp);
		}
		display_q10f_status();
		return;
	}
	
	//变倍
	if(msg->zoom != 0)
	{
		q10f_zoom += msg->zoom;
		
		if(q10f_zoom>10)
		{
			q10f_zoom=10;
		}
		if(q10f_zoom<1)
		{
			q10f_zoom=1;
		}
				
		Q10FZoomTableCtrl(q10f_zoom);
		
		display_q10f_status();
		return;
	}
	
	//变焦
	if(msg->focus != 0)
	{
		q10f_focus += msg->focus;
		
		if(q10f_focus>10)
		{
			q10f_focus=10;
		}
		if(q10f_focus<0)
		{
			q10f_focus=0;
		}
		
		if(msg->focus>0)
		{
			Q10FfocusIn();			
		}
		else
		{
			Q10FfocusOut();				
		}
		
		stop_focus_flag=20;	//20*10ms;

		display_q10f_status();
		return;
	}
	
	
	//拍照/录像
	if(msg->TakePicture!= 0)
	{
		//Q10FTakePicture();
		
		if(take_picture_2s_flag==0)
		{
			take_picture_2s_flag=1;
		}
		else
		{
			take_picture_2s_flag=0;
		}
		
		display_q10f_status();
		return;		
	}
	
	//拍照录像模式切换
	if(msg->cameraModeChange!= 0)
	{
		Q10FCameraModeChange();
		display_q10f_status();
		return;
	}	
	
	//回中
	if(msg->home!= 0)
	{
		q10f_pitch=0;
		q10f_yaw=0;
		Q10FHomePosition();
		display_q10f_status();
		return;
	}
	
	//航向跟随
	if(msg->yawfollow!= 0)
	{
		if(q10f_yawfollow==1)
		{
			Q10FHYawFollowDisable();
			q10f_yawfollow = 0;
		}
		else
		{
			Q10FHYawFollowEnable();
			q10f_yawfollow = 1;
		}
		
	}	
			
	display_q10f_status();
}

int main(int argc, char **argv)
{
    ros::init(argc, argv, "Q10F");
    ros::NodeHandle n;
    ros::Subscriber sub = n.subscribe("GimbalCtl", 1000, chatterCallback);

	try
  	{
    	//串口设置
    	serial_Q10f.setPort("/dev/ttyUSB0");
    	serial_Q10f.setBaudrate(115200);
    	serial::Timeout to = serial::Timeout::simpleTimeout(1000);
    	serial_Q10f.setTimeout(to);
    	serial_Q10f.open();
  	}
  	catch (serial::IOException& e)
  	{
    	ROS_ERROR_STREAM("Unable to open Serial Port !");
    	return -1;
  	}
  	if (serial_Q10f.isOpen())
  	{
    	ROS_INFO_STREAM("Serial Port initialized");
  	}
  	else
  	{	
    	return -1;
  	}
	Q10FHomePosition();
	
	//设置循环的频率 100HZ 10ms 要求循环频率大于数据接收频率
  	ros::Rate loop_rate(100);
	while (ros::ok())
	{			
		if(stop_focus_flag>0)
		{
			stop_focus_flag--;
			if(stop_focus_flag==0)
				Q10FfocusStop();	
		}
				
		//定时2s		
		static int loop_2s=0;
    	loop_2s++;
    	if(loop_2s >= 200) //200*10ms=2000ms
    	{
			loop_2s=0;   
			if(take_picture_2s_flag==1 ) //拍照开关打开
			{
				Q10FTakePicture();
			}
		}
					
		ros::spinOnce();
    	loop_rate.sleep();
	}

}


