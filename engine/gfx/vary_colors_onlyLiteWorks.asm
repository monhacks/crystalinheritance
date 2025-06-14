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

CheckDVsHPType:
; Check if DVs match any HP type pattern
; Returns: a = HP type constant if match found, 0 if no match
; bc = wColorVaryDVs pointer
	push hl
	push de
	push bc
	
	; Check each HP type pattern
	ld h, b
	ld l, c                    ; hl = source (wColorVaryDVs)
	
	; HP Fighting
	ld de, .HPFightingPattern
	call .ComparePattern
	jr c, .foundFighting
	
	; HP Flying
	ld de, .HPFlyingPattern
	call .ComparePattern
	jr c, .foundFlying
	
	; HP Poison
	ld de, .HPPoisonPattern
	call .ComparePattern
	jr c, .foundPoison
	
	; HP Ground
	ld de, .HPGroundPattern
	call .ComparePattern
	jr c, .foundGround
	
	; HP Rock
	ld de, .HPRockPattern
	call .ComparePattern
	jr c, .foundRock
	
	; HP Bug
	ld de, .HPBugPattern
	call .ComparePattern
	jr c, .foundBug
	
	; HP Ghost
	ld de, .HPGhostPattern
	call .ComparePattern
	jr c, .foundGhost
	
	; HP Steel
	ld de, .HPSteelPattern
	call .ComparePattern
	jr c, .foundSteel
	
	; HP Fire
	ld de, .HPFirePattern
	call .ComparePattern
	jr c, .foundFire
	
	; HP Water
	ld de, .HPWaterPattern
	call .ComparePattern
	jr c, .foundWater
	
	; HP Grass
	ld de, .HPGrassPattern
	call .ComparePattern
	jr c, .foundGrass
	
	; HP Electric
	ld de, .HPElectricPattern
	call .ComparePattern
	jr c, .foundElectric
	
	; HP Psychic
	ld de, .HPPsychicPattern
	call .ComparePattern
	jr c, .foundPsychic
	
	; HP Ice
	ld de, .HPIcePattern
	call .ComparePattern
	jr c, .foundIce
	
	; HP Dragon
	ld de, .HPDragonPattern
	call .ComparePattern
	jr c, .foundDragon
	
	; HP Dark
	ld de, .HPDarkPattern
	call .ComparePattern
	jr c, .foundDark
	
	; No match found
	xor a
	jr .done

.foundFighting:
	ld a, 1
	jr .done
.foundFlying:
	ld a, 2
	jr .done
.foundPoison:
	ld a, 3
	jr .done
.foundGround:
	ld a, 4
	jr .done
.foundRock:
	ld a, 5
	jr .done
.foundBug:
	ld a, 6
	jr .done
.foundGhost:
	ld a, 7
	jr .done
.foundSteel:
	ld a, 8
	jr .done
.foundFire:
	ld a, 9
	jr .done
.foundWater:
	ld a, 10
	jr .done
.foundGrass:
	ld a, 11
	jr .done
.foundElectric:
	ld a, 12
	jr .done
.foundPsychic:
	ld a, 13
	jr .done
.foundIce:
	ld a, 14
	jr .done
.foundDragon:
	ld a, 15
	jr .done
.foundDark:
	ld a, 16
	
.done
	pop bc
	pop de
	pop hl
	ret

.ComparePattern:
	; Compare 3 bytes at hl with pattern at de
	; Returns carry set if match
	push hl
	push bc
	ld b, 3
.compare_loop
	ld a, [de]
	cp [hl]
	jr nz, .no_match
	inc hl
	inc de
	dec b
	jr nz, .compare_loop
	; Match found
	pop bc
	pop hl
	scf
	ret
.no_match
	pop bc
	pop hl
	and a  ; clear carry
	ret

.HPFightingPattern:
	db $ff, $ee, $ee
.HPFlyingPattern:
	db $ff, $fe, $ee
.HPPoisonPattern:
	db $ff, $ef, $ee
.HPGroundPattern:
	db $ff, $ff, $ee
