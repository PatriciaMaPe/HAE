
sbit LCD_RS at PORTD.B2;
sbit LCD_EN at PORTD.B3;
sbit LCD_D7 at PORTD.B7;
sbit LCD_D6 at PORTD.B6;
sbit LCD_D5 at PORTD.B5;
sbit LCD_D4 at PORTD.B4;

sbit LCD_RS_Direction at TRISD.B2;
sbit LCD_EN_Direction at TRISD.B3;
sbit LCD_D7_Direction at TRISD.B7;
sbit LCD_D6_Direction at TRISD.B6;
sbit LCD_D5_Direction at TRISD.B5;
sbit LCD_D4_Direction at TRISD.B4;

char key, x;
unsigned short uni;
unsigned short cont;
unsigned short dec;
unsigned short inicio;
char txt[4];


void interrupt() // se ha pulsado una tecla
{
 if(inicio){
 Lcd_Out_CP ("Turno: ");
 inicio=0;
}

 if(cont%2==0){
 ByteToStr(uni, txt);
 Lcd_out(1,7, txt);
 uni++;
 }

 x = PORTB; // para poder borrar el bit RBIF (define x global)
 INTCON.RBIF=0; // se borra el bit RBIF después de llamar a la función tecla()
 cont++;
}

void main()
{

ADCON1 = 0x07; //configuración de los canales analógicos (AN) como digitales (PIC18F452)
TRISD = 0; // salida digital
TRISB = 0xF0; // el nibble alto son entradas y el nibble bajo son salidas

Lcd_Init();

//Configuración interrupción RB4-RB7
INTCON2.RBPU = 0; // se habilitan las resistencias de pullup del puerto B
x = PORTB; //para poder borrar el RBIF
INTCON.RBIF=0;   // se pone el flag de la interrupción a 0
INTCON.RBIE=1;   // se habilita la interrupción por cambio de nivel
INTCON.GIE = 1; // se habilitan las interrupciones en general

uni=0;
cont=0;
inicio=1;


INTCON.RBIF=1; //Se provoca artificialmente una interrupcion  por software

while(1)
 asm nop;

}