#line 1 "C:/Users/Patripon/Desktop/PracticasHAE/Practica6/P6d/p6d.c"

sbit LCD_RS at RD2_bit;
sbit LCD_EN at RD3_bit;
sbit LCD_D7 at RD7_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D4 at RD4_bit;

sbit LCD_RS_Direction at TRISD2_bit;
sbit LCD_EN_Direction at TRISD3_bit;
sbit LCD_D7_Direction at TRISD7_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D4_Direction at TRISD4_bit;

unsigned short x;
unsigned short cont = 0;
unsigned int y;
unsigned short desbor = 0;
float tiempo;
char txt [14];

void interrupt(){
if( (INTCON.RBIF) ){
x = PORTB;
INTCON.RBIF = 0;
cont++;
if(cont == 1){
TMR0H = (0 >> 8);
TMR0L = 0;
Lcd_Out_CP("Calculando...");
}else{
y = TMR0L;
y = y + (TMR0H << 8);
T0CON.B7 = 0;
tiempo = (y + (desbor*65536)) * 0.000128;
#line 40 "C:/Users/Patripon/Desktop/PracticasHAE/Practica6/P6d/p6d.c"
FloatToStr (tiempo, txt);
Lcd_Cmd(_LCD_CLEAR);
Lcd_out(1,1, txt);
Lcd_Out_CP(" sec");
}
}

if((INTCON.TMR0IF)){
INTCON.TMR0IF = 0;
desbor++;
TMR0H = (0 >> 8);
TMR0L = 0;
}
}
void main() {
ADCON1 = 0X07;
TRISD = 0;
TRISB.B4 = 1;
x = PORTB;
INTCON.RBIF = 0;
INTCON.RBIE = 1;
T0CON = 0x87;
INTCON.TMR0IF = 0;
INTCON.TMR0IE = 1;
INTCON.GIE = 1;
Lcd_Init ();
while(1);
}
