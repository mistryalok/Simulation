
#include<htc.h>
void delay();
void main(void)
	{
		P2=0x00;
		P04=0x00;
		
		
again:		P2=0xff;
			P04=0xff;
		delay();
		P2=0x00;
		P04=0x00;
		delay();
	goto again;

	}
	

			void delay()
	{
		int j,k;
		for(j=0;j<=24;j++)
			{
			for(k=0;k<=500;k++)
					{
					}
			}
	}