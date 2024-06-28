;
; Title:		    01-hellochar - Assembler Example
;
; Description:      A program that prints "X" to
;                   the console
; Author:		    Andy McCall, mailme@andymccall.co.uk
;
; Created:		    2024-06-13 @ 14:46
; Last Updated:	    2024-06-13 @ 14:46
;
; Modinfo:
;
;-----------------------------------------------------------

        DEVICE ZXSPECTRUMNEXT

        CSPECTMAP "hellochar.map"

        org  $8000

;-----------------------------------------------------------

UPPER_SCREEN equ 2			; Set a constant for the upper screen
CHAN_OPEN    equ 1601

;-----------------------------------------------------------

start:
	ld a, UPPER_SCREEN		; Use the upper screeen for printing
	call CHAN_OPEN	                ; Set the output channel for printing

	ld a, 'A'	                ; Load the character A into register a
	rst 16		                ; Restart 16

        jr   $                          ; Loop forever!


        SAVENEX OPEN "hellochar.nex", start, $ff40
        SAVENEX CORE 2,0,0
        SAVENEX CFG 7,0,0,0
        SAVENEX AUTO