#include <string.h>
#include <htc.h>
#include <stdio.h>

#define LCD_data P2
#define LCD_D7   P27
#define LCD_rs   P10
#define LCD_rw   P11
#define LCD_en   P12

/*static volatile unsigned char LCD_data @ 0xA0;
static volatile bit LCD_D7   @ 0xA7;
static volatile bit LCD_rs   @ 0x90;
static volatile bit LCD_rw   @ 0x91;
static volatile bit LCD_en   @ 0x92;*/

void LCD_init(void);
void LCD_busy(void);
void LCD_command(unsigned char );
void LCD_senddata(unsigned char );
void LCD_sendstring(unsigned char *);


void main()
{
	
        unsigned char msg[]={"HELLO WORLD"};
         LCD_init();
         LCD_command(0x80);
again:         LCD_sendstring(msg);
		goto again;
        while(1);  
       
}


void LCD_init()
{
     LCD_data = 0x38;     //Function set: 2 Line, 8-bit, 5x7 dots
     LCD_rs   = 0;        //Selected command register
     LCD_rw   = 0;        //We are writing in data register
     LCD_en   = 1;        //Enable H->L
     LCD_en   = 0;
     LCD_busy();          //Wait for LCD to process the command


     LCD_data = 0x0D;     //Display on, Curson blinking command
     LCD_rs   = 0;        //Selected command register
     LCD_rw   = 0;        //We are writing in data register
     LCD_en   = 1;        //Enable H->L
     LCD_en   = 0;
     LCD_busy();          //Wait for LCD to process the command


     LCD_data = 0x01;     //Clear LCD
     LCD_rs   = 0;        //Selected command register
     LCD_rw   = 0;        //We are writing in data register
     LCD_en   = 1;        //Enable H->L
     LCD_en   = 0;
     LCD_busy();          //Wait for LCD to process the command

     LCD_data = 0x06;     //Entry mode, auto increment with no shift
     LCD_rs   = 0;        //Selected command register
     LCD_rw   = 0;        //We are writing in data register
     LCD_en   = 1;        //Enable H->L
     LCD_busy();

}

void LCD_busy()
{
     LCD_D7   = 1;           //Make D7th bit of LCD as i/p
     LCD_en   = 1;           //Make port pin as o/p
     LCD_rs   = 0;           //Selected command register
     LCD_rw   = 1;           //We are reading
     while(LCD_D7)
        {          //read busy flag again and again till it becomes 0
           LCD_en   = 0;     //Enable H->L
           LCD_en   = 1;
     }

/*unsigned char i,j;

3+69
         for(i=0;i<50;i++)        //A simple for loop for delay
            for(j=0;j<255;j++);*/
}

void LCD_command(unsigned char var)
{
     LCD_data = var;      //Function set: 2 Line, 8-bit, 5x7 dots
     LCD_rs   = 0;        //Selected command register
     LCD_rw   = 0;        //We are writing in instruction register
     LCD_en   = 1;        //Enable H->L
     LCD_en   = 0;
     LCD_busy();          //Wait for LCD to process the command
}
/* Using the above function is really simple
 var will carry the command for LCD
 e.g.
 LCD_command(0x01);*/


void LCD_senddata(unsigned char var)
{
     LCD_data = var;      //Function set: 2 Line, 8-bit, 5x7 dots
     LCD_rs   = 1;        //Selected data register
     LCD_rw   = 0;        //We are writing
     LCD_en   = 1;        //Enable H->L
     LCD_en   = 0;
     LCD_busy();          //Wait for LCD to process the command
}
/* Using the above function is really simple
 we will pass the character to display as argument to function
 e.g.

 LCD_senddata('A');*/


void LCD_sendstring(unsigned char *var)
{
     while(*var)              //till string ends
       LCD_senddata(*var++);  //send characters one by one
}