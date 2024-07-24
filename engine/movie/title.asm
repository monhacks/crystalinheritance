_TitleScreen:

	call ClearBGPalettes
	call ClearSprites
	call ClearTileMap

; Turn BG Map update off
	xor a
	ldh [hBGMapMode], a

; Reset timing variables
	ld hl, wJumptableIndex
	ld [hli], a ; wJumptableIndex
	ld [hli], a ; wIntroSceneFrameCounter
	ld [hli], a ; wTitleScreenTimer
	ld [hl], a  ; wTitleScreenTimer+1

; Turn LCD off
	call DisableLCD

; VRAM bank 1
	ld a, 1
	ldh [rVBK], a

; Decompress running Suicune gfx
	ld hl, TitleSuicuneGFX
	ld de, vTiles1 ; goes to vtiles1, ram/vram.asm
	call Decompress

; Clear screen palettes
	hlbgcoord 0, 0
	ld bc, SCREEN_WIDTH * BG_MAP_WIDTH
	xor a
	rst ByteFill

; Fill tile palettes:

; BG Map 1:

; line 0 (copyright)?
	hlbgcoord 0, 0, vBGMap1
	ld bc, BG_MAP_WIDTH
	ld a, 7 ; palette
	rst ByteFill

; BG Map 0:

; Apply logo gradient:

; lines 3-4
	hlbgcoord 0, 1
	ld bc, 2 * BG_MAP_WIDTH
	ld a, 2
	rst ByteFill
; line 5
	hlbgcoord 0, 3
	ld bc, BG_MAP_WIDTH
	ld a, 3
	rst ByteFill
; line 6
	hlbgcoord 0, 4
	ld bc, BG_MAP_WIDTH
	ld a, 4
	rst ByteFill
; line 7
	hlbgcoord 0, 5
	ld bc, BG_MAP_WIDTH
	ld a, 5
	rst ByteFill
; lines 8-9
	hlbgcoord 0, 6
	ld bc, 2 * BG_MAP_WIDTH
	ld a, 6
	rst ByteFill

; 'CRYSTAL VERSION'
	hlbgcoord 0, 7;	hlbgcoord 5, 9
	ld bc, 2 * BG_MAP_WIDTH; 	ld bc, NAME_LENGTH ; length of version text
	ld a, 1
	rst ByteFill

; Suicune gfx, lines 10-15?
	hlbgcoord 0, 12
	ld bc, 6 * BG_MAP_WIDTH ; the rest of the screen
	ld a, 8 ; these are palettes, but they are also controlling the tile that is placed. 
	rst ByteFill

; Back to VRAM bank 0
	xor a
	ldh [rVBK], a

; Decompress logo
	ld hl, TitleLogoGFX
	ld de, vTiles1
	call Decompress

; Decompress background crystal
	ld hl, TitleCrystalGFX 
	ld de, vTiles0
	call Decompress

; Clear screen tiles
	hlbgcoord 0, 0
	ld bc, 64 * BG_MAP_WIDTH
	ld a, " "
	rst ByteFill

; Draw Pokemon logo
	hlcoord 0, 1
	lb bc, 7, SCREEN_WIDTH
	lb de, $80, SCREEN_WIDTH
	call DrawTitleGraphic

; Draw Celebi?
;	hlcoord 0, 8
;	lb bc, 5, 6
;	lb de, $90, 6
;	call DrawTitleGraphic
; input:
;   hl: draw location
;   b: height
;   c: width
;   d: tile to start drawing from
;   e: number of tiles to advance for each bgrows

; Draw copyright text
	hlbgcoord 4, 0, vBGMap1
	lb bc, 1, 13
	lb de, $0c, 0
	call DrawTitleGraphic

IF DEF(FAITHFUL)
	hlbgcoord 17, 0, vBGMap1
	lb bc, 1, 1
	lb de, $19, 0
	call DrawTitleGraphic
endc

; Initialize running Suicune?
	ld d, $0
	call LoadSuicuneFrame

; Initialize background crystal
	call InitializeBackground


; Save WRAM bank
	ldh a, [rSVBK]
	push af
