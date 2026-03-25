; This file is part of the TinyCore MicroKernel for the Foenix F256.
; Copyright 2022, 2023 Jessie Oberreuter <Gadget@HackwrenchLabs.com>.
; SPDX-License-Identifier: GPL-3.0-only

            .cpu        "65c02"

            .namespace  platform
dips        .namespace

            .section    global

GAMMA       =   $80     ; 8 ; Monitor type (analog/digital)
HI_RES      =   $40     ; 7 ; Monitor sync (60/70)
VIAKBD      =   $20     ; 6 ; CBM keyboard is installed (or snd exp)
NO_JIFFY    =   $10     ; 5 ; Disable JiffyDOS protocol
WIFI        =   $08     ; 4 ; Feather WiFi installed
SLIP        =   $04     ; 3 ; Enable SLIP support
DIP2        =   $02     ; 2 ;
BOOT_MENU   =   $01     ; 1 ; Enable boot menu

read
    stz io_ctrl
    ; Returns the values of the dip switches in A.
    ; Assumes that we're in the system registers I/O map.

            lda     $d670   ; Read Jr dip switch register.
            eor     #$ff    ; Values are inverted.
            rts

.if false
$D6A0 System control
$D6A8 - $42 (B) 41 (A)
$D6A9 - $30
.endif
            .send
            .endn
            .endn
