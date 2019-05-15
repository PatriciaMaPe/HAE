char ledsDer = 0x01;
char ledsIzq = 0x80;
char aux;

void main() {
     TRISC = 0x00;
     PORTC = 0x00;

     while(1){
      //PORTC.B0 = 1;
     ledsDer = (ledsDer >> 1);
     ledsIzq = (ledsIzq << 1);
     aux = ledsDer + ledsIzq;
     PORTC = aux;
     delay_ms(400);
     PORTC = 0x00;
     delay_ms(100);

     if(ledsDer==0x08){
        ledsDer = ledsDer >> 1;
        ledsIzq = ledsIzq << 1;
     }
  }
}