; WRAM bank 5
	ld a, 5
	ldh [rSVBK], a

; Update palette colors
	ld hl, TitleScreenPalettes
	ld de, wBGPals1
	ld bc, 16 palettes
	rst CopyBytes

	ld hl, TitleScreenPalettes
	ld de, wBGPals2
	ld bc, 16 palettes
	rst CopyBytes

; Restore WRAM bank
	pop af
	ldh [rSVBK], a

; LY/SCX trickery starts here

	push af
	ld a, BANK(wLYOverrides)
	ldh [rSVBK], a

; Make sure the LYOverrides buffer is empty
	ld hl, wLYOverrides
	xor a
	ld bc, wLYOverridesEnd - wLYOverrides
	rst ByteFill

; Let LCD Stat know we're messing around with SCX
	ld a, rSCX - rJOYP
	ldh [hLCDCPointer], a

	pop af
	ldh [rSVBK], a

; Reset audio
	call ChannelsOff
	call EnableLCD

	ldh a, [rLCDC]
	set 2, a ; 8x16 sprites
	ldh [rLCDC], a

	ld a, +112
	ldh [hSCX], a
	ld a, 8
	ldh [hSCY], a
	ld a, 7
	ldh [hWX], a
	ld a, -112
	ldh [hWY], a

	ld a, $1
	ldh [hCGBPalUpdate], a

; Update BG Map 0 (bank 0)
	ldh [hBGMapMode], a

	xor a
	ld [wBGPals1 palette 0 + 2], a ; sets everything to palette 0? 

; Play starting sound effect
	call SFXChannelsOff
	ld de, SFX_TITLE_SCREEN_ENTRANCE
	jmp PlaySFX

SuicuneFrameIterator:
	ld hl, wBGPals1 palette 0 + 2
	ld a, [hl]
	ld c, a
	inc [hl]

; Only do this once every eight frames
	and (1 << 3) - 1
	ret nz

	ld a, c
	and 3 << 3
	sla a
	swap a
	ld e, a
	ld d, $0
	ld hl, .Frames
	add hl, de
	ld d, [hl]
	xor a
	ldh [hBGMapMode], a
	call LoadSuicuneFrame
	ld a, $1
	ldh [hBGMapMode], a
	ldh [hBGMapHalf], a
	ret

.Frames:
	db $80 ; vTiles4 tile $00
	db $80 ; vTiles4 tile $08
	db $80 ; vTiles5 tile $00
	db $80 ; vTiles5 tile $08

LoadSuicuneFrame:
	hlcoord 6, 12
	ld b, 6
.bgrows
	ld c, 8
.col
	ld a, d
	ld [hli], a
	inc d
	dec c
	jr nz, .col
; "add hl, SCREEN_WIDTH - 8"
; 6 bytes, 12 cycles
	push de
	ld de, SCREEN_WIDTH - 8
	add hl, de
	pop de
;; 8 bytes, 8 cycles
;	ld a, SCREEN_WIDTH - 8
;	add l
;	ld l, a
;	ld a, 0
;	adc h
;	ld h, a
	ld a, 8
	add d
	ld d, a
	dec b
	jr nz, .bgrows
	ret

DrawTitleGraphic:
; input:
;   hl: draw location
;   b: height
;   c: width
;   d: tile to start drawing from
;   e: number of tiles to advance for each bgrows
.bgrows
	push de
	push bc
	push hl
.col
	ld a, d
	ld [hli], a
	inc d
	dec c
	jr nz, .col
	pop hl
	ld bc, SCREEN_WIDTH
	add hl, bc
	pop bc
	pop de
	ld a, e
	add d
	ld d, a
	dec b
	jr nz, .bgrows
	ret

InitializeBackground: ; this will draw the background, the tree. as of 07-05-24, if we can write along the row as 0, 1, 2, N_col, then we can set the number of rows c to 8 and ld a, $08 might do it?
    ld hl, wVirtualOAM        ; Load the address of Virtual OAM into HL. 
    lb de, -$08, $0           ; Initialize DE with -$22 and $0. D is a height index and e is a tile index. 
    ld c, 4                  ; Initialize C with 5, indicating 5 rows to initialize. C is decremented 5 times. 5 of 8x16.
