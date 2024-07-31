MistyBasin_MapScriptHeader: ; should be like  "BurnedTowerB1F_MapScriptHeader"
	def_scene_scripts


	def_callbacks


	def_warp_events
	warp_event  17, 15, ANARRES_TOWN, 8


	def_coord_events


	def_bg_events


	def_object_events

	object_event  4, 13, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSageChow, EVENT_BEAT_TAMMY 
	object_event  5,  4, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSageNico, EVENT_BEAT_TAMMY
	object_event 13,  3, SPRITE_HEX_MANIAC, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerMediumMartha, EVENT_BEAT_TAMMY
	object_event 14,  2, SPRITE_TAMMY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TammyScript, EVENT_BEAT_TAMMY
	object_event 14, 13, SPRITE_HEX_MANIAC, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, MistyBasonMatronText, -1 ;
;	fruittree_event 13, 13, FRUITTREE_MISTYBASIN, RADIANT_OPAL, PAL_NPC_RED

	object_const_def
	const MISTY_BASIN_CHOW
	const MISTY_BASIN_NICO
	const MISTY_BASIN_MARTHA
	const MISTY_BASIN_TAMMY



MistyBasonMatronText:
	text "A slowpoke yawn"
	line "causes rain. Ten"
	cont "elders ago,"
	cont "there was a"
	cont "drought, and it"
	cont "broke once we"
	cont "revered the"
	cont "simple act of a"
	cont "slowpoke yawn."
	done

GenericTrainerSageChow:
	generictrainer SAGE, CHOW, EVENT_BEAT_SAGE_CHOW, SageChowSeenText, SageChowBeatenText

	text "The Elder hoards"
	line "the HM Cut for"
	cont "himself. It's"
	cont "not right!"
	done

SageChowSeenText:
	text "Why are you"
	line "interrupting our"
	cont "meeting?"
	done

SageChowBeatenText:
	text "We're trying to"
	line "save the forest."
	done

GenericTrainerSageNico:
	generictrainer SAGE, NICO, EVENT_BEAT_SAGE_NICO, SageNicoSeenText, SageNicoBeatenText

	text "We're going to"
	line "confront the"
	cont "Elder."
	done

SageNicoSeenText:
	text "Don't tell"
	line "anyone we're"
	cont "here!"
	done

SageNicoBeatenText:
	text "Deflated."
	done

GenericTrainerMediumMartha:
	generictrainer MEDIUM, MARTHA, EVENT_BEAT_MEDIUM_MARTHA, MediumMarthaSeenText, MediumMarthaBeatenText

	text "Tammy developed"
	line "a method of"
	cont "hitting the"
	cont "trees to knock"
	cont "off Pineco."
	done

MediumMarthaSeenText:
	text "We'll fight from"
	line "the shadows if"
	cont "we have to!"
	done

MediumMarthaBeatenText:
	text "Whose side are"
	line "you on?"
	done

TammyScript:
	faceplayer
	showtext TammySeenText
	winlosstext TammyBeatenText, 0
	loadtrainer TAMMY, 1 ; call the right trainer?
	startbattle
	reloadmapafterbattle
	opentext
	setevent EVENT_BEAT_TAMMY
	writetext TammyAfterBattleText
	waitbutton
	closetext
	disappear MISTY_BASIN_CHOW
	disappear MISTY_BASIN_NICO
	applymovement MISTY_BASIN_MARTHA, MarthaMovement
	disappear MISTY_BASIN_MARTHA
	opentext
	writetext TammySeeYaText
	waitbutton
	closetext
	applymovement MISTY_BASIN_TAMMY, TammyMovementBasin
	disappear MISTY_BASIN_TAMMY
	end



TammyAfterBattleText:
	text "I invented a way"
	line "to teach"
	cont "techniques,"
	cont "ramming a tree."
	
	
	para "It shakes off"
	line "pineco without"
	cont "damaging the"
	cont "tree. The elder"
	cont "says it's"
	cont "unnatural."
	
	para "I want to talk,"
	line "but he just"
	cont "sits on top of"
	cont "the tower. Since"
	cont "you're so"
	cont "strong, and you"
	cont "need the HM too,"
	cont "can you talk to"
	cont "him with me?"
	done

TammySeenText:
	text "You've found our"
	line "secret meeting."
	cont "We've organized"
	cont "to confront the"
	cont "Elder. Oh?"
	cont "You're also"
	cont "trying to get"
	cont "the HM? Let's"
	cont "see if you're"
	cont "strong enough."
	done

TammyBeatenText:
	text "You've proven"
	line "yourself as a"
	cont "strong trainer."
	done

MarthaMovement:
	step_down
	step_right
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_end
	
TammyMovementBasin:
	step_left
	step_down
	step_down
	step_right
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_end

TammySeeYaText:	
	text "See you at the"
	line "tower!"
	done
