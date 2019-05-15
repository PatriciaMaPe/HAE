#line 1 "C:/Users/Patripon/Desktop/pruebasHAE/P4/P4b/p4b.c"
char giro360 = 0;

 void interrupt()
{
 if(giro360==0){
 PORTC = 0x02;
 delay_ms(200);
 PORTC = 0x06;
 delay_ms(200);
 PORTC = 0x04;

 giro360=1;
 }

 if(PORTB.B0==0 && giro360==1){
 PORTC = 0x06;
 delay_ms(200);
 PORTC = 0x02;
 delay_ms(200);
 PORTC = 0x03;
 delay_ms(200);
 PORTC = 0x01;
 delay_ms(200);
 PORTC = 0x09;
 delay_ms(200);
 PORTC = 0x08;
 delay_ms(200);
 PORTC = 0x0C;
 delay_ms(200);
 PORTC = 0x04;
 delay_ms(200);

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
 PORTC = 0x03;


 TRISB.B0 = 1;
 INTCON2.INTEDG0 = 0;
 INTCON.INT0IF = 0;
 INTCON.INT0IE = 1;
 INTCON.GIE = 1;

 while(1);
}
