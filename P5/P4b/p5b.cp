#line 1 "C:/Users/Patripon/Desktop/pruebasHAE/P5/P4b/p5b.c"

sbit LCD_RS at PORTD.B2;
sbit LCD_EN at PORTD.B3;
sbit LCD_D7 at PORTD.B7;
sbit LCD_D6 at PORTD.B6;
sbit LCD_D5 at PORTD.B5;
sbit LCD_D4 at PORTD.B4;

sbit LCD_RS_Direction at TRISD.B2;
sbit LCD_EN_Direction at TRISD.B3;
sbit LCD_D7_Direction at TRISD.B7;
sbit LCD_D6_Direction at TRISD.B6;
sbit LCD_D5_Direction at TRISD.B5;
sbit LCD_D4_Direction at TRISD.B4;

char key, x;
unsigned short uni;
unsigned short cont;
unsigned short dec;
unsigned short inicio;
char txt[4];


void interrupt()
{
 if(inicio){
 Lcd_Out_CP ("Turno: ");
 inicio=0;
}

 if(cont%2==0){
 ByteToStr(uni, txt);
 Lcd_out(1,7, txt);
 uni++;
 }

 x = PORTB;
 INTCON.RBIF=0;
 cont++;
}

void main()
{

ADCON1 = 0x07;
TRISD = 0;
TRISB = 0xF0;

Lcd_Init();


INTCON2.RBPU = 0;

INTCON.RBIF=0;
INTCON.RBIE=1;
INTCON.GIE = 1;

uni=0;
cont=0;
inicio=1;


INTCON.RBIF=1;

while(1)
 asm nop;

}
