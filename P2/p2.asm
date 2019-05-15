
_main:

;p2.c,6 :: 		void main() {
;p2.c,7 :: 		ADCON1 = 0x07;
	MOVLW       7
	MOVWF       ADCON1+0 
;p2.c,8 :: 		TRISD = 0x00;
	CLRF        TRISD+0 
;p2.c,9 :: 		TRISA = 0x00;
	CLRF        TRISA+0 
;p2.c,11 :: 		PORTD = 0x00;
	CLRF        PORTD+0 
;p2.c,12 :: 		PORTA = 0x03;
	MOVLW       3
	MOVWF       PORTA+0 
;p2.c,13 :: 		while(1){
L_main0:
;p2.c,15 :: 		for(dec=0;dec<10;dec++){
	CLRF        _dec+0 
L_main2:
	MOVLW       10
	SUBWF       _dec+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main3
;p2.c,16 :: 		for(uni=0;uni<10;uni++){
	CLRF        _uni+0 
L_main5:
	MOVLW       10
	SUBWF       _uni+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main6
;p2.c,17 :: 		for(t=0;t<25;t++){
	CLRF        _t+0 
L_main8:
	MOVLW       25
	SUBWF       _t+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main9
;p2.c,18 :: 		PORTA = 0x01;
	MOVLW       1
	MOVWF       PORTA+0 
;p2.c,19 :: 		PORTD = numero[dec];
	MOVLW       _numero+0
	MOVWF       FSR0 
	MOVLW       hi_addr(_numero+0)
	MOVWF       FSR0H 
	MOVF        _dec+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       PORTD+0 
;p2.c,20 :: 		delay_ms(20);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main11:
	DECFSZ      R13, 1, 1
	BRA         L_main11
	DECFSZ      R12, 1, 1
	BRA         L_main11
	NOP
	NOP
;p2.c,21 :: 		PORTA = 0x02;
	MOVLW       2
	MOVWF       PORTA+0 
;p2.c,22 :: 		PORTD = numero[uni];
	MOVLW       _numero+0
	MOVWF       FSR0 
	MOVLW       hi_addr(_numero+0)
	MOVWF       FSR0H 
	MOVF        _uni+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       PORTD+0 
;p2.c,23 :: 		delay_ms(20);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main12:
	DECFSZ      R13, 1, 1
	BRA         L_main12
	DECFSZ      R12, 1, 1
	BRA         L_main12
	NOP
	NOP
;p2.c,17 :: 		for(t=0;t<25;t++){
	INCF        _t+0, 1 
;p2.c,25 :: 		}
	GOTO        L_main8
L_main9:
;p2.c,16 :: 		for(uni=0;uni<10;uni++){
	INCF        _uni+0, 1 
;p2.c,27 :: 		}
	GOTO        L_main5
L_main6:
;p2.c,15 :: 		for(dec=0;dec<10;dec++){
	INCF        _dec+0, 1 
;p2.c,29 :: 		}
	GOTO        L_main2
L_main3:
;p2.c,30 :: 		}
	GOTO        L_main0
;p2.c,31 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
