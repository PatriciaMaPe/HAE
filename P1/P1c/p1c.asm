
_main:

;p1c.c,5 :: 		void main() {
;p1c.c,6 :: 		TRISC = 0x00;
	CLRF        TRISC+0 
;p1c.c,7 :: 		PORTC = 0x00;
	CLRF        PORTC+0 
;p1c.c,9 :: 		while(1){
L_main0:
;p1c.c,11 :: 		ledsDer = (ledsDer >> 1);
	MOVF        _ledsDer+0, 0 
	MOVWF       R2 
	RRCF        R2, 1 
	BCF         R2, 7 
	MOVF        R2, 0 
	MOVWF       _ledsDer+0 
;p1c.c,12 :: 		ledsIzq = (ledsIzq << 1);
	MOVF        _ledsIzq+0, 0 
	MOVWF       R0 
	RLCF        R0, 1 
	BCF         R0, 0 
	MOVF        R0, 0 
	MOVWF       _ledsIzq+0 
;p1c.c,13 :: 		aux = ledsDer + ledsIzq;
	MOVF        R2, 0 
	ADDWF       R0, 1 
	MOVF        R0, 0 
	MOVWF       _aux+0 
;p1c.c,14 :: 		PORTC = aux;
	MOVF        R0, 0 
	MOVWF       PORTC+0 
;p1c.c,15 :: 		delay_ms(400);
	MOVLW       5
	MOVWF       R11, 0
	MOVLW       15
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main2:
	DECFSZ      R13, 1, 1
	BRA         L_main2
	DECFSZ      R12, 1, 1
	BRA         L_main2
	DECFSZ      R11, 1, 1
	BRA         L_main2
;p1c.c,16 :: 		PORTC = 0x00;
	CLRF        PORTC+0 
;p1c.c,17 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main3:
	DECFSZ      R13, 1, 1
	BRA         L_main3
	DECFSZ      R12, 1, 1
	BRA         L_main3
	DECFSZ      R11, 1, 1
	BRA         L_main3
	NOP
;p1c.c,19 :: 		if(ledsDer==0x08){
	MOVF        _ledsDer+0, 0 
	XORLW       8
	BTFSS       STATUS+0, 2 
	GOTO        L_main4
;p1c.c,20 :: 		ledsDer = ledsDer >> 1;
	RRCF        _ledsDer+0, 1 
	BCF         _ledsDer+0, 7 
;p1c.c,21 :: 		ledsIzq = ledsIzq << 1;
	RLCF        _ledsIzq+0, 1 
	BCF         _ledsIzq+0, 0 
;p1c.c,22 :: 		}
L_main4:
;p1c.c,23 :: 		}
	GOTO        L_main0
;p1c.c,24 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
