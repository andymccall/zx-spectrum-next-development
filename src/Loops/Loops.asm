;-------------------------------
; 005 - Loops
;-------------------------------

	device zxspectrumnext

	cspectmap "Loops.map"

	org $8000

;-------------------------------

RED 			equ 2
WHITE_INK_BLACK_PAPER	equ 7
UPPER_SCREEN		equ 2

COUNTER_VALUE_1		equ 5		; Change if you want

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
; Incremental loop
;-------------------------------

	ld de,stringinc			; Address of string
 	ld bc,eostrinc-stringinc 	; Length of string to print
 	call 8252 			; Print the string

 	ld b, 0				; Clear the B register
	ld c, COUNTER_VALUE_1		; Load COUNTER_VALUE_1 into the C register
	call 11563      		; Push the BC registers onto the calculator stack
     	call 11747      		; Output BC to the screen

	ld a, 13			; Load new line into register A
	rst 16				; Restart 16

 	ld b,0				; Put COUNTER_VALUE_1 into the B register

increment:

	inc b				; Increment B

	ld a, b				; Load B into A

	push bc				; Keep BC on the stack

	ld b, 0				; Clear the B register
	ld c, a				; Load A into the C register
	call 11563      		; Push the BC registers onto the calculator stack
     	call 11747      		; Output BC to the screen

	ld a, 13			; Load the character + into register a
	rst 16				; Restart 16

     	pop bc				; Take BC back from the stack

     	ld a, b
     	cp COUNTER_VALUE_1

     	jr nz, increment

	ld a, 13			; Load new line into register A
	rst 16				; Restart 16

;-------------------------------
; Decremental loop
;-------------------------------

	ld de,stringdec			; Address of string
 	ld bc,eostrdec-stringdec 	; Length of string to print
 	call 8252 			; Print the string

 	ld b, 0				; Clear the B register
	ld c, COUNTER_VALUE_1		; Load COUNTER_VALUE_1 into the C register
	call 11563      		; Push the BC registers onto the calculator stack
     	call 11747      		; Output BC to the screen

	ld a, 13			; Load new line into register A
	rst 16				; Restart 16

 	ld b,COUNTER_VALUE_1		; Put COUNTER_VALUE_1 into the B register

decrement: 	

	ld a, b				; Load B into A

	push bc				; Keep BC on the stack

	ld b, 0				; Clear the B register
	ld c, a				; Load A into the C register
	call 11563      		; Push the BC registers onto the calculator stack
     	call 11747      		; Output BC to the screen

	ld a, 13			; Load the character + into register a
	rst 16				; Restart 16

     	pop bc				; Take BC back from the stack

	djnz decrement			; Decrement B, jump to decrement if B is not equal to 0

	ld a, 13			; Load the character + into register a
	rst 16				; Restart 16

	jp $				; Loop forever

;-------------------------------
; Defines
;-------------------------------

stringinc defb 'Counting up to '
eostrinc equ $

stringdec defb 'Counting down from '
eostrdec equ $

;-------------------------------

	DISPLAY ">------------- Code Range           = ",/H,start,"-",$
	DISPLAY ">------------- Code Length (Bytes)  = ",/D,$-start
	DISPLAY ">------------- Code Space Remaining = ",/D,$c000-$

	; write everything into NEX file
	savenex open "Loops.nex", start, $ff40
	savenex core 2, 0, 0        ; Next core 2.0.0 required as minimum
	savenex cfg 7,0,0,0
	savenex auto