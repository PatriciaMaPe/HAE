#line 1 "C:/Users/Patri/Documents/HAE/Tarea4/tarea4_10.c"
char estado;

void interrupt()
{
 switch (estado){
 case 0:
 PORTC.B0 = 0;
 if(INTCON.INT1IE == 0) {
 estado=1;
 }
 break;

 case 1:
 PORTC.B0 = 1;
 if(INTCON.INT0IE = 1){
 estado=0;
 }
 break;
}
 INTCON.INT0IF = 0;
 INTCON.INT1IF = 0;
}


void main() {
ADCON1 = 0x07;
TRISC.B0 = 0;
PORTC.B0 = 0;
 TRISC=0;

 TRISB.B0 = 1;
 INTCON2.INTEDG0 = 1;
 INTCON.INT0IF = 0;
 INTCON.INT0IE = 1;


 TRISB.B1 = 1;
 INTCON2.INTEDG1 = 1;
 INTCON3.INT1IF = 0;
 INTCON3.INT1IE = 1;
 INTCON.GIE = 1;

 while(1);
}
