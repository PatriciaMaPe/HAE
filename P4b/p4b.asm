
_interrupt:

;p4b.c,8 :: 		void interrupt() //rutina de servicio de interrupciones (MikroC)
;p4b.c,10 :: 		char i=0;
	CLRF        interrupt_i_L0+0 
;p4b.c,11 :: 		if(giro360==0){
	MOVF        _giro360+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt0
;p4b.c,12 :: 		PORTC = 0x04; //(B)
	MOVLW       4
	MOVWF       PORTC+0 
;p4b.c,13 :: 		delay_ms(200);
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
;p4b.c,14 :: 		PORTC = 0x08;//(A)
	MOVLW       8
	MOVWF       PORTC+0 
;p4b.c,15 :: 		delay_ms(200);
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
;p4b.c,16 :: 		PORTC = 0x01;//(D)
	MOVLW       1
	MOVWF       PORTC+0 
;p4b.c,17 :: 		delay_ms(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_interrupt3:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt3
	DECFSZ      R12, 1, 1
	BRA         L_interrupt3
	DECFSZ      R11, 1, 1
	BRA         L_interrupt3
;p4b.c,18 :: 		PORTC = 0x03;//(DyC)
	MOVLW       3
	MOVWF       PORTC+0 
;p4b.c,20 :: 		giro360=1;
	MOVLW       1
	MOVWF       _giro360+0 
;p4b.c,21 :: 		}
L_interrupt0:
;p4b.c,23 :: 		if(PORTB.B0==0 && giro360==1){
	BTFSC       PORTB+0, 0 
	GOTO        L_interrupt6
	MOVF        _giro360+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt6
L__interrupt18:
;p4b.c,24 :: 		for(i=0;i<2;i++){
	CLRF        interrupt_i_L0+0 
L_interrupt7:
	MOVLW       2
	SUBWF       interrupt_i_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_interrupt8
;p4b.c,25 :: 		PORTC = 0x01; //(D)
	MOVLW       1
	MOVWF       PORTC+0 
;p4b.c,26 :: 		delay_ms(200);
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
;p4b.c,27 :: 		PORTC = 0x08;//(A)
	MOVLW       8
	MOVWF       PORTC+0 
;p4b.c,28 :: 		delay_ms(200);
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
;p4b.c,29 :: 		PORTC = 0x04;//(B)
	MOVLW       4
	MOVWF       PORTC+0 
;p4b.c,30 :: 		delay_ms(200);
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
;p4b.c,31 :: 		PORTC = 0x02;//(C)
	MOVLW       2
	MOVWF       PORTC+0 
;p4b.c,32 :: 		delay_ms(200);
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
;p4b.c,24 :: 		for(i=0;i<2;i++){
	INCF        interrupt_i_L0+0, 1 
;p4b.c,33 :: 		}
	GOTO        L_interrupt7
L_interrupt8:
;p4b.c,34 :: 		PORTC = 0x03;//(CyD)
	MOVLW       3
	MOVWF       PORTC+0 
;p4b.c,35 :: 		}
L_interrupt6:
;p4b.c,36 :: 		INTCON.INT0IF = 0; // se borra el flag de la interrupción INT0
	BCF         INTCON+0, 1 
;p4b.c,37 :: 		}
L_end_interrupt:
L__interrupt20:
	RETFIE      1
; end of _interrupt

_main:

;p4b.c,39 :: 		void main()
;p4b.c,41 :: 		ADCON1 = 0x07; //configuración de los canales analógicos (AN) como digitales
	MOVLW       7
	MOVWF       ADCON1+0 
;p4b.c,44 :: 		TRISC = 0; //se declara el terminal RC0 como una salida digital
	CLRF        TRISC+0 
;p4b.c,45 :: 		TRISB.B0 = 1;
	BSF         TRISB+0, 0 
;p4b.c,51 :: 		PORTC = 0x01;
	MOVLW       1
	MOVWF       PORTC+0 
;p4b.c,52 :: 		delay_ms(200);
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
;p4b.c,53 :: 		PORTC = 0x02;
	MOVLW       2
	MOVWF       PORTC+0 
;p4b.c,54 :: 		delay_ms(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_main15:
	DECFSZ      R13, 1, 1
	BRA         L_main15
	DECFSZ      R12, 1, 1
	BRA         L_main15
	DECFSZ      R11, 1, 1
	BRA         L_main15
;p4b.c,55 :: 		PORTC = 0x06;
	MOVLW       6
	MOVWF       PORTC+0 
;p4b.c,59 :: 		TRISB.B0 = 1; //se configura RB0 como entrada
	BSF         TRISB+0, 0 
;p4b.c,60 :: 		INTCON2.INTEDG0 = 0; //la interrupción la provoca un flanco de subida (x=1)/ bajada (x=0)
	BCF         INTCON2+0, 6 
;p4b.c,61 :: 		INTCON.INT0IF = 0; // se pone el flag de la interrupción INT0 a 0
	BCF         INTCON+0, 1 
;p4b.c,62 :: 		INTCON.INT0IE = 1; // se habilita la interrupción INT0
	BSF         INTCON+0, 4 
;p4b.c,63 :: 		INTCON.GIE = 1; // se habilitan las interrupciones en general
	BSF         INTCON+0, 7 
;p4b.c,65 :: 		while(1)
L_main16:
;p4b.c,69 :: 		}
	GOTO        L_main16
;p4b.c,70 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
