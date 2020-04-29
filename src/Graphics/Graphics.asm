;-------------------------------
; 003 - Change Screen Colour
;-------------------------------

	device zxspectrumnext

	cspectmap "Graphics.map"

	org $8000

;-------------------------------

RED 			equ 2
WHITE_INK_BLACK_PAPER	equ 7
UPPER_SCREEN		equ 2

;-------------------------------

start:

; We want a black screen.

       ld a,71             ; white ink (7) on black paper (0),
                           ; bright (64).
       ld (23693),a        ; set our screen colours.
       xor a               ; quick way to load accumulator with zero.
       call 8859           ; set permanent border colours.

; Set up the graphics.

       ld hl,blocks        ; address of user-defined graphics data.
       ld (23675),hl       ; make UDGs point to it.

; Okay, let's start the game.

       call 3503           ; ROM routine - clears screen, opens chan 2.

; Initialise coordinates.

       ld hl,21+15*256     ; load hl pair with starting coords.
       ld (plx),hl         ; set player coords.

       call basexy         ; set the x and y positions of the player.
       call splayr         ; show player base symbol.

; This is the main loop.

mloop  equ $

; Delete the player.

       call basexy         ; set the x and y positions of the player.
       call wspace         ; display space over player.
     
; Now he's moved we can redisplay the player.

       call basexy         ; set the x and y positions of the player.
       call splayr         ; show player.

       halt                ; delay.

; Jump back to beginning of main loop.

       jp mloop

; Set up the x and y coordinates for the player's gunbase position,
; this routine is called prior to display and deletion of gunbase.

basexy ld a,22             ; AT code.
       rst 16
       ld a,(plx)          ; player vertical coord.
       rst 16              ; set vertical position of player.
       ld a,(ply)          ; player's horizontal position.
       rst 16              ; set the horizontal coord.
       ret

; Show player at current print position.

splayr ld a,68             ; green ink (5) on black paper (0),
                           ; bright (64).
       ld (23695),a        ; set our temporary screen colours.
       ld a,144            ; ASCII code for User Defined Graphic 'A'.
       rst 16              ; draw player.
       ret

wspace ld a,71             ; white ink (7) on black paper (0),
                           ; bright (64).
       ld (23695),a        ; set our temporary screen colours.
       ld a,32             ; SPACE character.
       rst 16              ; display space.
       ret

plx    defb 0              ; player's x coordinate.
ply    defb 0              ; player's y coordinate.

; UDG graphics.

blocks defb 16,16,56,56,124,124,254,254    ; player base.

	DISPLAY ">------------- Code Range           = ",/H,start,"-",$
	DISPLAY ">------------- Code Length (Bytes)  = ",/D,$-start
	DISPLAY ">------------- Code Space Remaining = ",/D,$c000-$

	; write everything into NEX file
	savenex open "Graphics.nex", start, $ff40
	savenex core 2, 0, 0        ; Next core 2.0.0 required as minimum
	savenex cfg 7,0,0,0
	savenex auto