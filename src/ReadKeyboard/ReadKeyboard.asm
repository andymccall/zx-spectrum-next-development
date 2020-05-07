;-------------------------------
; 006 - Input
;-------------------------------

	device zxspectrumnext

	cspectmap "ReadKeyboard.map"

	org $8000

;-------------------------------

RED 			equ 2
WHITE_INK_BLACK_PAPER	equ 7

UPPER_SCREEN 		equ 2				; Set a constant for the upper screen

KEYCHAR_ENTER 		equ 13
KEYCHAR_BACKSPACE 	equ 12

;-------------------------------

start:

		ei					; Enable interrupts

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
; Propmpt for a key press
;-------------------------------

		ld de,strpressakey 			; Address of string
 		ld bc,eostrpressakey-strpressakey	; Length of string to print
 		call 8252 				; Print the string
 		call newline

loop:

		ld hl,23560         			; LAST K system variable.
		ld (hl),0           			; put null value there.
keypress:	ld a,(hl)           			; new value of LAST K.
       		cp 0                			; is it still zero?
       		jr z, keypress          		; yes, so no key pressed.

       		cp KEYCHAR_ENTER			; is the character a enter?
       		jr z, newline				; if so jump to newline

		rst 16					; Call 16 to print out the contents of A


		call loop

;-------------------------------
; Subroutines
;-------------------------------

backspace:
		ld a, 12
		rst 16
		ret

newline:
		ld a,13					;Carriage return
		rst 16
		ret

;-------------------------------
; Variables
;-------------------------------

strpressakey 	defb 'Type away...'			; The string to print
eostrpressakey 	equ $					;

;-------------------------------

	DISPLAY ">------------- Code Range           = ",/H,start,"-",$
	DISPLAY ">------------- Code Length (Bytes)  = ",/D,$-start
	DISPLAY ">------------- Code Space Remaining = ",/D,$c000-$

	; write everything into NEX file
	savenex open "ReadKeyboard.nex", start, $ff40
	savenex core 2, 0, 0        ; Next core 2.0.0 required as minimum
	savenex cfg 7,0,0,0
	savenex auto