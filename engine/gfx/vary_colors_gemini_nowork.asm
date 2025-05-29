CopyDVsToColorVaryDVs:
; e = HPAtkDV
	ld a, [hli]
	ld e, a
; d = DefSpdDV
	ld a, [hli]
	ld d, a
; c = SatSdfDV
	ld a, [hli]
	ld c, a
; b = Shiny
	push bc
	ld a, [hl]
	ld b, a

	ldh a, [rSVBK]
	ld c, a
	ld a, $5
	ldh [rSVBK], a

	ld hl, wColorVaryDVs
; wColorVaryDVs = HPAtkDV
	ld a, e
	ld [hli], a
; wColorVaryDVs+1 = DefSpdDV
	ld a, d
	ld [hli], a
	inc hl
	inc hl
; wColorVaryShiny = Shiny
	ld a, b
	ld [hld], a
	ld a, c
	ld d, a
	pop bc
; wColorVarySpecies = Species
	ld a, b
	ld [hld], a
; wColorVaryDVs+2 = SatSdfDV
	ld a, c
	ld [hl], a

	ld a, d
	ldh [rSVBK], a
	ret

GetColorChannelVariedByDV:
; d = color, e = DV
; a <- d + (e & %11) - (e & %1100 >> 2), ±5 if not in [0, 31]
	ld a, e
	cp %0010 ; override a +2
	jr z, .plus4
	cp %1000 ; override a -2
	jr z, .minus4
	and %11
	add d
	srl e
	srl e
	sub e
.floor
	jr c, .up
.ceil
	cp 32
	ret c
	sub 5
	ret

.up
	add 5
	ret

.plus4
	ld a, d
	add 4
	jr .ceil

.minus4
	ld a, d
	sub 4
	jr .floor

VaryRedByDV:
;;; e = DV
;;; [hl+0] = gggr:rrrr
;;; [hl+1] = 0bbb:bbgg
; store red in d
	ld a, [hl]
	and %00011111
	ld d, a
; vary d according to e
	call GetColorChannelVariedByDV
; store a back in red
	ld d, a
	ld a, [hl]
	and %11100000
	or d
	ld [hl], a
	ret

VaryGreenByDV:
;;; e = DV
;;; [hl+0] = gggr:rrrr
;;; [hl+1] = 0bbb:bbgg
; store green in d
	ld a, [hli]
	and %11100000
	srl a
	swap a
	ld d, a ; d = 00000ggg
	ld a, [hld]
	and %00000011
	swap a
	srl a
	or d
	ld d, a
; vary d according to e
	call GetColorChannelVariedByDV
; store a back in green
	sla a
	swap a
	ld d, a
	and %11100000
	ld e, a
	ld a, d
	and %00000011
	ld d, a
	ld a, [hl]
	and %00011111
	or e
	ld [hli], a
	ld a, [hl]
	and %11111100
	or d
	ld [hld], a
	ret

VaryBlueByDV:
;;; e = DV
;;; [hl+0] = gggr:rrrr
;;; [hl+1] = 0bbb:bbgg
; store blue in d
	inc hl
	ld a, [hl]
	and %01111100
	srl a
	srl a
	ld d, a
; vary d according to e
	call GetColorChannelVariedByDV
; store a back in blue
	ld d, a
	sla d
	sla d
	ld a, [hl]
	and %10000011
	or d
	ld [hld], a
	ret

VaryColorsByDVs::
; hl = colors
; [hl+0] = gggr:rrrr
; [hl+1] = 0bbb:bbgg
; [hl+2] = GGGR:RRRR
; [hl+3] = 0BBB:BBGG

; DVs in wColorVaryDVs
; [bc+0] = hhhh:aaaa
; [bc+1] = dddd:ssss
; [bc+2] = pppp:qqqq

; [wColorVarySpecies] = species
; [wColorVaryShiny] = shiny

if DEF(MONOCHROME) || DEF(NOIR)
	ret
endc

	ld a, [wInitialOptions]
	bit COLOR_VARY_OPT, a
	ret z

	ldh a, [rSVBK]
	push af
	ld a, $5
	ldh [rSVBK], a

	ld bc, wColorVaryDVs
; todo: polychrome item should actually check if the held item is the polychrome 
	ld a, [wColorVarySpecies] ; wCurItem, cp POLYCHROME ? 
	cp PORYGON ; t
	jr z, .Smeargle

; Standard Pokemon color variation starts here
;;; LiteRed ~ HPDV, aka, rrrrr ~ hhhh
; store HPDV in e
	ld a, [bc]
	swap a
	and %1111
	ld e, a
; vary LiteRed by e
	call VaryRedByDV

;;; LiteGrn ~ AtkDV, aka, ggggg ~ aaaa
; store AtkDV in e
	ld a, [bc]
	and %1111
	ld e, a
; vary LiteGrn by e
	call VaryGreenByDV

;;; advance from HP/Atk DV to Def/Spd DV
	inc bc

