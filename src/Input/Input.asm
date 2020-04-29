;-------------------------------
; 006 - Input
;-------------------------------

	device zxspectrumnext

	cspectmap "Input.map"

	org $8000

;-------------------------------

RED 			equ 2
WHITE_INK_BLACK_PAPER	equ 7

UPPER_SCREEN 		equ 2			; Set a constant for the upper screen
;-------------------------------

start:

;-------------------------------
; Screen Setup
;-------------------------------

		ld a,RED				; Set register A to the colour of RED (2)
		out (254),a				; Change the border to RED

        	ld a, WHITE_INK_BLACK_PAPER		; Colour seven is white ink and black paper
        	ld (23693),a       			; This sets the screen colour as defined by the accumulator (A)
        	call 3503          			; Calls a routine to clear the screen

		ld a, UPPER_SCREEN			; Use the upper screeen for printing
		call 5633				; Set the output channel for printing

;-------------------------------
; Propmpt for input
;-------------------------------

		ld de,stringpressakey 			; Address of string
 		ld bc,eostrpressakey-stringpressakey	; Length of string to print
 		call 8252 				; Print the string

keypress	call 654				; fetch keypress status
		inc e					; ???????? WHY do we need to increment e?
		jr z,keypress          			; yes, so no key pressed.

		ld a, 13				; Load new line into register A
		rst 16					; Restart 16

		ld de,stringcontinue 			; Address of string
 		ld bc,eostrcontinue-stringcontinue 	; Length of string to print
 		call 8252 				; Print the string

		jp $					; Loop forever

;-------------------------------

stringpressakey defb 'Press any key to continue...'	; The string to print
eostrpressakey 	equ $					;

stringcontinue 	defb 'Continuing!'			; The string to print
eostrcontinue 	equ $	

;-------------------------------

	DISPLAY ">------------- Code Range           = ",/H,start,"-",$
	DISPLAY ">------------- Code Length (Bytes)  = ",/D,$-start
	DISPLAY ">------------- Code Space Remaining = ",/D,$c000-$

	; write everything into NEX file
	savenex open "Input.nex", start, $ff40
	savenex core 2, 0, 0        ; Next core 2.0.0 required as minimum
	savenex cfg 7,0,0,0
	savenex auto