;-------------------------------
; 001 - Display a character
;-------------------------------

	device zxspectrumnext

	cspectmap "DisplayCharacter.map"

	org $8000

;-------------------------------

start:
	ld a, 2		; Use the upper screeen for printing
	call 5633	; Set the output channel for printing

	ld a, 'A'	; Load the character A into register a
	rst 16		; Restart 16

	jp $		; Loop forever

;-------------------------------
string defb 'Hello World!'		; The string to print
eostr equ $	
	
	DISPLAY ">------------- Code Range           = ",/H,start,"-",$
	DISPLAY ">------------- Code Length (Bytes)  = ",/D,$-start
	DISPLAY ">------------- Code Space Remaining = ",/D,$c000-$

	; write everything into NEX file
	savenex open "DisplayCharacter.nex", start, $ff40
	savenex core 2, 0, 0        ; Next core 2.0.0 required as minimum
	savenex cfg 7,0,0,0
	savenex auto