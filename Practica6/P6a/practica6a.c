
void interrupt()
{
 if(PORTC.B0){

 PORTC.B0=0;
 T0CON = 0xc2;
  TMR0L = 81;
 
 }else{

 PORTC.B0=1;
 T0CON = 0xc1;
  TMR0L = 106;
 }

INTCON.TMR0IF = 0; // se borra el flag

}
void main()
{

ADCON1 = 0x07; //configuración de los canales analógicos (AN) como digitales (PIC18F452)
TRISC = 0; // salida digital
PORTC = 0;

//T0CON = 0x41;
INTCON.TMR0IF = 0; // se pone el flag a 0
INTCON.TMR0IE = 1; // se habilita la interrupción del Timer 0
INTCON.GIE = 1; // se habilitan las interrupciones en general


// ya se puede poner el Timer0 a realizar una temporización
T0CON = 0xc1;
TMR0L = 106; //se carga el valor inicial (alfa) del ‘contador’
PORTC.B0=1;

while(1)
asm nop;
}