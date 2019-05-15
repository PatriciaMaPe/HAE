
_interrupt:

;practica6a.c,2 :: 		void interrupt()
;practica6a.c,4 :: 		if(PORTC.B0){
	BTFSS       PORTC+0, 0 
	GOTO        L_interrupt0
;practica6a.c,6 :: 		PORTC.B0=0;
	BCF         PORTC+0, 0 
;practica6a.c,7 :: 		T0CON = 0xc2;
	MOVLW       194
	MOVWF       T0CON+0 
;practica6a.c,8 :: 		TMR0L = 81;
	MOVLW       81
	MOVWF       TMR0L+0 
;practica6a.c,10 :: 		}else{
	GOTO        L_interrupt1
L_interrupt0:
;practica6a.c,12 :: 		PORTC.B0=1;
	BSF         PORTC+0, 0 
;practica6a.c,13 :: 		T0CON = 0xc1;
	MOVLW       193
	MOVWF       T0CON+0 
;practica6a.c,14 :: 		TMR0L = 106;
	MOVLW       106
	MOVWF       TMR0L+0 
;practica6a.c,15 :: 		}
L_interrupt1:
;practica6a.c,17 :: 		INTCON.TMR0IF = 0; // se borra el flag
	BCF         INTCON+0, 2 
;practica6a.c,19 :: 		}
L_end_interrupt:
L__interrupt5:
	RETFIE      1
; end of _interrupt

_main:

;practica6a.c,20 :: 		void main()
;practica6a.c,23 :: 		ADCON1 = 0x07; //configuración de los canales analógicos (AN) como digitales (PIC18F452)
	MOVLW       7
	MOVWF       ADCON1+0 
;practica6a.c,24 :: 		TRISC = 0; // salida digital
	CLRF        TRISC+0 
;practica6a.c,25 :: 		PORTC = 0;
	CLRF        PORTC+0 
;practica6a.c,28 :: 		INTCON.TMR0IF = 0; // se pone el flag a 0
	BCF         INTCON+0, 2 
;practica6a.c,29 :: 		INTCON.TMR0IE = 1; // se habilita la interrupción del Timer 0
	BSF         INTCON+0, 5 
;practica6a.c,30 :: 		INTCON.GIE = 1; // se habilitan las interrupciones en general
	BSF         INTCON+0, 7 
;practica6a.c,34 :: 		T0CON = 0xc1;
	MOVLW       193
	MOVWF       T0CON+0 
;practica6a.c,35 :: 		TMR0L = 106; //se carga el valor inicial (alfa) del ‘contador’
	MOVLW       106
	MOVWF       TMR0L+0 
;practica6a.c,36 :: 		PORTC.B0=1;
	BSF         PORTC+0, 0 
;practica6a.c,38 :: 		while(1)
L_main2:
;practica6a.c,39 :: 		asm nop;
	NOP
	GOTO        L_main2
;practica6a.c,40 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
