;
; Title:		    01-firstprg - Assembler Example
;
; Description:      A program ensure your environment is configured
;                   correctly
; Author:		    Andy McCall, mailme@andymccall.co.uk
;
; Created:		    2024-06-13 @ 14:46
; Last Updated:	    2024-06-13 @ 14:46
;
; Modinfo:
;
;-----------------------------------------------------------

        DEVICE ZXSPECTRUMNEXT

        CSPECTMAP "firstprg.map"

        org  $8000

;-----------------------------------------------------------

start:
        jr   $          ; Loop forever!


        SAVENEX OPEN "firstprg.nex", start, $ff40
        SAVENEX CORE 2,0,0
        SAVENEX CFG 7,0,0,0
        SAVENEX AUTO