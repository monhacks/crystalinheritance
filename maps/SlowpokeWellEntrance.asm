SlowpokeWellEntrance_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 11,  7, AZALEA_TOWN, 6
	warp_event  7,  5, SLOWPOKE_WELL_B1F, 1

	def_coord_events

	def_bg_events
	bg_event  6, 13, BGEVENT_ITEM + SUPER_POTION, EVENT_SLOWPOKE_WELL_ENTRANCE_HIDDEN_SUPER_POTION

	def_object_events
	object_event  3,  4, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SlowpokeWellFishingGuruScript, -1

SlowpokeWellFishingGuruScript:
	checkevent EVENT_GOT_OLD_ROD
	iftrue_jumptextfaceplayer .DoneText
	faceplayer
	opentext
	writetext .IntroText
	yesorno
	iffalse_jumpopenedtext .NoText
	writetext .YesText
	promptbutton
	verbosegivekeyitem OLD_ROD
	writetext .AfterText
	waitbutton
	closetext
	setevent EVENT_GOT_OLD_ROD
	end

.IntroText:
	text "I came to fish"
	line "for magikarp,"
	cont "but the well"
	cont "is too dry."
	
	para "Looks like my"
	line "fishing days"
	cont "are over."
	
	para "Say, would you"
	line "like this old"
	cont "fishing rod?"
	done

.YesText:
	text "Hey that's great!"
	line "A new generation"
	cont "of anglers."
	done

.AfterText:
	text "You're sure to"
	line "find some water"
	cont "if you explore."
	
	para "I used to fish"
	line "for Poliwags"
	cont "for hours. They"
	cont "put me in a"
	cont "trance!"
	done

.NoText:
	text "Oh. That's rather"
	line "disappointing…"
	done

.DoneText:
	text "Catch much?"
	line "they biting?"
	done