.HPRockPattern:
	db $ff, $ee, $fe
.HPBugPattern:
	db $ff, $fe, $fe
.HPGhostPattern:
	db $ff, $ef, $fe
.HPSteelPattern:
	db $ff, $ff, $fe
.HPFirePattern:
	db $ff, $ee, $ef
.HPWaterPattern:
	db $ff, $fe, $ef
.HPGrassPattern:
	db $ff, $ef, $ef
.HPElectricPattern:
	db $ff, $00, $ef
.HPPsychicPattern:
	db $ff, $ee, $ff
.HPIcePattern:
	db $ff, $fe, $ff
.HPDragonPattern:
	db $ff, $ef, $ff
.HPDarkPattern:
	db $fe, $ff, $ff

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

	; First check for HP type patterns
	call CheckDVsHPType
	and a
	jr nz, .HPTypeEffect

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

.HPTypeEffect:
	; Apply HP type special palette based on value in a
	push hl
	push bc
	push af
	
	; Calculate offset for palette table
	dec a  ; Convert to 0-based index
	add a  ; Multiply by 2 (word size)
	ld e, a
	ld d, 0
	
	; Get light color
	ld hl, .HPTypePalsLite
	add hl, de
	ld a, [hli]
	ld e, a          ; e = low byte
	ld a, [hl]
	ld d, a          ; d = high byte
	
	pop af
	pop bc
	pop hl
	
	; Store lite RGB (no byte swapping)
	ld a, e          ; store low byte first
	ld [hli], a
	ld a, d          ; store high byte second
	ld [hli], a
	
	; Get dark color
	push hl
	push bc
	push af
	
	dec a  ; Convert to 0-based index again
	add a  ; Multiply by 2
	ld e, a
	ld d, 0
	
	ld hl, .HPTypePalsDark
	add hl, de
	ld a, [hli]
	ld e, a          ; e = low byte
	ld a, [hl]
	ld d, a          ; d = high byte
	
	pop af
	pop bc
	pop hl
	
	; Store dark RGB (no byte swapping)
	ld a, e          ; store low byte first
	ld [hli], a
	ld a, d          ; store high byte second
	ld [hl], a
	
	pop af
	ldh [rSVBK], a
	ret

.HPTypePalsLite:
if !DEF(MONOCHROME)
	RGB 31, 16, 0    ; Fighting
	RGB 0, 9, 21     ; Flying
	RGB 15, 13, 29   ; Poison
	RGB 18, 10, 4    ; Ground
	RGB 6, 10, 10    ; Rock
	RGB 4, 17, 4     ; Bug : this sets correct 
	RGB 6, 3, 5      ; Ghost
	RGB 14, 16, 18   ; Steel
	RGB 28, 5, 5     ; Fire
	RGB 4, 18, 31    ; Water
	RGB 6, 25, 6     ; Grass
	RGB 5, 3, 13     ; Electric
	RGB 9, 0, 16     ; Psychic
	RGB 16, 25, 29   ; Ice
	RGB 10, 12, 27   ; Dragon
	RGB 8, 6, 6      ; Dark
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

.HPTypePalsDark:
if !DEF(MONOCHROME)
	RGB 23, 24, 23   ; Fighting
	RGB 27, 28, 31   ; Flying
	RGB 6, 25, 6     ; Poison
	RGB 25, 24, 21   ; Ground
	RGB 17, 14, 10   ; Rock
	RGB 27, 2, 7     ; Bug: sets as 10-16-25
	RGB 17, 9, 17    ; Ghost
	RGB 23, 23, 23   ; Steel
	RGB 31, 21, 11   ; Fire
	RGB 21, 29, 29   ; Water
	RGB 25, 16, 8    ; Grass
	RGB 31, 26, 0    ; Electric
	RGB 31, 2, 18    ; Psychic
	RGB 29, 31, 31   ; Ice
	RGB 30, 23, 0    ; Dragon: sets as 24-24-14
	RGB 16, 27, 30   ; Dark: sets as 18-19-23
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