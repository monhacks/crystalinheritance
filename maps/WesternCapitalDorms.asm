WesternCapitalDorms_MapScriptHeader: ;	def_scene_scripts
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  4,  7, WESTERN_CAPITAL, 5
	warp_event  5,  7, WESTERN_CAPITAL, 5

	def_coord_events

	def_bg_events
	bg_event  0,  2, BGEVENT_READ, WesternCapitalDormsBed
	bg_event  0,  3, BGEVENT_READ, WesternCapitalDormsBed
	bg_event  0,  4, BGEVENT_READ, WesternCapitalDormsBed
	bg_event  0,  5, BGEVENT_READ, WesternCapitalDormsBed

	def_object_events
	object_event 1, 1, SPRITE_KURT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WesternCapitalDormsKurtScript, -1
	object_event 12, 3, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, WesternCapitalDormsNPC1Text, -1
	object_event 12, 4, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, WesternCapitalDormsNPC2Text, -1
	object_event 3, 3, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, WesternCapitalDormsNPC3Text, -1

	object_const_def

WesternCapitalDormsNPC1Text:
	text "I don't see why"
	line "we can't use the"
	para "old way of build-"
	line "ing towers."
	done

WesternCapitalDormsNPC2Text:
	text "If we use the"
	line "outsider methods,"
	para "our culture will be"
	line "lost!"
	done

WesternCapitalDormsNPC3Text:
	text "I hope that the"
	line "outsiders leave"
	cont "the port soon."
	done



WesternCapitalDormsBed:
	showtext WesternCapitalBedText1
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	special HealParty
	playmusic MUSIC_HEAL
	pause 60
	special RestartMapMusic
	special Special_FadeInQuickly
	showtext WesternCapitalBedText2
	end

WesternCapitalBedText1:
	text "A comfy bed!"
	line "Time to sleep…"
	done

WesternCapitalBedText2:
	text "Ah, refreshed and"
	line "restored!"
	done

WesternCapitalDormsKurtScript:
	faceplayer
	opentext
	writetext KurtWesternCapitalDormsText
	promptbutton
	special PokemonCenterPC
	endtext
	end

KurtWesternCapitalDormsText:
	text "<PLAYER>. We"
	line "need head west to"
	para "stop the flow of"
	line "Steel to Johto!"
	
	para "There must be a"
	line "way across the"
	cont "moat."
	done
