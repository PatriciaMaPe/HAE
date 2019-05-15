short int cont;
short int x;

void interrupt()
{
 if(INTCON.RBIF && INTCON.RBIE && cont == 0){
    T0CON = 0x81;
    //se carga el valor inicial (alfa) del ‘contador’
    TMR0H = (15536>>8);
    TMR0L = 15536;
    INTCON.TMR0IF = 1;
    INTCON.RBIF = 0;
 }
 else{
    T0CON = 0x01;
    //se carga el valor inicial (alfa) del ‘contador’
    TMR0H = (15536>>8);
    TMR0L = 15536;
    INTCON.TMR0IF = 0;
    INTCON.RBIF = 0;
 }
 
 if(INTCON.TMR0IF){
  if(cont<15){
   //T0CON = 0x86;
   TMR0H = (3036>>8);
   TMR0L = 3036; //se carga el valor inicial (alfa) del ‘contador’
   cont++;
   //PORTC.B0=!PORTC.B0;
   
  }else{
   T0CON.TMR0ON = 0;
   PORTC.B0=0;
   cont=0;
  }

}
INTCON.TMR0IF = 0; // se borra el flag
INTCON3.INT1IF = 0; // se borra el flag de la interrupción INT1

}
void main()
{

ADCON1 = 0x07; //configuración de los canales analógicos (AN) como digitales (PIC18F452)
TRISD = 0; // salida digital


//Conf int1
TRISB.B4 = 1; // se configura RB4 como entrada


RCON.IPEN = 0; // se deshabilitan las interrupciones con prioridad
x = PORTB; // x es una variable de 8 bits.
INTCON.RBIF = 0; // se pone el flag a 0
INTCON.RBIE = 1; // se habilita la interrupción por cambio de nivel

//Conf Timer int
INTCON.TMR0IF = 0; // se pone el flag a 0
INTCON.TMR0IE = 1; // se habilita la interrupción del Timer 0

INTCON.GIE = 1; // se habilitan las interrupciones en general

cont = 0;

while(1)
asm nop;
}