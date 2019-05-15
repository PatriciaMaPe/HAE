#line 1 "D:/Escritorio/Prácticas HAE 18-19/HAE_5 jueves 12-30 a 14-30/P6c/p6c.c"
char cont;

void interrupt()
{
 if(INTCON3.INT1IF && INTCON3.INT1IE){
 PORTC.B0=1;
 T0CON = 0x86;
 TMR0H = (3036>>8);
 TMR0L = 3036;
 INTCON.TMR0IF = 1;
 INTCON3.INT1IF = 0;
 INTCON3.INT1IE = 0;

 }

 if(INTCON.TMR0IF){
 if(cont<15){

 TMR0H = (3036>>8);
 TMR0L = 3036;
 cont++;


 }else{
 T0CON.TMR0ON = 0;
 PORTC.B0=0;
 cont=0;
 }

}
INTCON.TMR0IF = 0;
INTCON3.INT1IF = 0;

}
void main()
{

ADCON1 = 0x07;
TRISC = 0;
PORTC = 0;


TRISB.B1 = 1;


INTCON2.INTEDG1 = 1;
INTCON3.INT1IF = 0;
INTCON3.INT1IE = 1;


INTCON.TMR0IF = 0;
INTCON.TMR0IE = 1;

INTCON.GIE = 1;

cont = 0;

while(1)
asm nop;
}
