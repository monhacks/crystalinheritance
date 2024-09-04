GauldenrodDorms_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  4,  5, GAULDENROD, 1
	warp_event  5,  5, GAULDENROD, 1

	def_coord_events

	def_bg_events
	bg_event  0,  2, BGEVENT_READ, GauldenrodDormsBed
	bg_event  0,  3, BGEVENT_READ, GauldenrodDormsBed
	bg_event  0,  4, BGEVENT_READ, GauldenrodDormsBed
	bg_event  0,  5, BGEVENT_READ, GauldenrodDormsBed

	def_object_events
	object_event 2, 1, SPRITE_KURT, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GauldenrodDormsKurtScript, -1
	object_event 5, 2, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, GauldenrodDormsNPC1Text, -1
	object_event 5, 3, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, GauldenrodDormsNPC2Text, -1
	object_event 3, 3, SPRITE_POKEFAN_F, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, GauldenrodDormsNPC3Text, -1

	object_const_def

GauldenrodDormsNPC1Text:
	text "I wish the protest"
	line "wouldn't be so"
	cont "violent."

	para "When they were"
	line "blocking the gate,"
	cont "I saw a Flareon"
	cont "brought out!"
	done

GauldenrodDormsNPC2Text:
	text "The underground"
	line "movement doesn't"
	cont "have a right to"
	cont "cause commotion."
	done

GauldenrodDormsNPC3Text:
	text "Here, take a rest."
	
	para "The fighting on"
	line "both sides wears"
	cont "me out."
	done

GauldenrodDormsBed:
	showtext BedText1
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	special HealParty
	playmusic MUSIC_HEAL
	pause 60
	special RestartMapMusic
	special Special_FadeInQuickly
	showtext BedText2
	end

BedText1:
	text "A comfy bed!"
	line "Time to sleep…"
	done

BedText2:
	text "Ah, refreshed and"
	line "restored!"
	done

GauldenrodDormsKurtScript:
	faceplayer
	opentext
	writetext KurtGauldenrodDormsText
	promptbutton
	special PokemonCenterPC
	endtext
	end

KurtGauldenrodDormsText:
	text "<PLAYER>. We need"
	line "to get to Olivine,"
	cont "which means we"
	cont "will have to pass"
	cont "through Ecruteak."

	para "We need to find a"
	line "way to get to"
	cont "Ecruteak."

	para "Maybe we can pass"
	line "through whatever"
	cont "used to be at the"
	cont "National Park?"

	para "Also, if you"
	line "need me to run"
	cont "quick back to our"
	cont "time to access a"
	cont "PC, I can. Just"
	cont "let me know what"
	cont "you need."
	done
