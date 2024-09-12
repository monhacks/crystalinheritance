Route36_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, Route36ArthurCallback

	def_warp_events
	warp_event 22,  8, ROUTE_36_NATIONAL_PARK_GATE, 3
	warp_event 22,  9, ROUTE_36_NATIONAL_PARK_GATE, 4
	warp_event 51, 13, ROUTE_36_RUINS_OF_ALPH_GATE, 1
	warp_event 52, 13, ROUTE_36_RUINS_OF_ALPH_GATE, 2
	warp_event 61,  8, ROUTE_36_VIOLET_GATE, 1
	warp_event 61,  9, ROUTE_36_VIOLET_GATE, 2

	def_coord_events


	def_bg_events
	bg_event 33,  1, BGEVENT_JUMPTEXT, Route36TrainerTips2Text
	bg_event 49, 11, BGEVENT_JUMPTEXT, RuinsOfAlphNorthSignText
	bg_event 59,  7, BGEVENT_JUMPTEXT, Route36SignText
	bg_event 25,  7, BGEVENT_JUMPTEXT, Route36TrainerTips1Text

	def_object_events
	object_event 53,  6, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ArthurScript, EVENT_ROUTE_36_ARTHUR_OF_THURSDAY
	object_event 30,  6, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route36CooltrainerfChiaraScript, -1
	object_event 24, 13, SPRITE_PSYCHIC, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerPsychicMark, -1
	object_event 35, 14, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 5, TrainerSchoolboyAlan1, -1
	object_event 57,  9, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route36LassScript, -1
	fruittree_event 25,  4, FRUITTREE_ROUTE_36, RAWST_BERRY, PAL_NPC_BLUE

	object_const_def

Route36ArthurCallback:
	readvar VAR_WEEKDAY
	ifequal THURSDAY, .ArthurAppears
	disappear ROUTE36_ARTHUR
	endcallback

.ArthurAppears:
	appear ROUTE36_ARTHUR
	endcallback

GenericTrainerPsychicMark:
	generictrainer PSYCHIC_T, MARK, EVENT_BEAT_PSYCHIC_MARK, PsychicMarkSeenText, PsychicMarkBeatenText

	text "I'd be strong if"
	line "only I could tell"

	para "what my opponent"
	line "was thinking."
	done
	
ArthurScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_HARD_STONE_FROM_ARTHUR
	iftrue .AlreadyGotStone
	readvar VAR_WEEKDAY
	ifnotequal THURSDAY, ArthurNotThursdayScript
	checkevent EVENT_MET_ARTHUR_OF_THURSDAY
	iftrue .MetArthur
	writetext MeetArthurText
	promptbutton
	setevent EVENT_MET_ARTHUR_OF_THURSDAY
.MetArthur:
	writetext ArthurGivesGiftText
	promptbutton
	verbosegiveitem HARD_STONE
	iffalse .BagFull
	setevent EVENT_GOT_HARD_STONE_FROM_ARTHUR
	jumpopenedtext ArthurGaveGiftText

.AlreadyGotStone:
	writetext ArthurThursdayText
	waitbutton
.BagFull:
	endtext

ArthurNotThursdayScript:
	jumpopenedtext ArthurNotThursdayText

WeirdTreeMovement_Flee:
	fast_jump_step_up
	fast_jump_step_up
	step_end

PsychicMarkSeenText:
	text "I'm going to read"
	line "your thoughts!"
	done

PsychicMarkBeatenText:
	text "I misread you!"
	done

SchoolboyAlan1SeenText:
	text "Thanks to my stud-"
	line "ies, I'm ready for"
	cont "any #mon!"
	done

SchoolboyAlan1BeatenText:
	text "Oops! Computation"
	line "error?"
	done

SchoolboyAlanBooksText:
	text "Darn. I study five"
	line "hours a day too."

	para "There's more to"
	line "learning than just"
	cont "reading books."
	done

MeetArthurText:
	text "Arthur: Who are"
	line "you?"

	para "I'm Arthur of"
	line "Thursday."
	done

ArthurGivesGiftText:
	text "Here. You can have"
	line "this."
	done

ArthurGaveGiftText:
	text "Arthur: A #mon"
	line "that uses Rock-"

	para "type moves should"
	line "hold on to that."

	para "It pumps up Rock-"
	line "type attacks."
	done

ArthurThursdayText:
	text "Arthur: I'm Arthur"
	line "of Thursday. I'm"

	para "the second son out"
	line "of seven children."
	done

ArthurNotThursdayText:
	text "Arthur: Today's"
	line "not Thursday. How"
	cont "disappointing."
	done

Route36SignText:
	text "Route 36"
	done

RuinsOfAlphNorthSignText:
	text "Ruins of Alph"
	line "North Entrance"
	done

Route36TrainerTips1Text:
	text "Trainer Tips"

	para "#mon stats"
	line "vary--even within"
	cont "the same species."

	para "Their stats may be"
	line "similar at first."

	para "However, differ-"
	line "ences will become"

	para "pronounced as the"
	line "#mon grow."
	done

Route36TrainerTips2Text:
	text "Trainer Tips"

	para "Use Dig to return"
	line "to the entrance of"
	cont "any place."

	para "It is convenient"
	line "for exploring"

	para "caves and other"
	line "landmarks."
	done
