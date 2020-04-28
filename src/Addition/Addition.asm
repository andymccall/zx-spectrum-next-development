;-------------------------------
; 004 - Addition
;-------------------------------

	device zxspectrumnext

	cspectmap "Addition.map"

	org $8000

;-------------------------------

RED 			equ 2
WHITE_INK_BLACK_PAPER	equ 7
UPPER_SCREEN		equ 2

VALUE_8BIT_1		equ 32		; Change if you want
VALUE_8BIT_2		equ 24		; Change if you want

VALUE_16BIT_1		equ 200		; Change if you want
VALUE_16BIT_2		equ 112		; Change if you want

;-------------------------------

start:

;-------------------------------
; Screen Setup
;-------------------------------

	ld a,RED			; Set register A to the colour of RED (2)
	out (254),a			; Change the border to RED

        ld a, WHITE_INK_BLACK_PAPER	; Colour seven is white ink and black paper
        ld (23693),a       		; This sets the screen colour as defined by the accumulator (A)
        call 3503          		; Calls a routine to clear the screen

	ld a, UPPER_SCREEN		; Use the upper screeen for printing
	call 5633			; Set the output channel for printing

;-------------------------------
; 8Bit Addition
;-------------------------------

	ld de,string8bit 		; Address of string
 	ld bc,eostring8bit-string8bit 	; Length of string to print
 	call 8252 			; Print the string

 	ld b, 0				; Clear the b register
	ld c, VALUE_8BIT_1		; Load VALUE_8BIT_1 into the C register
	call 11563      		; Push the BC registers onto the calculator stack
     	call 11747      		; Output BC to the screen

     	ld a, '+'			; Load the character + into register A
	rst 16				; Restart 16

 	ld b, 0				; Clear the B register
	ld c, VALUE_8BIT_2		; Load VALUE_8BIT_2 into the C register
	call 11563      		; Push the BC registers onto the calculator stack
     	call 11747      		; Output BC to the screen

     	ld a, '='			; Load the character = into register a
	rst 16				; Restart 16

 	ld b, VALUE_8BIT_1		; Put VALUE_8BIT_1 into the B register
	ld a, b				; Put the B register into A
	add a, VALUE_8BIT_2		; Add VALUE_8BIT_2 to A
	
	ld b, 0				; Clear the B register
	ld c, a				; Load the sum of the two values into the C register
	call 11563      		; Push the BC registers onto the calculator stack
     	call 11747      		; Output BC to the screen

	ld a, 13			; Load the character + into register a
	rst 16				; Restart 16

;-------------------------------
; 16Bit Addition
;-------------------------------

	ld de,string16bit 		; Address of string
 	ld bc,eostring16bit-string16bit	; Length of string to print
 	call 8252 			; Print the string

	ld bc, VALUE_16BIT_1		; Load VALUE_16BIT_1 into the BC registers
	call 11563      		; Push the BC registers onto the calculator stack
     	call 11747      		; Output BC to the screen

     	ld a, '+'			; Load the character + into register a
	rst 16				; Restart 16

	ld bc, VALUE_16BIT_2		; Load VALUE_16BIT_2 into the BC registers
	call 11563      		; Push the BC registers onto the calculator stack
     	call 11747      		; Output BC to the screen

     	ld a, '='			; Load the character = into register a
	rst 16				; Restart 16

	ld bc, VALUE_16BIT_1		; Load VALUE_16BIT_1 into the BC registers
	ld de, bc			; Load the contents of the BC registers into the DE registers
	add de, VALUE_16BIT_2		; Add VALUE_16BIT_2 to the DE registers
	ld bc, de			; Put the contents of DE back into the BC registers
	
	call 11563      		; Push the BC registers onto the calculator stack
     	call 11747      		; Output BC to the screen

	jp $				; Loop forever

;-------------------------------
; Defines
;-------------------------------

string8bit defb '8bit Addition: '
eostring8bit equ $	

string16bit defb '16bit Addition: '
eostring16bit equ $	

;-------------------------------

	DISPLAY ">------------- Code Range           = ",/H,start,"-",$
	DISPLAY ">------------- Code Length (Bytes)  = ",/D,$-start
	DISPLAY ">------------- Code Space Remaining = ",/D,$c000-$

	; write everything into NEX file
	savenex open "Addition.nex", start, $ff40
	savenex core 2, 0, 0        ; Next core 2.0.0 required as minimum
	savenex cfg 7,0,0,0
	savenex auto