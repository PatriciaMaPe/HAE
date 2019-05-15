#line 1 "D:/Escritorio/Pr�cticas HAE 18-19/HAE_5 jueves 12-30 a 14-30/P5b/p5b.c"
#line 1 "d:/escritorio/pr�cticas hae 18-19/hae_5 jueves 12-30 a 14-30/p5b/tecla12int.h"
#line 25 "d:/escritorio/pr�cticas hae 18-19/hae_5 jueves 12-30 a 14-30/p5b/tecla12int.h"
unsigned char tecla()
{

unsigned char columna=0, fila, aux1=0x10, aux2;

unsigned char teclado[4][3]={{49, 50, 51},{52, 53, 54},{55, 56, 57}, {42, 48, 35}};

delay_ms( 10 );

 for(fila=0; fila< 4 ; fila++)
 {
 if((PORTB&aux1)==0x00) break;
 aux1=(aux1<<1);
 }

 PORTB=0x01;

 while((PORTB& 0xF0 )!= 0xF0 )
 {
 PORTB=(PORTB<<1);
 columna++;
 }


 PORTB=0x00;

 do
 {delay_ms(2);
 }while((PORTB&0xF0)!=0xF0);



 aux2=teclado[fila][columna];
 return aux2;
}
#line 2 "D:/Escritorio/Pr�cticas HAE 18-19/HAE_5 jueves 12-30 a 14-30/P5b/p5b.c"
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
 if(inicio==1){
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
PORTB = 0;


Lcd_Init();


INTCON2.RBPU = 0;
x = PORTB;
INTCON.RBIF=0;
INTCON.RBIE=1;
INTCON.GIE = 1;

uni=0;
dec=0;
cont=0;
inicio=1;

INTCON.RBIF=1;

while(1){

}

}
