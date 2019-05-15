char giro360 = 0;

 void interrupt()
{
    if(giro360==0){
    PORTC = 0x02; //(C)
    delay_ms(200);
    PORTC = 0x06;//(BC)
    delay_ms(200);
    PORTC = 0x04;//(B)

    giro360=1;
  }

  if(PORTB.B0==0 && giro360==1){
    PORTC = 0x06; //(BC)
    delay_ms(200);
    PORTC = 0x02;//(C)
    delay_ms(200);
    PORTC = 0x03;//(CD)
    delay_ms(200);
    PORTC = 0x01;//(D)
    delay_ms(200);
    PORTC = 0x09;//(DA)
    delay_ms(200);
    PORTC = 0x08;//(A)
    delay_ms(200);
    PORTC = 0x0C;//(AB)
    delay_ms(200);
    PORTC = 0x04;//(B)
    delay_ms(200);

  }
 INTCON.INT0IF = 0; // se borra el flag de la interrupción INT0
}

void main()
{
 ADCON1 = 0x07; //configuración de los canales analógicos (AN) como digitales

 // configuracion de puertos
 TRISC = 0; //se declara el terminal RC0 como una salida digital
 TRISB.B0 = 1;

 PORTC = 0x01; //(D)
 delay_ms(200);
 PORTC = 0x03; //(DC)
 
 //configuración de interrupciones
 TRISB.B0 = 1; //se configura RB0 como entrada
 INTCON2.INTEDG0 = 0; //la interrupción la provoca un flanco de subida (x=1)/ bajada (x=0)
 INTCON.INT0IF = 0; // se pone el flag de la interrupción INT0 a 0
 INTCON.INT0IE = 1; // se habilita la interrupción INT0
 INTCON.GIE = 1; // se habilitan las interrupciones en general

 while(1);
}
