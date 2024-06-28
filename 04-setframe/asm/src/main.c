        DEVICE ZXSPECTRUMNEXT

        CSPECTMAP "setframe.map"

        org  $8000

start:
        ld   a,4        ; Set A to green
        out  ($fe),a    ; Change the border
        jr   $          ; Loop forever!


        SAVENEX OPEN "setframe.nex", start, $ff40
        SAVENEX CORE 2,0,0
        SAVENEX CFG 7,0,0,0
        SAVENEX AUTO