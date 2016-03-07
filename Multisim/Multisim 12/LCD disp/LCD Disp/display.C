#include <htc.h>






static bit  LCD_D7   @ 0x87;




// functions//
void dispcommand(void);
void LCD_busy(void);
void command(unsigned char);
void display(void);
void delay(void);
void transmit_data(unsigned char str[]);

void dis(unsigned char[]);

///////////// to set the diaplay setting in LCD /////////////////////////////////////////////////////


//////////////////// to sP2_0d data or TEXT in LCD ////////////////////////////////
void main()
	{
TH1= 0xfd;
SCON= 0x50;
TMOD = 0x20;
TR1 =1;
P2=0x00;
P0=0x00;
P3=0x00;
		
	dispcommand();
		transmit_data("alok");
	again:		dis("alok");
		delay();
		//goto again;
	while(1);
		}
	
	
void dispcommand()
{
	
	P0=0x00;
	P2=0x00;
	/////////////////// send command............./////////////////////////////////////////////////////////////////////

	command(0x38);
	command(0x0E);
	command(0x01);
	command(0x06);
	command(0x80);

}


 //////////////////////////////// command send sub,,,,,,,,,,,,,./////////////////////////////////////////
	void command(unsigned char cmd)
	{
		P0=cmd;
	
		P21=0;
		P22=0;
		P20=1;
	
		P20=0;
		delay();
		LCD_busy();
}

/////////////////////// display sub.//////////////////////////////////////////////////////////////////////////

	void display()
	{
	 P0=ACC;
	
	P21=1;
	P22=0;
	P20=1;

	P20=0;
		LCD_busy();
}

///////////////////// delay sub.///////////////////////////////////////////////////////////////////////////////////////
	void delay()
	{
		int j,k;
		for(j=0;j<=21;j++)
			{
			for(k=0;k<=500;k++);
			}
	}
	
	
	
// function to rotate the data on LCD	

void dis(unsigned char d[])
		{
		unsigned char temp;
			for(temp=0;d[temp]!='\0';temp++)
				{
					ACC=d[temp];
					display();
					delay();
				}
		}
	

void transmit_data(unsigned char str[])
	{
	 unsigned char st;
			for(st=0;str[st]!='\0';st++)
			{
			SBUF=str[st];
			while(TI==0);
			TI=0;
			}
	}

void LCD_busy(void)
{
     LCD_D7   = 1;           //Make D7th bit of LCD as i/p
     P20   = 1;           //Make port pin as o/p
     P21   = 0;           //Selected command register
     P22   = 1;           //We are reading
     while(LCD_D7){          //read busy flag again and again till it becomes 0
          P20   = 0;     //Enable H->L
          P20   = 1;
     }
}