;;; LiteBlu ~ DefDV, aka, bbbbb ~ dddd
; store DefDV in e
	ld a, [bc]
	swap a
	and %1111
	ld e, a
; vary LiteBlu by e
	call VaryBlueByDV

;;; advance from Lite color to Dark color
	inc hl
	inc hl

.Finish: ; Dark color variation for standard Pokemon starts here
;;; DarkRed ~ SpdDV, aka, RRRRR ~ ssss
; store SpdDV in e
	ld a, [bc]
	and %1111
	ld e, a
; vary DarkRed by e
	call VaryRedByDV

;;; move from Def/Spd DV to SAt/SDf DV
	inc bc

;;; DarkGrn ~ SAtDV, aka, GGGGG ~ pppp
; store SAtDV in e
	ld a, [bc]
	swap a
	and %1111
	ld e, a
; vary DarkGrn by e
	call VaryGreenByDV

;;; DarkBlu ~ SDfDV, aka, BBBBB ~ qqqq
; store SDfDV in e
	ld a, [bc]
	and %1111
	ld e, a
; vary DarkBlu by e
	call VaryBlueByDV

.PorygonColorSetDone: ; Common exit point for Porygon and normally varied Pokemon
	pop af
	ldh [rSVBK], a
	ret

; Unique color setting logic:
; could do: vary paint color with unused DV bits
; * DarkRed' = DarkRed + (HPDV & %0100 >> 2) - (HPDV & %1000 >> 3)
; * DarkGrn' = DarkGrn + (AtkDV & %0100 >> 2) - (AtkDV & %1000 >> 3)
; * DarkBlu' = DarkBlu + (DefDV & %0100 >> 2) - (DefDV & %1000 >> 3)
.Smeargle:
; a = (AtkDV & %11) << 2 | (DefDV & %11)
	ld a, [bc]
	and %11
	add a
	add a
	ld d, a
	inc bc
	ld a, [bc]
	swap a
	and %11
	or d

	ld e, a ; e = final index (0-15) for palettes
 	ld d, 0
	; d = 0, so de pair effectively holds the index for 'add hl, de' trick later

	push de ; Save index de (d=0, e=index)
	push hl ; Save pointer to Pokemon's color data (colors[0])

; Get Porygon's Dark Colors (Store in b, c)
	ld hl, .SmearglePalsDark ; Changed from .SmearglePals
 	ld a, [wColorVaryShiny]
 	and SHINY_MASK
	jr z, .not_shiny_porygon_dark
	ld hl, .SmeargleShinyPalsDark ; Changed from .SmeargleShinyPals
.not_shiny_porygon_dark:
	pop de      ; Restore index de
	push de     ; Save index de again (for lite colors)
	add hl, de
	add hl, de
	ld a, [hli]
	ld b, a     ; b = DarkColorByte1
	ld a, [hl]
	ld c, a     ; c = DarkColorByte2

; Get Porygon's Lite Colors (Store in d, e - reusing d, e registers)
	ld hl, .SmearglePalsLite ; NEW LITE PALETTE
	ld a, [wColorVaryShiny]
	and SHINY_MASK
	jr z, .not_shiny_porygon_lite
	ld hl, .SmeargleShinyPalsLite ; NEW SHINY LITE PALETTE
.not_shiny_porygon_lite:
	pop de      ; Restore index de (d=0, e=index)
	; de is not pushed again as it's the last use of the index
	add hl, de  ; hl += index
	add hl, de  ; hl += index (total hl += index * 2)
	ld a, [hli] ; LiteColorByte1
	ld d, a     ; d now holds LiteColorByte1
	ld a, [hl]  ; LiteColorByte2
	ld e, a     ; e now holds LiteColorByte2

	pop hl      ; Restore pointer to Pokemon's color data (hl points to colors[0])

; Store Porygon's Lite Colors (d = LiteColorByte1, e = LiteColorByte2)
	; colors[0] (gggr:rrrr) is LiteColorByte1
	; colors[1] (0bbb:bbgg) is LiteColorByte2
	ld a, d
	ld [hli], a ; Store LiteColorByte1 into colors[0], hl now points to colors[1]
	ld a, e
	ld [hl], a  ; Store LiteColorByte2 into colors[1]

; Store Porygon's Dark Colors (b = DarkColorByte1, c = DarkColorByte2)
	; colors[2] (GGGR:RRRR) is DarkColorByte1
	; colors[3] (0BBB:BBGG) is DarkColorByte2
	inc hl      ; hl now points to colors[2] (DarkRed)
	ld a, b
	ld [hli], a ; Store DarkColorByte1 into colors[2], hl now points to colors[3]
	ld a, c
	ld [hl], a  ; Store DarkColorByte2 into colors[3]

	jp .PorygonColorSetDone ; Skip .Finish, go to common exit for Porygon


; red and blue channels: no 0 or 31
; green channel: no 0, 7, 8, 15, 16, 23, 24, or 31
; need to be able to add or subtract 1 without overflow/underflow

