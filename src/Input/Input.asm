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
; Propmpt for a key press
;-------------------------------

		ld de,stringpressakey 			; Address of string
 		ld bc,eostrpressakey-stringpressakey	; Length of string to print
 		call 8252 				; Print the string

outerloop:
		ld a, 13				; Load new line into register A
		call 16					; Restart 16

keypress:	call 654				; Fetch keypress status (https://skoolkid.github.io/rom/asm/028E.html)

		ld a, e					; Call 654 sets E to 00 - 27 if a key has been pressed and FF if no key
		cp $FF					; has been pressed, so we move E to A then compare it to FF if the compare
							; is equal, the zero flag is set

		jr z, keypress         			; Jump to keypress if z is zero, meaning no key was pressed

		ld de,stringcontinue 			; Address of string
 		ld bc,eostrcontinue-stringcontinue 	; Length of string to print
 		call 8252 				; Print the string

keylift:	call 654				; Do the same again, but wait for the key to be lifted
		ld a, e
		cp $FF
		jr nz, keylift				; We want the compare to set the zero flag

		jp outerloop				; Loop forever

;-------------------------------

stringpressakey defb 'Press any key...'			; The string to print
eostrpressakey 	equ $					;

stringcontinue 	defb 'Key press detected!'		; The string to print
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