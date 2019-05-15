#line 1 "C:/Users/Patripon/Desktop/pruebasHAE/P1/P1b/p1b.c"
char leds[] = {0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80};
char cont;

void main() {
 TRISC = 0x00;
 PORTC = 0x00;
 cont = 0;
 PORTC.B0 = 1;
 delay_ms(2000);
 while(1){
 if(cont==8){
 cont = 0;
 }
 PORTC = leds[cont];
 delay_ms(200);
 cont++;
 PORTC = 0x00;
 delay_ms(100);
 }
}