.loop ; the code below tells everything to get two rows lower. 
    push bc                   ; Save BC on stack
    call .InitColumn          ; Initialize a column
    pop bc                    ; Restore BC
    ld a, $10                 ; lower by 16 pixels
    add d                     ; Add D to A (modifying D for the next column)
    ld d, a                   ; Store result back in D
    dec c                     ; Decrease C by 1
    jr nz, .loop              ; Repeat if C is not zero
    ret                       ; Return from the function

.InitColumn:
    lb bc, $30, $a         ; Initialize BC with $40 and $6, c is the number of columns to go through and b is a width location. when c = 4 and bc = _6 goes through 0-48. 
.loop2
    ld a, d                   ; Load D into A
    ld [hli], a               ; Store A into (HL) and increment HL
    ld a, b                   ; Load B into A
    ld [hli], a               ; Store A into (HL) and increment HL
    add $8                    ; Add $8 (8 in decimal) to A.  
    ld b, a                   ; Store the result back in B
    ld a, e                   ; Load E into A
    ld [hli], a               ; Store A into (HL) and increment HL
    inc e                     ; Increment E
    inc e                     ; Increment E again...
    ld a, $80                 ; Load A with $80, a = a + 128 (not sure why this exists -- seems to be related to rotation when a = $40)
    ld [hli], a               ; Store A into (HL) and increment HL
    dec c                     ; Decrease C by 1, c = c - 1
    jr nz, .loop2             ; Repeat if C is not zero
    ret                       ; Return from the function

AnimateTitleCrystal:
; Move the title screen crystal downward until it's fully visible

; Stop at y=6
; y is really from the bottom of the sprite, which is two tiles high
	ld hl, wVirtualOAM
	ld a, [hl]
	cp 4 + $40 ; this controls how far down it goes. 
	ret z

; Move all parts of the background down
	ld c, 40 ; 30
.loop
	ld a, [hl]
	add 2 
	ld [hli], a
	inc hl
	inc hl
	inc hl
	dec c
	jr nz, .loop
	ret

TitleSuicuneGFX: ; this is the celebi and apricorn
INCBIN "gfx/title/suicune.2bpp.lz"

TitleLogoGFX:
INCBIN "gfx/title/logo_version.2bpp.lz" ; on 7-3-24, this makes with a transparent logo. Just need to save the old logo as the new one to get it back. 

TitleCrystalGFX: ; crystal is the original crystal, blossom_v3 is a 48x80 with similar tilemap to blossom_v2, blossom_v2 is 96x64
INCBIN "gfx/title/rearranged_blossom.2bpp.lz"

;TitleCrystalGFX: ; crystal is the original crystal, blossom_v3 is a 48x80 with similar tilemap to blossom_v2, blossom_v2 is 96x64
;INCBIN "gfx/title/crystal.2bpp.lz"

TitleScreenPalettes: 
; BG the logo and the suicune
if !DEF(MONOCHROME) ; 31-15-15 and 15-4-18 for shiny
	RGB 00, 09, 00 ; 0 the animated part of the title - suicune. all white space to black
	RGB 03, 13, 28 ; celebi blue, should be highlight. 
	RGB 10, 31, 10 ; all dark grey to celebi green
	RGB 29, 29, 29 ; white. c.f. gfx/palettes.asm for the wht apricorn

	RGB 00, 09, 00 ; 1 LEGENDS is these four lines. all white space turns to black. 
	RGB 10, 31, 10;	RGB 15, 04, 18;02, 03, 30
	RGB 31, 15, 15 ; celebi shiny pink 
	RGB 02, 03, 30;	RGB 10, 31, 10 --> keep

	RGB 00, 09, 00 ; 2
	RGB 10, 31, 10
	RGB 31, 31, 31 ; ylw
	RGB 02, 03, 30

	RGB 00, 09, 00; 3
	RGB 10, 31, 10
	RGB 31, 31, 18 ; ylw
	RGB 02, 03, 30

	RGB 00, 09, 00; 4
	RGB 10, 31, 10
	RGB 29, 28, 12 ; ylw
	RGB 02, 03, 30

	RGB 00, 09, 00; 5
	RGB 10, 31, 10
	RGB 28, 25, 06 ; ylw
	RGB 02, 03, 30

	RGB 00, 09, 00; 6
	RGB 10, 31, 10
	RGB 26, 21, 00 ; ylw
	RGB 02, 03, 30

	RGB 00, 09, 00 ; ; 7 copyright palette
	RGB 11, 11, 19
	RGB 31, 31, 31 ; ylw
	RGB 02, 03, 30

