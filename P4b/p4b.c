/* Estructura básica de un programa */

//declaracion de variables globales (mira el pdf denominado Tipos de datos)
    char giro360 = 0;
//declaracion (y definicion) de funciones

//declaracion y definicion de la ISR (rutina de servicio de interrupciones)
 void interrupt() //rutina de servicio de interrupciones (MikroC)
{
    char i=0;
    if(giro360==0){
    PORTC = 0x04; //(B)
    delay_ms(200);
    PORTC = 0x08;//(A)
    delay_ms(200);
    PORTC = 0x01;//(D)
    delay_ms(200);
    PORTC = 0x03;//(DyC)

    giro360=1;
  }
  
  if(PORTB.B0==0 && giro360==1){
   for(i=0;i<2;i++){
    PORTC = 0x01; //(D)
    delay_ms(200);
    PORTC = 0x08;//(A)
    delay_ms(200);
    PORTC = 0x04;//(B)
    delay_ms(200);
    PORTC = 0x02;//(C)
    delay_ms(200);
   }
    PORTC = 0x03;//(CyD)
  }
 INTCON.INT0IF = 0; // se borra el flag de la interrupción INT0
}

void main()
{
 ADCON1 = 0x07; //configuración de los canales analógicos (AN) como digitales

 // configuracion de puertos
 TRISC = 0; //se declara el terminal RC0 como una salida digital
 TRISB.B0 = 1;

 //PORTC.B0 = 1; //(D)
 //PORTC.B1 = 1; //(C)
 //PORTC.B2 = 1; //(B)
 //PORTC.B3 = 1; //(A)
 PORTC = 0x01;
 delay_ms(200);
 PORTC = 0x02;
 delay_ms(200);
 PORTC = 0x06;
 //configuracion e inicializacion de los módulos del PIC que se vayan a utilizar

 //configuración de interrupciones (si se utilizan)
 TRISB.B0 = 1; //se configura RB0 como entrada
 INTCON2.INTEDG0 = 0; //la interrupción la provoca un flanco de subida (x=1)/ bajada (x=0)
 INTCON.INT0IF = 0; // se pone el flag de la interrupción INT0 a 0
 INTCON.INT0IE = 1; // se habilita la interrupción INT0
 INTCON.GIE = 1; // se habilitan las interrupciones en general

 while(1)
 {


 }
}
// Componentes ISIS: PIC18F452, RES, LED-BLUE