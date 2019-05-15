
_interrupt:

;p5b.c,24 :: 		void interrupt() // se ha pulsado una tecla
;p5b.c,26 :: 		if(inicio){
	MOVF        _inicio+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_interrupt0
;p5b.c,27 :: 		Lcd_Out_CP ("Turno: ");
	MOVLW       ?lstr1_p5b+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr1_p5b+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;p5b.c,28 :: 		inicio=0;
	CLRF        _inicio+0 
;p5b.c,29 :: 		}
L_interrupt0:
;p5b.c,31 :: 		if(cont%2==0){
	MOVLW       1
	ANDWF       _cont+0, 0 
	MOVWF       R1 
	MOVF        R1, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt1
;p5b.c,32 :: 		ByteToStr(uni, txt);
	MOVF        _uni+0, 0 
	MOVWF       FARG_ByteToStr_input+0 
	MOVLW       _txt+0
	MOVWF       FARG_ByteToStr_output+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_ByteToStr_output+1 
	CALL        _ByteToStr+0, 0
;p5b.c,33 :: 		Lcd_out(1,7, txt);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       7
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;p5b.c,34 :: 		uni++;
	INCF        _uni+0, 1 
;p5b.c,35 :: 		}
L_interrupt1:
;p5b.c,37 :: 		x = PORTB; // para poder borrar el bit RBIF (define x global)
	MOVF        PORTB+0, 0 
	MOVWF       _x+0 
;p5b.c,38 :: 		INTCON.RBIF=0; // se borra el bit RBIF después de llamar a la función tecla()
	BCF         INTCON+0, 0 
;p5b.c,39 :: 		cont++;
	INCF        _cont+0, 1 
;p5b.c,40 :: 		}
L_end_interrupt:
L__interrupt5:
	RETFIE      1
; end of _interrupt

_main:

;p5b.c,42 :: 		void main()
;p5b.c,45 :: 		ADCON1 = 0x07; //configuración de los canales analógicos (AN) como digitales (PIC18F452)
	MOVLW       7
	MOVWF       ADCON1+0 
;p5b.c,46 :: 		TRISD = 0; // salida digital
	CLRF        TRISD+0 
;p5b.c,47 :: 		TRISB = 0xF0; // el nibble alto son entradas y el nibble bajo son salidas
	MOVLW       240
	MOVWF       TRISB+0 
;p5b.c,49 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;p5b.c,52 :: 		INTCON2.RBPU = 0; // se habilitan las resistencias de pullup del puerto B
	BCF         INTCON2+0, 7 
;p5b.c,54 :: 		INTCON.RBIF=0;   // se pone el flag de la interrupción a 0
	BCF         INTCON+0, 0 
;p5b.c,55 :: 		INTCON.RBIE=1;   // se habilita la interrupción por cambio de nivel
	BSF         INTCON+0, 3 
;p5b.c,56 :: 		INTCON.GIE = 1; // se habilitan las interrupciones en general
	BSF         INTCON+0, 7 
;p5b.c,58 :: 		uni=0;
	CLRF        _uni+0 
;p5b.c,59 :: 		cont=0;
	CLRF        _cont+0 
;p5b.c,60 :: 		inicio=1;
	MOVLW       1
	MOVWF       _inicio+0 
;p5b.c,63 :: 		INTCON.RBIF=1; //Se provoca artificialmente una interrupcion  por software
	BSF         INTCON+0, 0 
;p5b.c,65 :: 		while(1)
L_main2:
;p5b.c,66 :: 		asm nop;
	NOP
	GOTO        L_main2
;p5b.c,68 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
