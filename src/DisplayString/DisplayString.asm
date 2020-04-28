;-------------------------------
; 002 - Display a string
;-------------------------------

	device zxspectrumnext

	cspectmap "DisplayString.map"

	org $8000

;-------------------------------

UPPER_SCREEN equ 2			; Set a constant for the upper screen

;-------------------------------

start:
	ld a, UPPER_SCREEN		; Use the upper screen for printing
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
	savenex open "DisplayString.nex", start, $ff40
	savenex core 2, 0, 0        ; Next core 2.0.0 required as minimum
	savenex cfg 7,0,0,0
	savenex auto