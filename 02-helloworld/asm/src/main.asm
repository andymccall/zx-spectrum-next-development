;
; Title:		    01-helloworld - Assembler Example
;
; Description:      A program that prints "Hello, World!" to
;                   the console
; Author:		    Andy McCall, mailme@andymccall.co.uk
;
; Created:		    2024-06-27 @ 14:59
; Last Updated:	    2024-06-27 @ 14:59
;
; Modinfo:
;
;-----------------------------------------------------------

	DEVICE ZXSPECTRUMNEXT

	CSPECTMAP "helloworld.map"

	org $8000

;-----------------------------------------------------------
; Kernal Routines


;-----------------------------------------------------------
; Constants

UPPER_SCREEN equ 2			; Set a constant for the upper screen

;-----------------------------------------------------------

start:
	ld a, UPPER_SCREEN		; Use the upper screen for printing
	call 5633			    ; Set the output channel for printing

	ld de,string 			; Address of string
 	ld bc,string_end-string ; Length of string to print
 	call 8252 			    ; Print the string

	jp $				    ; Loop forever

;-----------------------------------------------------------

string 		defb 'Hello World!'		; The string to print
string_end 	equ $

;-----------------------------------------------------------

	SAVENEX OPEN "helloworld.nex", start, $ff40
	SAVENEX CORE 2,0,0
	SAVENEX CFG 7,0,0,0
	SAVENEX AUTO