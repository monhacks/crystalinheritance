StadiumUnderground_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_STONETABLE, StadiumUndergroundBoulders

	def_warp_events
	warp_event  3, 13, STADIUM_GROUNDS, 3
	warp_event  11, 1, STADIUM_BOX, 2

	def_coord_events

	def_bg_events

	def_object_events
	strengthboulder_event  5, 3, EVENT_BOULDER_IN_STADIUM_UNDERGROUND
	object_event 11,  2, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, StadiumUndergroundWarpNPCScript, EVENT_BOULDER_IN_STADIUM_UNDERGROUND
	object_event  3,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, StadiumUndergroundNPC1Script, EVENT_BOULDER_IN_STADIUM_UNDERGROUND
	object_event  4,  1, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, StadiumUndergroundNPC2Script, EVENT_BOULDER_IN_STADIUM_UNDERGROUND
	object_event  2,  2, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, StadiumUndergroundHealerScript, EVENT_BOULDER_IN_STADIUM_UNDERGROUND

	object_const_def
	const STADIUMUNDERGROUND_BOULDER1
	const STADIUMUNDERGROUND_NPC

StadiumUndergroundBoulders:
	usestonetable .BoulderTable
	endcallback

.BoulderTable:
	stonetable 5, STADIUMUNDERGROUND_BOULDER1, .Disappear
	db -1 ; end

.Disappear:
	disappear STADIUMUNDERGROUND_BOULDER1
	pause 30
	playsound SFX_STRENGTH
	earthquake 80
	jumpthistext

	text "The boulder fell"
	line "through!"
	
	text "There's a sound"
	line "of water filling"
	cont "up a basin..."
	done

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
	text "There may be a"
	line "big battle up"
	cont "ahead."

	para "Let me heal your"
	cont "#mon."
	done

StadiumUndergroundHealedText:
	text "Your #mon are"
	line "fully healed."
	done
	
	
StadiumUndergroundWarpNPCScript:
	faceplayer
	opentext
	checkevent STADIUM_UNDERGROUND_MOVED_ASIDE
	iftrue .MovedAside
	checkevent EVENT_BOULDER_IN_STADIUM_UNDERGROUND
	iftrue .MovesAside
	writetext StadiumUndergroundBoulderText
	waitbutton
	closetext
	end 
	
.MovesAside:
	writetext StadiumUndergroundMovesAsideText
	waitbutton
	closetext
	applyonemovement STADIUMUNDERGROUND_NPC, step_up
	turnobject STADIUMUNDERGROUND_NPC, RIGHT
	setevent STADIUM_UNDERGROUND_MOVED_ASIDE
	end

.MovedAside:
	writetext LetsRescueSandraText
	waitbutton
	closetext
	end

LetsRescueSandraText:
	text "Let's go save"
	line "Sandra!"
	done
	
StadiumUndergroundBoulderText:
	text "We need to fill"
	line "in that hole to"
	cont "divert the under-"
	cont "water springs"
	cont "into the stadium."
	done
	
StadiumUndergroundMovesAsideText:
	text "You did it!"
	
	para "The underground"
	line "springs are now"
	cont "being diverted"
	cont "underneath the"
	cont "stadium."
	
	para "Soon, we will"
	line "flush out that"
	cont "General Bobesh!"
	done