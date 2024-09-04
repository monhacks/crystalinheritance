StadiumUnderground_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  5,  1, GAULDENROD_UNDERGROUND, 3
	warp_event  6,  1, GAULDENROD_UNDERGROUND, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, StadiumUndergroundNPC1Script, -1
	object_event  7,  6, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, StadiumUndergroundNPC2Script, -1
	object_event  2,  2, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, StadiumUndergroundHealerScript, -1
	strengthboulder_event  5, 3
	strengthboulder_event  6, 5

StadiumUndergroundNPC1Script:
	jumptextfaceplayer StadiumUndergroundNPC1Text

StadiumUndergroundNPC1Text:
	text "Are you the new"
	line "recruit? We've"
	cont "almost finished"
	cont "clearing the rock"
	cont "in front of the"
	cont "aquifer."

	para "Soon, the whole"
	line "stadium will be"
	cont "flooded."

	para "I think I heard"
	line "the elder up"
	cont "there."
	done

StadiumUndergroundNPC2Script:
	jumptextfaceplayer StadiumUndergroundNPC2Text

StadiumUndergroundNPC2Text:
	text "I don't know if I"
	line "can go through"
	cont "with this…"

	para "If we hurt anyone,"
	line "it will be hard"
	cont "to explain"
	cont "myself."
	done

StadiumUndergroundHealerScript:
	opentext
	writetext StadiumUndergroundHealerText
	waitbutton
	closetext
	playmusic MUSIC_HEAL
	special HealParty
	pause 30
	special FadeInQuickly
	special RestartMapMusic
	opentext
	writetext StadiumUndergroundHealedText
	waitbutton
	closetext
	end

StadiumUndergroundHealerText:
	text "Your #MON look"
	line "tired. Let me"
	cont "heal them for"
	cont "you."
	done

StadiumUndergroundHealedText:
	text "Your #MON are"
	line "fully healed."

	para "Be careful out"
	line "there."
	done
	