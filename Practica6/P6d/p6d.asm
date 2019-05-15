
_interrupt:

;p6d.c,23 :: 		void interrupt(){
;p6d.c,24 :: 		if( (INTCON.RBIF)  ){
	BTFSS       INTCON+0, 0 
	GOTO        L_interrupt0
;p6d.c,25 :: 		x = PORTB;
	MOVF        PORTB+0, 0 
	MOVWF       _x+0 
;p6d.c,26 :: 		INTCON.RBIF = 0;
	BCF         INTCON+0, 0 
;p6d.c,27 :: 		cont++; // El contador vale 1 cuando comienza el pulso y 2 cuando termina
	INCF        _cont+0, 1 
;p6d.c,28 :: 		if(cont == 1){ // Comienza el pulso ? comienza temporización
	MOVF        _cont+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt1
;p6d.c,29 :: 		TMR0H = (0 >> 8);
	CLRF        TMR0H+0 
;p6d.c,30 :: 		TMR0L = 0;
	CLRF        TMR0L+0 
;p6d.c,31 :: 		Lcd_Out_CP("Calculando...");
	MOVLW       ?lstr1_p6d+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr1_p6d+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;p6d.c,32 :: 		}else{
	GOTO        L_interrupt2
L_interrupt1:
;p6d.c,33 :: 		y = TMR0L;
	MOVF        TMR0L+0, 0 
	MOVWF       _y+0 
	MOVLW       0
	MOVWF       _y+1 
;p6d.c,34 :: 		y = y + (TMR0H << 8);
	MOVF        TMR0H+0, 0 
	MOVWF       R1 
	CLRF        R0 
	MOVF        R0, 0 
	ADDWF       _y+0, 0 
	MOVWF       R5 
	MOVF        R1, 0 
	ADDWFC      _y+1, 0 
	MOVWF       R6 
	MOVF        R5, 0 
	MOVWF       _y+0 
	MOVF        R6, 0 
	MOVWF       _y+1 
;p6d.c,35 :: 		T0CON.B7 = 0; // Si el pulso finaliza se para el timer
	BCF         T0CON+0, 7 
;p6d.c,36 :: 		tiempo = (y + (desbor*65536)) * 0.000128;
	CLRF        R3 
	MOVF        _desbor+0, 0 
	MOVWF       R2 
	CLRF        R0 
	CLRF        R1 
	MOVF        R5, 0 
	ADDWF       R0, 1 
	MOVF        R6, 0 
	ADDWFC      R1, 1 
	MOVLW       0
	ADDWFC      R2, 1 
	ADDWFC      R3, 1 
	CALL        _longint2double+0, 0
	MOVLW       189
	MOVWF       R4 
	MOVLW       55
	MOVWF       R5 
	MOVLW       6
	MOVWF       R6 
	MOVLW       114
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _tiempo+0 
	MOVF        R1, 0 
	MOVWF       _tiempo+1 
	MOVF        R2, 0 
	MOVWF       _tiempo+2 
	MOVF        R3, 0 
	MOVWF       _tiempo+3 
;p6d.c,40 :: 		FloatToStr (tiempo, txt);
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
;p6d.c,41 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;p6d.c,42 :: 		Lcd_out(1,1, txt);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;p6d.c,43 :: 		Lcd_Out_CP(" sec");
	MOVLW       ?lstr2_p6d+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr2_p6d+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;p6d.c,44 :: 		}
L_interrupt2:
;p6d.c,45 :: 		}
L_interrupt0:
;p6d.c,47 :: 		if((INTCON.TMR0IF)){
	BTFSS       INTCON+0, 2 
	GOTO        L_interrupt3
;p6d.c,48 :: 		INTCON.TMR0IF = 0;
	BCF         INTCON+0, 2 
;p6d.c,49 :: 		desbor++;
	INCF        _desbor+0, 1 
;p6d.c,50 :: 		TMR0H = (0 >> 8);
	CLRF        TMR0H+0 
;p6d.c,51 :: 		TMR0L = 0;
	CLRF        TMR0L+0 
;p6d.c,52 :: 		}
L_interrupt3:
;p6d.c,53 :: 		}
L_end_interrupt:
L__interrupt7:
	RETFIE      1
; end of _interrupt

_main:

;p6d.c,54 :: 		void main() {
;p6d.c,55 :: 		ADCON1 = 0X07;
	MOVLW       7
	MOVWF       ADCON1+0 
;p6d.c,56 :: 		TRISD = 0;
	CLRF        TRISD+0 
;p6d.c,57 :: 		TRISB.B4 = 1;
	BSF         TRISB+0, 4 
;p6d.c,58 :: 		x = PORTB;
	MOVF        PORTB+0, 0 
	MOVWF       _x+0 
;p6d.c,59 :: 		INTCON.RBIF = 0;
	BCF         INTCON+0, 0 
;p6d.c,60 :: 		INTCON.RBIE = 1;
	BSF         INTCON+0, 3 
;p6d.c,61 :: 		T0CON = 0x87;
	MOVLW       135
	MOVWF       T0CON+0 
;p6d.c,62 :: 		INTCON.TMR0IF = 0;
	BCF         INTCON+0, 2 
;p6d.c,63 :: 		INTCON.TMR0IE = 1;
	BSF         INTCON+0, 5 
;p6d.c,64 :: 		INTCON.GIE = 1;
	BSF         INTCON+0, 7 
;p6d.c,65 :: 		Lcd_Init ();
	CALL        _Lcd_Init+0, 0
;p6d.c,66 :: 		while(1);
L_main4:
	GOTO        L_main4
;p6d.c,67 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
