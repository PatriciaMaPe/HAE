
_interrupt:

;tarea4_10.c,3 :: 		void interrupt() //rutina de servicio de interrupciones (MikroC)
;tarea4_10.c,5 :: 		switch (estado){
	GOTO        L_interrupt0
;tarea4_10.c,6 :: 		case 0:
L_interrupt2:
;tarea4_10.c,7 :: 		PORTC.B0 = 0; // motor = 0
	BCF         PORTC+0, 0 
;tarea4_10.c,8 :: 		if(INTCON.INT1IE == 0) {
	BTFSC       INTCON+0, 3 
	GOTO        L_interrupt3
;tarea4_10.c,9 :: 		estado=1;
	MOVLW       1
	MOVWF       _estado+0 
;tarea4_10.c,10 :: 		}
L_interrupt3:
;tarea4_10.c,11 :: 		break;
	GOTO        L_interrupt1
;tarea4_10.c,13 :: 		case 1:
L_interrupt4:
;tarea4_10.c,14 :: 		PORTC.B0 = 1;
	BSF         PORTC+0, 0 
;tarea4_10.c,15 :: 		if(INTCON.INT0IE = 1){
	BSF         INTCON+0, 4 
	BTFSS       INTCON+0, 4 
	GOTO        L_interrupt5
;tarea4_10.c,16 :: 		estado=0;
	CLRF        _estado+0 
;tarea4_10.c,17 :: 		}
L_interrupt5:
;tarea4_10.c,18 :: 		break;
	GOTO        L_interrupt1
;tarea4_10.c,19 :: 		}
L_interrupt0:
	MOVF        _estado+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_interrupt2
	MOVF        _estado+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_interrupt4
L_interrupt1:
;tarea4_10.c,20 :: 		INTCON.INT0IF = 0; // se borra el flag de la interrupción INT0
	BCF         INTCON+0, 1 
;tarea4_10.c,21 :: 		INTCON.INT1IF = 0;
	BCF         INTCON+0, 0 
;tarea4_10.c,22 :: 		}
L_end_interrupt:
L__interrupt9:
	RETFIE      1
; end of _interrupt

_main:

;tarea4_10.c,25 :: 		void main() {
;tarea4_10.c,26 :: 		ADCON1 = 0x07;
	MOVLW       7
	MOVWF       ADCON1+0 
;tarea4_10.c,27 :: 		TRISC.B0 = 0; //se configura el terminal RC0 como una salida digital
	BCF         TRISC+0, 0 
;tarea4_10.c,28 :: 		PORTC.B0 = 0; //se pone la salida RC0 a 0
	BCF         PORTC+0, 0 
;tarea4_10.c,29 :: 		TRISC=0;
	CLRF        TRISC+0 
;tarea4_10.c,31 :: 		TRISB.B0 = 1; //se configura RB0 como entrada
	BSF         TRISB+0, 0 
;tarea4_10.c,32 :: 		INTCON2.INTEDG0 = 1; //la interrupción la provoca un flanco de subida (x=1)/ bajada (x=0)
	BSF         INTCON2+0, 6 
;tarea4_10.c,33 :: 		INTCON.INT0IF = 0; // se pone el flag de la interrupción INT0 a 0
	BCF         INTCON+0, 1 
;tarea4_10.c,34 :: 		INTCON.INT0IE = 1; // se habilita la interrupción INT0
	BSF         INTCON+0, 4 
;tarea4_10.c,37 :: 		TRISB.B1 = 1; // se configura RB1 como entrada
	BSF         TRISB+0, 1 
;tarea4_10.c,38 :: 		INTCON2.INTEDG1 = 1; // la interrupción la provoca un flanco de subida (x=1) / bajada (x=0)
	BSF         INTCON2+0, 5 
;tarea4_10.c,39 :: 		INTCON3.INT1IF = 0; // se pone el flag de la interrupción INT1 a 0
	BCF         INTCON3+0, 0 
;tarea4_10.c,40 :: 		INTCON3.INT1IE = 1; // se habilita la interrupción INT1
	BSF         INTCON3+0, 3 
;tarea4_10.c,41 :: 		INTCON.GIE = 1; // se habilitan las interrupciones en general
	BSF         INTCON+0, 7 
;tarea4_10.c,43 :: 		while(1);
L_main6:
	GOTO        L_main6
;tarea4_10.c,44 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
