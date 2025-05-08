OlivineMart_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, OLIVINE_CITY, 7
	warp_event  3,  7, OLIVINE_CITY, 7

	def_coord_events

	def_bg_events

	def_object_events
	mart_clerk_event  1,  3, MARTTYPE_STANDARD, MART_OLIVINE
	object_event  6,  2, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, OlivineMartCooltrainerFText, -1
	object_event  1,  6, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, OlivineMartLassText, -1
; ability patch vendor 
	object_event 3,  5, SPRITE_ENGINEER, SPRITEMOVEDATA_STANDING_RIGHT, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, AbilityPatchVendorScript, -1



OlivineMartCooltrainerFText:
	text "Chuck's Slowking"
	line "is just another"
	cont "invention. It may"
	para "disrupt a few"
	line "jobs, but I can't"
	cont "imagine doing"
	cont "mine without it."
	done

OlivineMartLassText:
	text "Jasmine hasn't"
	line "responded to any"
	cont "calls asking her"
	para "to look in to the"
	line "effect that the"
	cont "Desal Plant is"
	cont "having on the"
	cont "shoreline."	
	done

AbilityPatchVendorScript:
	faceplayer
	opentext
	writetext GivingPatchText
	special PlaceMoneyTopRight
	yesorno
	iffalse_jumpopenedtext NoMoneyTextPatch
	checkmoney $0, 30000
	ifequal $2, .NotEnoughMoney 
	promptbutton
	giveitem ABILITYPATCH
	iffalse_jumpopenedtext NoRoomTextPatch
	playsound SFX_TRANSACTION
	takemoney $0, 30000
	special PlaceMoneyTopRight
	writetext GotPatchText
	waitbutton
	closetext
	end

.NotEnoughMoney:
	jumptext NoMoneyTextPatch

GivingPatchText:
	text "Thanks to using"
	line "Super Sloking,"
	
	para "I've developed an"
	line "Ability Patch to"
	cont "change #mon"
	para "to their Hidden"
	line "ability!"
	
	para "I'll sell to you"
	line "for 30k. Deal?"
	done
	
GotPatchText:
	text "Try it out! I have"
	line "as many as you"
	cont "need."
	done

NoMoneyTextPatch:
	text "This isn't easy"
	line "to make!"
	done

NoRoomTextPatch:
	text "Oh! You won't"
	line "take it?"
	done