#include "Tecla12INT.h"
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

void interrupt() // se ha pulsado una tecla
{
 key = tecla(); // en la variable key se guarda el valor ASCII de la tecla pulsada
 //Lcd_out(1,1, "hola");
 Lcd_Chr_CP (key);
 //Lcd_out(1,1, 48);
 x = PORTB; // para poder borrar el bit RBIF (define x global)
 INTCON.RBIF=0; // se borra el bit RBIF despu�s de llamar a la funci�n tecla()
}

void main()
{
//declaraci�n de variables
ADCON1 = 0x07; //configuraci�n de los canales anal�gicos (AN) como digitales (PIC18F452)
TRISD = 0; // salida digital
TRISB = 0xF0; // el nibble alto son entradas y el nibble bajo son salidas
PORTB = 0;
//configuraci�n de puertos
//configuraci�n e inicializaci�n de los m�dulos del PIC que se utilicen
Lcd_Init();

//Configuraci�n interrupci�n RB4-RB7
INTCON2.RBPU = 0; // se habilitan las resistencias de pullup del puerto B
x = PORTB; //para poder borrar el RBIF
INTCON.RBIF=0;
INTCON.RBIE=1;
INTCON.GIE = 1; // se habilitan las interrupciones en general


while(1){

}

}