; OBJ this is the crystal. 
	RGB 00, 00, 00; 8
	RGB 30, 22, 25	;
	RGB 20, 15, 03
	RGB 30, 10, 06

	RGB 31, 31, 31; 9
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00

	RGB 00, 00, 00 ; the animated part of the title - suicune. all white space to black
	RGB 03, 13, 28 ; celebi blue, should be highlight. 
	RGB 10, 31, 10 ; all dark grey to celebi green
	RGB 23, 25, 27 ; white. c.f. gfx/palettes.asm for the wht apricorn
else
	RGB_MONOCHROME_BLACK
	RGB_MONOCHROME_LIGHT
	RGB_MONOCHROME_DARK
	RGB_MONOCHROME_DARK

	RGB_MONOCHROME_BLACK
	RGB_MONOCHROME_WHITE
	RGB_MONOCHROME_LIGHT
	RGB_MONOCHROME_DARK

	RGB_MONOCHROME_BLACK
	RGB_MONOCHROME_LIGHT
	RGB_MONOCHROME_WHITE
	RGB_MONOCHROME_DARK

	RGB_MONOCHROME_BLACK
	RGB_MONOCHROME_LIGHT
	RGB_MONOCHROME_WHITE
	RGB_MONOCHROME_DARK

	RGB_MONOCHROME_BLACK
	RGB_MONOCHROME_LIGHT
	RGB_MONOCHROME_WHITE
	RGB_MONOCHROME_DARK

	RGB_MONOCHROME_BLACK
	RGB_MONOCHROME_LIGHT
	RGB_MONOCHROME_WHITE
	RGB_MONOCHROME_DARK

	RGB_MONOCHROME_BLACK
	RGB_MONOCHROME_LIGHT
	RGB_MONOCHROME_WHITE
	RGB_MONOCHROME_DARK

	RGB_MONOCHROME_BLACK
	RGB_MONOCHROME_DARK
	RGB_MONOCHROME_WHITE
	RGB_MONOCHROME_BLACK

	RGB_MONOCHROME_BLACK
	RGB_MONOCHROME_DARK
	RGB_MONOCHROME_LIGHT
	RGB_MONOCHROME_WHITE

	RGB_MONOCHROME_WHITE
	RGB_MONOCHROME_BLACK
	RGB_MONOCHROME_BLACK
	RGB_MONOCHROME_BLACK

	RGB_MONOCHROME_WHITE
	RGB_MONOCHROME_BLACK
	RGB_MONOCHROME_BLACK
	RGB_MONOCHROME_BLACK

	RGB_MONOCHROME_WHITE
	RGB_MONOCHROME_BLACK
	RGB_MONOCHROME_BLACK
	RGB_MONOCHROME_BLACK

	RGB_MONOCHROME_WHITE
	RGB_MONOCHROME_BLACK
	RGB_MONOCHROME_BLACK
	RGB_MONOCHROME_BLACK

	RGB_MONOCHROME_WHITE
	RGB_MONOCHROME_BLACK
	RGB_MONOCHROME_BLACK
	RGB_MONOCHROME_BLACK

	RGB_MONOCHROME_WHITE
	RGB_MONOCHROME_BLACK
	RGB_MONOCHROME_BLACK
	RGB_MONOCHROME_BLACK

	RGB_MONOCHROME_WHITE
	RGB_MONOCHROME_BLACK
	RGB_MONOCHROME_BLACK
	RGB_MONOCHROME_BLACK
endc