.SmearglePalsDark: ; from smeargle 
if !DEF(MONOCHROME)
	RGB 14, 05, 06 ; maroon (fighting)
	RGB 27, 09, 26 ; lavender (flying)
	RGB 29, 05, 06 ; red (poison)
	RGB 26, 26, 26 ; white (ground)
	RGB 18, 11, 05 ; brown (rock)
	RGB 16, 28, 01 ; lime (bug)
	RGB 14, 06, 27 ; purple (ghost)
	RGB 14, 14, 18 ; gray (steel)
	RGB 29, 13, 02 ; orange (fire)
	RGB 01, 09, 28 ; blue (water)
	RGB 04, 19, 01 ; green (grass)
	RGB 30, 25, 01 ; yellow (electric)
	RGB 30, 10, 13 ; pink (psychic)
	RGB 02, 22, 26 ; teal (ice)
	RGB 07, 11, 30 ; indigo (dragon)
	RGB 08, 06, 06 ; black (dark)
else
rept 16
 	RGB_MONOCHROME_DARK
endr
endc


.SmeargleShinyPalsDark: ; Renamed from .SmeargleShinyPals ; could do: Fill with actual shiny dark values
if !DEF(MONOCHROME)
	RGB 14, 05, 06 ; maroon (fighting)
	RGB 27, 09, 26 ; lavender (flying)
	RGB 29, 05, 06 ; red (poison)
	RGB 26, 26, 26 ; white (ground)
	RGB 18, 11, 05 ; brown (rock)
	RGB 16, 28, 01 ; lime (bug)
	RGB 14, 06, 27 ; purple (ghost)
	RGB 14, 14, 18 ; gray (steel)
	RGB 29, 13, 02 ; orange (fire)
	RGB 01, 09, 28 ; blue (water)
	RGB 04, 19, 01 ; green (grass)
	RGB 30, 25, 01 ; yellow (electric)
	RGB 30, 10, 13 ; pink (psychic)
	RGB 02, 22, 26 ; teal (ice)
	RGB 07, 11, 30 ; indigo (dragon)
	RGB 08, 06, 06 ; black (dark)
else
rept 16
	RGB_MONOCHROME_DARK
endr
endc

.SmearglePalsLite: ; New palette for  Lite colors
if !DEF(MONOCHROME)
	RGB 15, 15, 15 ; maroon (fighting)
	RGB 15, 15, 15 ; lavender (flying)
	RGB 15, 15, 15 ; red (poison)
	RGB 15, 15, 15 ; white (ground)
	RGB 15, 15, 15 ; brown (rock)
	RGB 15, 15, 15 ; lime (bug)
	RGB 15, 15, 15 ; purple (ghost)
	RGB 15, 15, 15 ; gray (steel)
	RGB 15, 15, 15 ; orange (fire)
	RGB 15, 15, 15 ; blue (water)
	RGB 15, 15, 15 ; green (grass)
	RGB 15, 15, 15 ; yellow (electric)
	RGB 15, 15, 15 ; pink (psychic)
	RGB 15, 15, 15 ; teal (ice)
	RGB 15, 15, 15 ; indigo (dragon)
	RGB 15, 15, 15 ; black (dark)
else
rept 16
 	RGB_MONOCHROME_LITE
endr
endc

.SmeargleShinyPalsLite: ; New palette for Porygon Shiny Lite colors ; TODO: Fill with actual shiny lite values
if !DEF(MONOCHROME)
	RGB 15, 15, 15 ; maroon (fighting)
	RGB 15, 15, 15 ; lavender (flying)
	RGB 15, 15, 15 ; red (poison)
	RGB 15, 15, 15 ; white (ground)
	RGB 15, 15, 15 ; brown (rock)
	RGB 15, 15, 15 ; lime (bug)
	RGB 15, 15, 15 ; purple (ghost)
	RGB 15, 15, 15 ; gray (steel)
	RGB 15, 15, 15 ; orange (fire)
	RGB 15, 15, 15 ; blue (water)
	RGB 15, 15, 15 ; green (grass)
	RGB 15, 15, 15 ; yellow (electric)
	RGB 15, 15, 15 ; pink (psychic)
	RGB 15, 15, 15 ; teal (ice)
	RGB 15, 15, 15 ; indigo (dragon)
	RGB 15, 15, 15 ; black (dark)
else
rept 16
 	RGB_MONOCHROME_LITE
endr
endc

VaryBGPal0ByTempMonDVs:
	ld hl, wBGPals1 palette 0 + 2
	jr VaryBGPalByTempMonDVs
VaryBGPal1ByTempMonDVs:
	ld hl, wBGPals1 palette 1 + 2
VaryBGPalByTempMonDVs:
	push hl
	ld hl, wTempMonDVs
	ld a, [wTempMonSpecies]
	ld b, a
	call CopyDVsToColorVaryDVs
	pop hl
	jmp VaryColorsByDVs
