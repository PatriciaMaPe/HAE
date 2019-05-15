#line 1 "D:/Escritorio/Prácticas HAE 18-19/HAE_5 jueves 12-30 a 14-30/P4b/p4b.c"



 char giro360 = 0;



 void interrupt()
{
 char i=0;
 if(giro360==0){
 PORTC = 0x04;
 delay_ms(200);
 PORTC = 0x08;
 delay_ms(200);
 PORTC = 0x01;
 delay_ms(200);
 PORTC = 0x03;

 giro360=1;
 }

 if(PORTB.B0==0 && giro360==1){
 for(i=0;i<2;i++){
 PORTC = 0x01;
 delay_ms(200);
 PORTC = 0x08;
 delay_ms(200);
 PORTC = 0x04;
 delay_ms(200);
 PORTC = 0x02;
 delay_ms(200);
 }
 PORTC = 0x03;
 }
 INTCON.INT0IF = 0;
}

void main()
{
 ADCON1 = 0x07;


 TRISC = 0;
 TRISB.B0 = 1;





 PORTC = 0x01;
 delay_ms(200);
 PORTC = 0x02;
 delay_ms(200);
 PORTC = 0x06;



 TRISB.B0 = 1;
 INTCON2.INTEDG0 = 0;
 INTCON.INT0IF = 0;
 INTCON.INT0IE = 1;
 INTCON.GIE = 1;

 while(1)
 {


 }
}
