
_interrupt:

;p4b.c,3 :: 		void interrupt()
;p4b.c,5 :: 		if(giro360==0){
	MOVF        _giro360+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt0
;p4b.c,6 :: 		PORTC = 0x02; //(C)
	MOVLW       2
	MOVWF       PORTC+0 
;p4b.c,7 :: 		delay_ms(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_interrupt1:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt1
	DECFSZ      R12, 1, 1
	BRA         L_interrupt1
	DECFSZ      R11, 1, 1
	BRA         L_interrupt1
;p4b.c,8 :: 		PORTC = 0x06;//(BC)
	MOVLW       6
	MOVWF       PORTC+0 
;p4b.c,9 :: 		delay_ms(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_interrupt2:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt2
	DECFSZ      R12, 1, 1
	BRA         L_interrupt2
	DECFSZ      R11, 1, 1
	BRA         L_interrupt2
;p4b.c,10 :: 		PORTC = 0x04;//(B)
	MOVLW       4
	MOVWF       PORTC+0 
;p4b.c,12 :: 		giro360=1;
	MOVLW       1
	MOVWF       _giro360+0 
;p4b.c,13 :: 		}
L_interrupt0:
;p4b.c,15 :: 		if(PORTB.B0==0 && giro360==1){
	BTFSC       PORTB+0, 0 
	GOTO        L_interrupt5
	MOVF        _giro360+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt5
L__interrupt17:
;p4b.c,16 :: 		PORTC = 0x06; //(BC)
	MOVLW       6
	MOVWF       PORTC+0 
;p4b.c,17 :: 		delay_ms(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_interrupt6:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt6
	DECFSZ      R12, 1, 1
	BRA         L_interrupt6
	DECFSZ      R11, 1, 1
	BRA         L_interrupt6
;p4b.c,18 :: 		PORTC = 0x02;//(C)
	MOVLW       2
	MOVWF       PORTC+0 
;p4b.c,19 :: 		delay_ms(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_interrupt7:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt7
	DECFSZ      R12, 1, 1
	BRA         L_interrupt7
	DECFSZ      R11, 1, 1
	BRA         L_interrupt7
;p4b.c,20 :: 		PORTC = 0x03;//(CD)
	MOVLW       3
	MOVWF       PORTC+0 
;p4b.c,21 :: 		delay_ms(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_interrupt8:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt8
	DECFSZ      R12, 1, 1
	BRA         L_interrupt8
	DECFSZ      R11, 1, 1
	BRA         L_interrupt8
;p4b.c,22 :: 		PORTC = 0x01;//(D)
	MOVLW       1
	MOVWF       PORTC+0 
;p4b.c,23 :: 		delay_ms(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_interrupt9:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt9
	DECFSZ      R12, 1, 1
	BRA         L_interrupt9
	DECFSZ      R11, 1, 1
	BRA         L_interrupt9
;p4b.c,24 :: 		PORTC = 0x09;//(DA)
	MOVLW       9
	MOVWF       PORTC+0 
;p4b.c,25 :: 		delay_ms(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_interrupt10:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt10
	DECFSZ      R12, 1, 1
	BRA         L_interrupt10
	DECFSZ      R11, 1, 1
	BRA         L_interrupt10
;p4b.c,26 :: 		PORTC = 0x08;//(A)
	MOVLW       8
	MOVWF       PORTC+0 
;p4b.c,27 :: 		delay_ms(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_interrupt11:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt11
	DECFSZ      R12, 1, 1
	BRA         L_interrupt11
	DECFSZ      R11, 1, 1
	BRA         L_interrupt11
;p4b.c,28 :: 		PORTC = 0x0C;//(AB)
	MOVLW       12
	MOVWF       PORTC+0 
;p4b.c,29 :: 		delay_ms(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_interrupt12:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt12
	DECFSZ      R12, 1, 1
	BRA         L_interrupt12
	DECFSZ      R11, 1, 1
	BRA         L_interrupt12
;p4b.c,30 :: 		PORTC = 0x04;//(B)
	MOVLW       4
	MOVWF       PORTC+0 
;p4b.c,31 :: 		delay_ms(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_interrupt13:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt13
	DECFSZ      R12, 1, 1
	BRA         L_interrupt13
	DECFSZ      R11, 1, 1
	BRA         L_interrupt13
;p4b.c,33 :: 		}
L_interrupt5:
;p4b.c,34 :: 		INTCON.INT0IF = 0; // se borra el flag de la interrupción INT0
	BCF         INTCON+0, 1 
;p4b.c,35 :: 		}
L_end_interrupt:
L__interrupt19:
	RETFIE      1
; end of _interrupt

_main:

;p4b.c,37 :: 		void main()
;p4b.c,39 :: 		ADCON1 = 0x07; //configuración de los canales analógicos (AN) como digitales
	MOVLW       7
	MOVWF       ADCON1+0 
;p4b.c,42 :: 		TRISC = 0; //se declara el terminal RC0 como una salida digital
	CLRF        TRISC+0 
;p4b.c,43 :: 		TRISB.B0 = 1;
	BSF         TRISB+0, 0 
;p4b.c,45 :: 		PORTC = 0x01; //(D)
	MOVLW       1
	MOVWF       PORTC+0 
;p4b.c,46 :: 		delay_ms(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_main14:
	DECFSZ      R13, 1, 1
	BRA         L_main14
	DECFSZ      R12, 1, 1
	BRA         L_main14
	DECFSZ      R11, 1, 1
	BRA         L_main14
;p4b.c,47 :: 		PORTC = 0x03; //(DC)
	MOVLW       3
	MOVWF       PORTC+0 
;p4b.c,50 :: 		TRISB.B0 = 1; //se configura RB0 como entrada
	BSF         TRISB+0, 0 
;p4b.c,51 :: 		INTCON2.INTEDG0 = 0; //la interrupción la provoca un flanco de subida (x=1)/ bajada (x=0)
	BCF         INTCON2+0, 6 
;p4b.c,52 :: 		INTCON.INT0IF = 0; // se pone el flag de la interrupción INT0 a 0
	BCF         INTCON+0, 1 
;p4b.c,53 :: 		INTCON.INT0IE = 1; // se habilita la interrupción INT0
	BSF         INTCON+0, 4 
;p4b.c,54 :: 		INTCON.GIE = 1; // se habilitan las interrupciones en general
	BSF         INTCON+0, 7 
;p4b.c,56 :: 		while(1);
L_main15:
	GOTO        L_main15
;p4b.c,57 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
