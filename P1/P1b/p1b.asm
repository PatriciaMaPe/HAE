
_main:

;p1b.c,4 :: 		void main() {
;p1b.c,5 :: 		TRISC = 0x00;
	CLRF        TRISC+0 
;p1b.c,6 :: 		PORTC = 0x00;
	CLRF        PORTC+0 
;p1b.c,7 :: 		cont = 0;
	CLRF        _cont+0 
;p1b.c,8 :: 		PORTC.B0 = 1;
	BSF         PORTC+0, 0 
;p1b.c,9 :: 		delay_ms(2000);
	MOVLW       21
	MOVWF       R11, 0
	MOVLW       75
	MOVWF       R12, 0
	MOVLW       190
	MOVWF       R13, 0
L_main0:
	DECFSZ      R13, 1, 1
	BRA         L_main0
	DECFSZ      R12, 1, 1
	BRA         L_main0
	DECFSZ      R11, 1, 1
	BRA         L_main0
	NOP
;p1b.c,10 :: 		while(1){
L_main1:
;p1b.c,11 :: 		if(cont==8){
	MOVF        _cont+0, 0 
	XORLW       8
	BTFSS       STATUS+0, 2 
	GOTO        L_main3
;p1b.c,12 :: 		cont = 0;
	CLRF        _cont+0 
;p1b.c,13 :: 		}
L_main3:
;p1b.c,14 :: 		PORTC = leds[cont];
	MOVLW       _leds+0
	MOVWF       FSR0 
	MOVLW       hi_addr(_leds+0)
	MOVWF       FSR0H 
	MOVF        _cont+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       PORTC+0 
;p1b.c,15 :: 		delay_ms(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_main4:
	DECFSZ      R13, 1, 1
	BRA         L_main4
	DECFSZ      R12, 1, 1
	BRA         L_main4
	DECFSZ      R11, 1, 1
	BRA         L_main4
;p1b.c,16 :: 		cont++;
	INCF        _cont+0, 1 
;p1b.c,17 :: 		PORTC = 0x00;
	CLRF        PORTC+0 
;p1b.c,18 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main5:
	DECFSZ      R13, 1, 1
	BRA         L_main5
	DECFSZ      R12, 1, 1
	BRA         L_main5
	DECFSZ      R11, 1, 1
	BRA         L_main5
	NOP
;p1b.c,19 :: 		}
	GOTO        L_main1
;p1b.c,20 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
