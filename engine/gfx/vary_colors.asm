CopyDVsToColorVaryDVs: ; todo: add all the other HPs and palettes, then also go through all the trainers and make sure perfect dvs isn't the same as any of these 
;Revise these to look at the  DVs of the mon, 
; check if the DVs match those of the 
; and then also make sure that such DV values are not possible to find in the wild, and then also make it possible to adjust the DVs by some trainer, and then also make it only happen once or twice, and then.... 
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

CheckDVsHPDark:
; Check if DVs match DVS_HP_DARK pattern: $fe, $00, $00
; Returns carry flag set if match, clear if no match
; bc = wColorVaryDVs pointer
	push hl
	push de
	push bc
	
	; Set up for block comparison
	ld h, b
	ld l, c                    ; hl = source (wColorVaryDVs)
	ld de, .HPDarkPattern      ; de = pattern to match
	ld b, 3                    ; compare 3 bytes
	
.compare_loop
	ld a, [de]
	cp [hl]
	jr nz, .no_match
	inc hl
	inc de
	dec b
	jr nz, .compare_loop
	
	; Match found
	scf  ; set carry flag
	jr .done
	
.no_match
	and a  ; clear carry flag
	
.done
	pop bc
	pop de
	pop hl
	ret

.HPDarkPattern:
	db $fe, $ff, $ff ; ~!DEF faithful 

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

	; First check for DVS_HP_DARK pattern
	call CheckDVsHPDark
	jr c, .HPDarkEffect

	; Check if POLYCHROME item is in use
	push hl
	push bc
	ld a, [wCurItem]
	cp POLYCHROME
	jr z, .PolychromeEffect
	; If not POLYCHROME, check if species is Porygon
	ld a, [wColorVarySpecies]
	cp PORYGON
	jr z, .PolychromeEffect
	pop bc
	pop hl
	jp .StandardColors

.HPDarkEffect:
	; Apply DVS_HP_DARK special palette
	push hl
	push bc
	
	; Get light color
	ld hl, .HPDarkPalsLite
	ld a, [hli]
	ld d, a
	ld a, [hl]
	ld e, a
	pop bc
	pop hl
	
	; Store lite RGB
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	
	; Get dark color
	push hl
	push bc
	ld hl, .HPDarkPalsDark
	ld a, [hli]
	ld d, a
	ld a, [hl]
	ld e, a
	pop bc
	pop hl
	
	; Store dark RGB
	ld a, e
	ld [hli], a
	ld a, d
	ld [hl], a
	
	pop af
	ldh [rSVBK], a
	ret

.HPDarkPalsLite:
if !DEF(MONOCHROME)
	RGB 10, 10, 10 ; light gray
else
	RGB_MONOCHROME_DARK
endc

.HPDarkPalsDark:
if !DEF(MONOCHROME)
	RGB 20, 20, 20 ; dark gray
else
	RGB_MONOCHROME_DARK
endc

.PolychromeEffect:
	pop bc
	pop hl

;;; Use Porygon/Polychrome palette logic
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
; d, e = base paint color
	ld e, a
	ld d, 0
	push hl
	push bc
	; Get both light and dark colors for Porygon
	; First the light color
	ld hl, .SmearglePalsLite
	ld a, [wColorVaryShiny]
	and SHINY_MASK
	jr z, .not_shiny_lite
	ld hl, .SmeargleShinyPalsLite
.not_shiny_lite
	add hl, de
	add hl, de
	ld a, [hli]
	ld d, a
	ld a, [hl]
	ld e, a
	pop bc
	pop hl
	; Store lite RGB
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	
	; Now get the dark color
	push hl
	push bc
	ld bc, wColorVaryDVs
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
	ld e, a
	ld d, 0
	ld hl, .SmearglePalsDark
	ld a, [wColorVaryShiny]
	and SHINY_MASK
	jr z, .not_shiny_dark
	ld hl, .SmeargleShinyPalsDark
.not_shiny_dark
	add hl, de
	add hl, de
	ld a, [hli]
	ld d, a
	ld a, [hl]
	ld e, a
	pop bc
	pop hl
	; Store dark RGB
	ld a, e
	ld [hli], a
	ld a, d
	ld [hl], a
	
	pop af
	ldh [rSVBK], a
	ret

.StandardColors:
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

	pop af
	ldh [rSVBK], a
	ret

; could do: vary paint color with unused DV bits
; * DarkRed' = DarkRed + (HPDV & %0100 >> 2) - (HPDV & %1000 >> 3)
; * DarkGrn' = DarkGrn + (AtkDV & %0100 >> 2) - (AtkDV & %1000 >> 3)
; * DarkBlu' = DarkBlu + (DefDV & %0100 >> 2) - (DefDV & %1000 >> 3)

.SmearglePalsDark:
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
	RGB_MONOCHROME_DARK
	RGB_MONOCHROME_DARK
	RGB_MONOCHROME_DARK
	RGB_MONOCHROME_DARK
	RGB_MONOCHROME_DARK
	RGB_MONOCHROME_DARK
	RGB_MONOCHROME_DARK
	RGB_MONOCHROME_DARK
	RGB_MONOCHROME_DARK
	RGB_MONOCHROME_DARK
	RGB_MONOCHROME_DARK
	RGB_MONOCHROME_DARK
	RGB_MONOCHROME_DARK
	RGB_MONOCHROME_DARK
	RGB_MONOCHROME_DARK
	RGB_MONOCHROME_DARK
endc

.SmearglePalsLite:
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
	RGB_MONOCHROME_DARK
	RGB_MONOCHROME_DARK
	RGB_MONOCHROME_DARK
	RGB_MONOCHROME_DARK
	RGB_MONOCHROME_DARK
	RGB_MONOCHROME_DARK
	RGB_MONOCHROME_DARK
	RGB_MONOCHROME_DARK
	RGB_MONOCHROME_DARK
	RGB_MONOCHROME_DARK
	RGB_MONOCHROME_DARK
	RGB_MONOCHROME_DARK
	RGB_MONOCHROME_DARK
	RGB_MONOCHROME_DARK
	RGB_MONOCHROME_DARK
	RGB_MONOCHROME_DARK
endc

.SmeargleShinyPalsDark:
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
	RGB_MONOCHROME_DARK
	RGB_MONOCHROME_DARK
	RGB_MONOCHROME_DARK
	RGB_MONOCHROME_DARK
	RGB_MONOCHROME_DARK
	RGB_MONOCHROME_DARK
	RGB_MONOCHROME_DARK
	RGB_MONOCHROME_DARK
	RGB_MONOCHROME_DARK
	RGB_MONOCHROME_DARK
	RGB_MONOCHROME_DARK
	RGB_MONOCHROME_DARK
	RGB_MONOCHROME_DARK
	RGB_MONOCHROME_DARK
	RGB_MONOCHROME_DARK
	RGB_MONOCHROME_DARK
endc

.SmeargleShinyPalsLite:
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
	RGB_MONOCHROME_DARK
	RGB_MONOCHROME_DARK
	RGB_MONOCHROME_DARK
	RGB_MONOCHROME_DARK
	RGB_MONOCHROME_DARK
	RGB_MONOCHROME_DARK
	RGB_MONOCHROME_DARK
	RGB_MONOCHROME_DARK
	RGB_MONOCHROME_DARK
	RGB_MONOCHROME_DARK
	RGB_MONOCHROME_DARK
	RGB_MONOCHROME_DARK
	RGB_MONOCHROME_DARK
	RGB_MONOCHROME_DARK
	RGB_MONOCHROME_DARK
	RGB_MONOCHROME_DARK
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