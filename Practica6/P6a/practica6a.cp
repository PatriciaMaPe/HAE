#line 1 "D:/Escritorio/Prácticas HAE 18-19/HAE_5 jueves 12-30 a 14-30/P6a/practica6a.c"

void interrupt()
{
 if(PORTC.B0){

 PORTC.B0=0;
 T0CON = 0xc2;
 TMR0L = 81;

 }else{

 PORTC.B0=1;
 T0CON = 0xc1;
 TMR0L = 106;
 }

INTCON.TMR0IF = 0;

}
void main()
{

ADCON1 = 0x07;
TRISC = 0;
PORTC = 0;


INTCON.TMR0IF = 0;
INTCON.TMR0IE = 1;
INTCON.GIE = 1;



T0CON = 0xc1;
TMR0L = 106;
PORTC.B0=1;

while(1)
asm nop;
}
