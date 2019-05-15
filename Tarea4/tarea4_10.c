char estado;

void interrupt() //rutina de servicio de interrupciones (MikroC)
{
 switch (estado){
    case 0:
        PORTC.B0 = 0; // motor = 0
        if(INTCON.INT1IE == 0) {
         estado=1;
        }
        break;

    case 1:
        PORTC.B0 = 1;
        if(INTCON.INT0IE == 1){
         estado=0;
        }
        break;
}
 INTCON.INT0IF = 0; // se borra el flag de la interrupción INT0
 INTCON.INT1IF = 0;
}


void main() {
ADCON1 = 0x07;
TRISC.B0 = 0; //se configura el terminal RC0 como una salida digital
PORTC.B0 = 0; //se pone la salida RC0 a 0
     TRISC=0;
     //Interrupcion INT0
     TRISB.B0 = 1; //se configura RB0 como entrada
     INTCON2.INTEDG0 = 1; //la interrupción la provoca un flanco de subida (x=1)/ bajada (x=0)
     INTCON.INT0IF = 0; // se pone el flag de la interrupción INT0 a 0
     INTCON.INT0IE = 1; // se habilita la interrupción INT0
     
     //Interrupcion INT1
     TRISB.B1 = 1; // se configura RB1 como entrada
     INTCON2.INTEDG1 = 1; // la interrupción la provoca un flanco de subida (x=1) / bajada (x=0)
     INTCON3.INT1IF = 0; // se pone el flag de la interrupción INT1 a 0
     INTCON3.INT1IE = 1; // se habilita la interrupción INT1
     INTCON.GIE = 1; // se habilitan las interrupciones en general

 while(1);
}