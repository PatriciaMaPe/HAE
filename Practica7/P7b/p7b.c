// Lcd pinout settings
sbit LCD_RS at PORTD.B2;
sbit LCD_EN at PORTD.B3;
sbit LCD_D7 at PORTD.B7;
sbit LCD_D6 at PORTD.B6;
sbit LCD_D5 at PORTD.B5;
sbit LCD_D4 at PORTD.B4;

// Pin direction
sbit LCD_RS_Direction at TRISD.B2;
sbit LCD_EN_Direction at TRISD.B3;
sbit LCD_D7_Direction at TRISD.B7;
sbit LCD_D6_Direction at TRISD.B6;
sbit LCD_D5_Direction at TRISD.B5;
sbit LCD_D4_Direction at TRISD.B4;

float aux=0;
char txt[14];

void interrupt()
{
 if(INTCON.TMR0IF){
   ADCON0.GO = 1;
    //se carga el valor inicial (alfa) del ‘contador’
    TMR0H = (18661>>8);
    TMR0L = 18661;
    INTCON.TMR0IF = 0; // se borra el flag timer
 }
 
 if(PIR1.ADIF){
   aux = (ADRESL >> 6);
   aux = aux + (ADRESH << 2);
   aux = aux * 0.0048828;
   aux = aux * 100.0; //Vout * 100 = Cº
   
   //Mostrar en LCD
   FloatToStr(aux, txt);
   Lcd_Cmd(_LCD_CLEAR);
   Lcd_out(1,1, txt);
   //Lcd_Out_CP(txt);

   PIR1.ADIF = 0;

 }

}

void main()
{

TRISE.B1 = 1; //se configura el terminal RE1 como entrada

ADCON0 = 0x71;
ADCON1 = 0x40;

//Conf. int AD
PIR1.ADIF = 0;
PIE1.ADIE = 1;
INTCON.PEIE = 1;
INTCON.GIE = 1;

//Conf. int Timer
T0CON = 0x04;
INTCON.TMR0IF = 0; // se pone el flag a 0
INTCON.TMR0IE = 1; // se habilita la interrupción del Timer 0
//se carga el valor inicial (alfa) del ‘contador’
TMR0H = (18661>>8);
TMR0L = 18661;

Lcd_Init();

T0CON.TMR0ON = 1;

while(1)
asm nop;
}