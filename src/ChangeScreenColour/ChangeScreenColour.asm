;-------------------------------
; 003 - Change Screen Colour
;-------------------------------

	device zxspectrumnext

	cspectmap "ChangeScreenColour.map"

	org $8000

;-------------------------------

RED 			equ 2
WHITE_INK_BLACK_PAPER	equ 7
UPPER_SCREEN		equ 2

;-------------------------------

start:

	ld a,RED			; Set register a to the colour of RED (2)
	out (254),a			; Change the border to RED

        ld a,WHITE_INK_BLACK_PAPER	; Colour seven is white ink and black paper
        ld (23693),a       		; This sets the screen colour as defined by the accumulator (a)
        call 3503          		; Calls a routine to clear the screen

	ld a, UPPER_SCREEN		; Use the upper screeen for printing
	call 5633			; Set the output channel for printing

	ld de,string 			; Address of string
 	ld bc,eostr-string 		; Length of string to print
 	call 8252 			; Print the string

	jp $				; Loop forever

;-------------------------------

string defb 'Hello World!'		; The string to print
eostr equ $				;

;-------------------------------

	DISPLAY ">------------- Code Range           = ",/H,start,"-",$
	DISPLAY ">------------- Code Length (Bytes)  = ",/D,$-start
	DISPLAY ">------------- Code Space Remaining = ",/D,$c000-$

	; write everything into NEX file
	savenex open "ChangeScreenColour.nex", start, $ff40
	savenex core 2, 0, 0        ; Next core 2.0.0 required as minimum
	savenex cfg 7,0,0,0
	savenex auto