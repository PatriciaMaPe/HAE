
_interrupt:

;p7b.c,20 :: 		void interrupt()
;p7b.c,22 :: 		if(INTCON.TMR0IF){
	BTFSS       INTCON+0, 2 
	GOTO        L_interrupt0
;p7b.c,23 :: 		ADCON0.GO = 1;
	BSF         ADCON0+0, 2 
;p7b.c,25 :: 		TMR0H = (18661>>8);
	MOVLW       72
	MOVWF       TMR0H+0 
;p7b.c,26 :: 		TMR0L = 18661;
	MOVLW       229
	MOVWF       TMR0L+0 
;p7b.c,27 :: 		INTCON.TMR0IF = 0; // se borra el flag timer
	BCF         INTCON+0, 2 
;p7b.c,28 :: 		}
L_interrupt0:
;p7b.c,30 :: 		if(PIR1.ADIF){
	BTFSS       PIR1+0, 6 
	GOTO        L_interrupt1
;p7b.c,31 :: 		aux = (ADRESL >> 6);
	MOVLW       6
	MOVWF       R1 
	MOVF        ADRESL+0, 0 
	MOVWF       R0 
	MOVF        R1, 0 
L__interrupt6:
	BZ          L__interrupt7
	RRCF        R0, 1 
	BCF         R0, 7 
	ADDLW       255
	GOTO        L__interrupt6
L__interrupt7:
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
;p7b.c,32 :: 		aux = aux + (ADRESH << 2);
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
;p7b.c,33 :: 		aux = aux * 0.0048828;
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
;p7b.c,34 :: 		aux = aux * 100.0; //Vout * 100 = Cº
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       72
	MOVWF       R6 
	MOVLW       133
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
;p7b.c,37 :: 		FloatToStr(aux, txt);
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
;p7b.c,38 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;p7b.c,39 :: 		Lcd_out(1,1, txt);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;p7b.c,42 :: 		PIR1.ADIF = 0;
	BCF         PIR1+0, 6 
;p7b.c,44 :: 		}
L_interrupt1:
;p7b.c,46 :: 		}
L_end_interrupt:
L__interrupt5:
	RETFIE      1
; end of _interrupt

_main:

;p7b.c,48 :: 		void main()
;p7b.c,51 :: 		TRISE.B1 = 1; //se configura el terminal RE1 como entrada
	BSF         TRISE+0, 1 
;p7b.c,53 :: 		ADCON0 = 0x71;
	MOVLW       113
	MOVWF       ADCON0+0 
;p7b.c,54 :: 		ADCON1 = 0x40;
	MOVLW       64
	MOVWF       ADCON1+0 
;p7b.c,57 :: 		PIR1.ADIF = 0;
	BCF         PIR1+0, 6 
;p7b.c,58 :: 		PIE1.ADIE = 1;
	BSF         PIE1+0, 6 
;p7b.c,59 :: 		INTCON.PEIE = 1;
	BSF         INTCON+0, 6 
;p7b.c,60 :: 		INTCON.GIE = 1;
	BSF         INTCON+0, 7 
;p7b.c,63 :: 		T0CON = 0x04;
	MOVLW       4
	MOVWF       T0CON+0 
;p7b.c,64 :: 		INTCON.TMR0IF = 0; // se pone el flag a 0
	BCF         INTCON+0, 2 
;p7b.c,65 :: 		INTCON.TMR0IE = 1; // se habilita la interrupción del Timer 0
	BSF         INTCON+0, 5 
;p7b.c,67 :: 		TMR0H = (18661>>8);
	MOVLW       72
	MOVWF       TMR0H+0 
;p7b.c,68 :: 		TMR0L = 18661;
	MOVLW       229
	MOVWF       TMR0L+0 
;p7b.c,70 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;p7b.c,72 :: 		T0CON.TMR0ON = 1;
	BSF         T0CON+0, 7 
;p7b.c,74 :: 		while(1)
L_main2:
;p7b.c,75 :: 		asm nop;
	NOP
	GOTO        L_main2
;p7b.c,76 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
