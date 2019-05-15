#line 1 "C:/Users/Patripon/Desktop/pruebasHAE/P2/p2.c"
char numero[] ={0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x6F };
char uni;
char dec;
char t;

void main() {
 ADCON1 = 0x07;
 TRISD = 0x00;
 TRISA = 0x00;

 PORTD = 0x00;
 PORTA = 0x03;
 while(1){

 for(dec=0;dec<10;dec++){
 for(uni=0;uni<10;uni++){
 for(t=0;t<25;t++){
 PORTA = 0x01;
 PORTD = numero[dec];
 delay_ms(20);
 PORTA = 0x02;
 PORTD = numero[uni];
 delay_ms(20);

 }

 }

 }
 }
}
