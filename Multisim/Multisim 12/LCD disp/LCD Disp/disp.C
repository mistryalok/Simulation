#include <htc.H>


sfr LCDdata 	= 		0x80;
sbit EN			=		0xA7;		
sbit RS			=		0xA6;		
sbit RW			=		0xA5;	
sbit INTR		=		0xB3;		
sbit MOT		=		0x90;








// functions//
void dispcommand();
void command(unsigned char);
void display();
void delay();

void dis(unsigned char[]);

///////////// to set the diaplay setting in LCD /////////////////////////////////////////////////////


//////////////////// to send data or TEXT in LCD ////////////////////////////////
void main()
	{
		
		dispcommand();
		dis("alok");
		
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
		RS=0;
		RW=0;
		EN=1;
		EN=0;
		delay();
}

/////////////////////// display sub.//////////////////////////////////////////////////////////////////////////

	void display()
	{
	 P0=ACC;
	RS=1;
	RW=0;
	EN=1;
	EN=0;
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
	

