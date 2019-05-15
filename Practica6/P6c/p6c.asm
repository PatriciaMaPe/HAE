
_interrupt:

;p6c.c,3 :: 		void interrupt()
;p6c.c,5 :: 		if(INTCON3.INT1IF && INTCON3.INT1IE){
	BTFSS       INTCON3+0, 0 
	GOTO        L_interrupt2
	BTFSS       INTCON3+0, 3 
	GOTO        L_interrupt2
L__interrupt8:
;p6c.c,6 :: 		PORTC.B0=1;
	BSF         PORTC+0, 0 
;p6c.c,7 :: 		T0CON = 0x86;
	MOVLW       134
	MOVWF       T0CON+0 
;p6c.c,8 :: 		TMR0H = (3036>>8);
	MOVLW       11
	MOVWF       TMR0H+0 
;p6c.c,9 :: 		TMR0L = 3036; //se carga el valor inicial (alfa) del ‘contador’
	MOVLW       220
	MOVWF       TMR0L+0 
;p6c.c,10 :: 		INTCON.TMR0IF = 1;
	BSF         INTCON+0, 2 
;p6c.c,11 :: 		INTCON3.INT1IF = 0;
	BCF         INTCON3+0, 0 
;p6c.c,12 :: 		INTCON3.INT1IE = 0;
	BCF         INTCON3+0, 3 
;p6c.c,14 :: 		}
L_interrupt2:
;p6c.c,16 :: 		if(INTCON.TMR0IF){
	BTFSS       INTCON+0, 2 
	GOTO        L_interrupt3
;p6c.c,17 :: 		if(cont<15){
	MOVLW       15
	SUBWF       _cont+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_interrupt4
;p6c.c,19 :: 		TMR0H = (3036>>8);
	MOVLW       11
	MOVWF       TMR0H+0 
;p6c.c,20 :: 		TMR0L = 3036; //se carga el valor inicial (alfa) del ‘contador’
	MOVLW       220
	MOVWF       TMR0L+0 
;p6c.c,21 :: 		cont++;
	INCF        _cont+0, 1 
;p6c.c,24 :: 		}else{
	GOTO        L_interrupt5
L_interrupt4:
;p6c.c,25 :: 		T0CON.TMR0ON = 0;
	BCF         T0CON+0, 7 
;p6c.c,26 :: 		PORTC.B0=0;
	BCF         PORTC+0, 0 
;p6c.c,27 :: 		cont=0;
	CLRF        _cont+0 
;p6c.c,28 :: 		}
L_interrupt5:
;p6c.c,30 :: 		}
L_interrupt3:
;p6c.c,31 :: 		INTCON.TMR0IF = 0; // se borra el flag
	BCF         INTCON+0, 2 
;p6c.c,32 :: 		INTCON3.INT1IF = 0; // se borra el flag de la interrupción INT1
	BCF         INTCON3+0, 0 
;p6c.c,34 :: 		}
L_end_interrupt:
L__interrupt10:
	RETFIE      1
; end of _interrupt

_main:

;p6c.c,35 :: 		void main()
;p6c.c,38 :: 		ADCON1 = 0x07; //configuración de los canales analógicos (AN) como digitales (PIC18F452)
	MOVLW       7
	MOVWF       ADCON1+0 
;p6c.c,39 :: 		TRISC = 0; // salida digital
	CLRF        TRISC+0 
;p6c.c,40 :: 		PORTC = 0;
	CLRF        PORTC+0 
;p6c.c,43 :: 		TRISB.B1 = 1; // se configura RB1 como entrada
	BSF         TRISB+0, 1 
;p6c.c,46 :: 		INTCON2.INTEDG1 = 1; //la interrupción la provoca un flanco de subida (x=1)/ bajada (x=0)
	BSF         INTCON2+0, 5 
;p6c.c,47 :: 		INTCON3.INT1IF = 0; // se pone el flag de la interrupción INT1 a 0
	BCF         INTCON3+0, 0 
;p6c.c,48 :: 		INTCON3.INT1IE = 1; // se habilita la interrupción INT1
	BSF         INTCON3+0, 3 
;p6c.c,51 :: 		INTCON.TMR0IF = 0; // se pone el flag a 0
	BCF         INTCON+0, 2 
;p6c.c,52 :: 		INTCON.TMR0IE = 1; // se habilita la interrupción del Timer 0
	BSF         INTCON+0, 5 
;p6c.c,54 :: 		INTCON.GIE = 1; // se habilitan las interrupciones en general
	BSF         INTCON+0, 7 
;p6c.c,56 :: 		cont = 0;
	CLRF        _cont+0 
;p6c.c,58 :: 		while(1)
L_main6:
;p6c.c,59 :: 		asm nop;
	NOP
	GOTO        L_main6
;p6c.c,60 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
