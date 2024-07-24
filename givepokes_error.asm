; in the map file
givepoke SHUCKLE, MALE | NO_FORM, 25, BERRY_JUICE, NET_BALL, POISON_JAB, TRUE, ShuckieName, ShuckieOTName, ShuckieOTIDAndCaughtGender

Script_givepoke:
; return 0 in hScriptVar if no room in party or box
; return 1 if sent to party, return 2 if sent to box
	call GetScriptByte
	ld [wCurPartySpecies], a
	call GetScriptByte
	ld [wCurForm], a
	call GetScriptByte
	ld [wCurPartyLevel], a
	call GetScriptByte
	ld [wCurItem], a
	call GetScriptByte
	ld [wGiftMonBall], a
	call GetScriptByte
	ld [wCurPlayerMove], a
	call GetScriptByte
	and a
	ld b, a
	jr z, .ok
	ld hl, wScriptPos
	ld e, [hl]
	inc hl
	ld d, [hl]
rept 6
	call GetScriptByte
endr
.ok
	farcall GivePoke
	ld a, b
	ldh [hScriptVar], a
	ret

; from move_mon.asm
GivePoke:: ; trying to track down which part of this is not working... seems to be an EB error?...
	push de
	push bc
	ld a, [wCurPartySpecies]
	ld [wEnemyMonSpecies], a
	xor a
	ld [wOTPartyCount], a
	ld [wCurOTMon], a
	inc a
	ld [wMonType], a
	ld [wBattleMode], a
	predef TryAddMonToParty
	lb bc, $81, 1
	farcall CopyBetweenPartyAndTemp

	xor a
	ld [wBattleMode], a
	ld hl, wTempMonItem
	ld a, [wCurItem]
	ld [hli], a
	ld a, [wCurPlayerMove]
	and a
	jr z, .no_move
	ld d, h
	ld e, l
	ld b, a
	ld c, NUM_MOVES
.move_loop
	ld a, [de]
	and a
	jr z, .add_move
	inc de
	dec c
	jr nz, .move_loop
	ld d, h
	ld e, l
.add_move
	ld a, b
	ld [de], a
	ld hl, Moves + MOVE_PP
	call GetMoveProperty
	ld hl, MON_PP - MON_MOVES
	add hl, de
	ld [hl], a

.no_move
	pop bc
	pop hl
	push bc
	ld a, b
	and a
	jmp nz, .trainer_data
	ld a, [wTempMonForm]
	bit MON_IS_EGG_F, a
	jr z, .not_egg
	ld de, String_Egg
	ld hl, wTempMonNickname
	call CopyName2
	ld hl, wTempMonHP
	xor a
	ld [hli], a
	ld [hl], a
	ld a, [wBaseEggSteps]
	and $f
	inc a
	ld b, a
	add a
	add a
	add b
	ld [wTempMonHappiness], a
.not_egg
	ld de, wTempMonNickname
	ld hl, wMonOrItemNameBuffer
	call CopyName2
	ld a, [wGiftMonBall]
	ld [wCurItem], a
	ld hl, wTempMonCaughtData
	farcall SetBoxmonOrEggmonCaughtData
.try_add
	call AddTempMonToParty
	ld d, PARTYMON
	jr nc, .added
	call .SetUpBoxMon
	jmp c, .FailedToGiveMon
	ld d, BOXMON

.added
	push de
	ld a, [wCurPartySpecies]
	ld [wNamedObjectIndex], a
	call GetPokemonName
	ld a, [wTempMonForm]
	bit MON_IS_EGG_F, a
	ld hl, ReceivedGiftEggText
	jr nz, .received_egg
	ld hl, ReceivedGiftMonText
.received_egg
	push af
	call PrintText
	pop af
	push af
	ld de, SFX_GET_EGG_FROM_DAYCARE_LADY
	jr nz, .received_egg_sfx
	ld de, SFX_CAUGHT_MON
.received_egg_sfx
	call PlayWaitSFX
	pop af
	pop bc
	jr nz, .skip_nickname
	push bc
	farcall GiveANickname_YesNo
	pop bc
	jr c, .skip_nickname
	push bc
	ld de, wTempMonNickname
	ld a, b
	and a
	jr nz, .got_nick
	ld hl, wPartyMonNicknames
	ld a, [wPartyCount]
	dec a
	call SkipNames
	ld d, h
	ld e, l
.got_nick
	push de
	call InitNickname
	pop de
	ld hl, wMonOrItemNameBuffer
	call CopyName2
	pop bc
.skip_nickname
	pop de
	ld a, b
	inc b
	and a
	ret z
	push de
	farcall UpdateStorageBoxMonFromTemp
	pop de
	ld a, d
	and a
	ld b, 2
	ret nz

	farcall CurBoxFullCheck
	jr z, .box_not_full
	ld hl, GiftMonBoxFullText
	push bc
	call PrintText
	pop bc
.box_not_full
	farcall GetBoxName
	ld a, [wTempMonForm]
	bit MON_IS_EGG_F, a
	ld hl, GiftEggSentToPCText
	jr nz, .egg_sent
	ld hl, GiftMonSentToPCText
.egg_sent
	jmp PrintText

.trainer_data
	ld de, wTempMonForm
	ld a, [wCurForm]
	ld b, a
	ld a, [de]
	and !GENDER_MASK
	or b
	ld [de], a
	push hl
	ld a, [wScriptBank]
	ld b, a
	call GetFarWord
	ld a, b
	push bc
	ld de, wTempMonNickname
	ld bc, MON_NAME_LENGTH
	call FarCopyBytes
	pop bc
	pop hl
	inc hl
	inc hl
	push hl
	push bc
	ld a, b
	call GetFarWord
	ld a, b
	ld de, wTempMonOT
	ld bc, PLAYER_NAME_LENGTH
	call FarCopyBytes
	pop bc
	pop hl
	inc hl
	inc hl
	ld a, b
	call GetFarWord
	push hl
	ld a, b
	call GetFarWord
	ld a, l
	ld [wTempMonID], a
	ld a, h
	ld [wTempMonID+1], a
	pop hl
	inc hl
	inc hl
	ld a, b
	call GetFarByte
	ld b, a
	ld a, [wGiftMonBall]
	ld c, a
	ld hl, wTempMonCaughtData
	farcall SetGiftMonCaughtData
	call AddTempMonToParty
	ld b, PARTYMON
	jmp nc, .skip_nickname
	call .SetUpBoxMon
	ld b, d
	jmp nc, .skip_nickname

.FailedToGiveMon:
	pop bc
	ld b, 0
	ret

.SetUpBoxMon:
	farcall NewStorageBoxPointer
	ret c
	ld a, b
	ld [wTempMonBox], a
	ld a, c
	ld [wTempMonSlot], a
	ld a, [wTempMonForm]
	bit MON_IS_EGG_F, a
	jr nz, .done
	ld a, [wCurPartySpecies]
	dec a
	call SetSeenAndCaughtMon
	ld a, [wCurPartySpecies]
	cp UNOWN
	jr nz, .check_magikarp
	farcall UpdateUnownDex
	ld a, [wFirstUnownSeen]
	and a
	jr nz, .check_magikarp
	ld a, [wTempMonForm]
	and FORM_MASK
	ld [wFirstUnownSeen], a
.check_magikarp
	ld a, [wCurPartySpecies]
	cp MAGIKARP
	jr nz, .done
	ld a, [wFirstMagikarpSeen]
	and a
	jr nz, .done
	ld a, [wTempMonForm]
	and FORM_MASK
	ld [wFirstMagikarpSeen], a
.done
	ld d, BOXMON
	and a
	ret