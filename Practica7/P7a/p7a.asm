
_interrupt:

;p7a.c,20 :: 		void interrupt()
;p7a.c,22 :: 		aux = (ADRESL >> 6);
	MOVLW       6
	MOVWF       R1 
	MOVF        ADRESL+0, 0 
	MOVWF       R0 
	MOVF        R1, 0 
L__interrupt5:
	BZ          L__interrupt6
	RRCF        R0, 1 
	BCF         R0, 7 
	ADDLW       255
	GOTO        L__interrupt5
L__interrupt6:
	CALL        _byte2double+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__interrupt+0 
	MOVF        R1, 0 
	MOVWF       FLOC__interrupt+1 
	MOVF        R2, 0 
	MOVWF       FLOC__interrupt+2 
	MOVF        R3, 0 
	MOVWF       FLOC__interrupt+3 
	MOVF        FLOC__interrupt+0, 0 
	MOVWF       _aux+0 
	MOVF        FLOC__interrupt+1, 0 
	MOVWF       _aux+1 
	MOVF        FLOC__interrupt+2, 0 
	MOVWF       _aux+2 
	MOVF        FLOC__interrupt+3, 0 
	MOVWF       _aux+3 
;p7a.c,23 :: 		aux = aux + (ADRESH << 2);
	MOVF        ADRESH+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	CALL        _word2double+0, 0
	MOVF        FLOC__interrupt+0, 0 
	MOVWF       R4 
	MOVF        FLOC__interrupt+1, 0 
	MOVWF       R5 
	MOVF        FLOC__interrupt+2, 0 
	MOVWF       R6 
	MOVF        FLOC__interrupt+3, 0 
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _aux+0 
	MOVF        R1, 0 
	MOVWF       _aux+1 
	MOVF        R2, 0 
	MOVWF       _aux+2 
	MOVF        R3, 0 
	MOVWF       _aux+3 
;p7a.c,24 :: 		aux = aux * 0.0048828;
	MOVLW       229
	MOVWF       R4 
	MOVLW       255
	MOVWF       R5 
	MOVLW       31
	MOVWF       R6 
	MOVLW       119
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _aux+0 
	MOVF        R1, 0 
	MOVWF       _aux+1 
	MOVF        R2, 0 
	MOVWF       _aux+2 
	MOVF        R3, 0 
	MOVWF       _aux+3 
;p7a.c,27 :: 		FloatToStr(aux, txt);
	MOVF        R0, 0 
	MOVWF       FARG_FloatToStr_fnum+0 
	MOVF        R1, 0 
	MOVWF       FARG_FloatToStr_fnum+1 
	MOVF        R2, 0 
	MOVWF       FARG_FloatToStr_fnum+2 
	MOVF        R3, 0 
	MOVWF       FARG_FloatToStr_fnum+3 
	MOVLW       _txt+0
	MOVWF       FARG_FloatToStr_str+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_FloatToStr_str+1 
	CALL        _FloatToStr+0, 0
;p7a.c,28 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;p7a.c,29 :: 		Lcd_out(1,1, txt);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;p7a.c,31 :: 		PIR1.ADIF = 0;
	BCF         PIR1+0, 6 
;p7a.c,32 :: 		delay_ms(1000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_interrupt0:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt0
	DECFSZ      R12, 1, 1
	BRA         L_interrupt0
	DECFSZ      R11, 1, 1
	BRA         L_interrupt0
	NOP
	NOP
;p7a.c,33 :: 		ADCON0.GO = 1;
	BSF         ADCON0+0, 2 
;p7a.c,34 :: 		PORTC.B0=!PORTC.B0;
	BTG         PORTC+0, 0 
;p7a.c,35 :: 		}
L_end_interrupt:
L__interrupt4:
	RETFIE      1
; end of _interrupt

_main:

;p7a.c,37 :: 		void main()
;p7a.c,40 :: 		TRISA.B0 = 1; //se configura el terminal RA0 como entrada
	BSF         TRISA+0, 0 
;p7a.c,41 :: 		TRISC=0;
	CLRF        TRISC+0 
;p7a.c,42 :: 		PORTC=0;
	CLRF        PORTC+0 
;p7a.c,43 :: 		ADCON0 = 0x41;
	MOVLW       65
	MOVWF       ADCON0+0 
;p7a.c,44 :: 		ADCON1 = 0x40;
	MOVLW       64
	MOVWF       ADCON1+0 
;p7a.c,47 :: 		PIR1.ADIF = 0;
	BCF         PIR1+0, 6 
;p7a.c,48 :: 		PIE1.ADIE = 1;
	BSF         PIE1+0, 6 
;p7a.c,49 :: 		INTCON.PEIE = 1;
	BSF         INTCON+0, 6 
;p7a.c,50 :: 		INTCON.GIE = 1;
	BSF         INTCON+0, 7 
;p7a.c,52 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;p7a.c,54 :: 		ADCON0.GO = 1;
	BSF         ADCON0+0, 2 
;p7a.c,56 :: 		while(1)
L_main1:
;p7a.c,57 :: 		asm nop;
	NOP
	GOTO        L_main1
;p7a.c,58 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
