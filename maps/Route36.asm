Route36_MapScriptHeader:
	def_scene_scripts

	def_callbacks

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
	object_event 53,  6, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ArthurScript, -1
	fruittree_event 25,  4, FRUITTREE_ROUTE_36, RAWST_BERRY, PAL_NPC_BLUE
	object_event 40,  6, SPRITE_KURT, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route36KurtScript, EVENT_BEAT_FALKNER
	pokemon_event 45,  8, BRONZONG, -1, -1, PAL_NPC_BLUE, Route36BronzongText, -1
	object_event 30,  9, SPRITE_MATRON, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route36MatronScript, -1
	object_event 46,  9, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route36Scientist1Text, -1
	object_event 47, 10, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route36Scientist2Text, -1
	object_event 35,  5, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSchoolboyRoute36, -1 ; ALAN1
	object_event 28, 11, SPRITE_FIREBREATHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerFirebreatherRoute36, -1 ; BURT
	object_event 55, 10, SPRITE_PICNICKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerPicnickerRoute36, -1 ; GINA1


	object_const_def



Route36KurtScript:
	jumptextfaceplayer Route36KurtText

Route36MatronScript:
	faceplayer
	opentext
	writetext Route36MatronAskHealText
	yesorno
	iffalse .Refused
	writetext Route36MatronHealText
	waitbutton
	closetext
	playmusic MUSIC_HEAL
	special HealParty
	pause 60
	special RestartMapMusic
	opentext
	writetext Route36MatronHealedText
	waitbutton
	closetext
	end

.Refused:
	writetext Route36MatronRefusedText
	waitbutton
	closetext
	end

GenericTrainerSchoolboyRoute36:
	generictrainer SCHOOLBOY, ALAN1, EVENT_BEAT_SCHOOLBOY_ALAN, Route36SchoolboySeenText, Route36SchoolboyBeatenText

	text "You should pay"
	line "attention to"
	cont "abilities."
	done

GenericTrainerFirebreatherRoute36:
	generictrainer FIREBREATHER, BURT, EVENT_BEAT_FIREBREATHER_BURT, Route36FirebreatherSeenText, Route36FirebreatherBeatenText

	text "You can make anti-"
	line "dotes from poison"
	cont "type #mon."
	para "It's a great exam-"
	line "ple of Yin and"
	cont "Yang."
	done

GenericTrainerPicnickerRoute36:
	generictrainer PICNICKER, GINA1, EVENT_BEAT_PICNICKER_GINA, Route36PicnickerSeenText, Route36PicnickerBeatenText

	text "What to do?"
	
	para "Go back and heal,"
	line "or wait for my"
	cont "boyfriend?"
	
	para "He was so ex-"
	line "cited to make"
	cont "s'mores tonight."
	done

Route36KurtText:
	text "<PLAYER>: Drat!"
	line "They've blocked"
	cont "the route into"
	cont "Ecruteak…"
	para "We'll have to find"
	line "another way"
	cont "around."
	done

Route36BronzongText:
	text "Bronzong: Bong…"
	line "…Bong…"
	done

Route36MatronAskHealText:
	text "You look tired"
	line "from playing at"
	cont "the National Park."
	para "Would you like me"
	line "to heal your"
	cont "#mon?"
	done

Route36MatronHealText:
	text "OK, I'll take care"
	line "of your #mon."
	done

Route36MatronHealedText:
	text "There you go! Your"
	line "#mon are fully"
	cont "healed."
	done

Route36MatronRefusedText:
	text "OK. Please take"
	line "care!"
	done

Route36Scientist1Text:
Route36Scientist2Text:
	text "We're trying to"
	line "get this #mon"
	cont "out of the dirt,"
	cont "but it's so big…"
	done

Route36SchoolboySeenText:
	text "I've got a brand"
	line "new strategy!"
	done

Route36SchoolboyBeatenText:
	text "Overcome…"
	done

Route36FirebreatherSeenText:
	text "My poison types"
	line "will corrode you!"
	done

Route36FirebreatherBeatenText:
	text "Now I'm not"
	line "feeling so good…"
	done

Route36PicnickerSeenText:
	text "I found some good"
	line "kindling for a"
	cont "fire!"
	
	para "I can battle you"
	line "while I wait for"
	cont "my boyfriend."
	done

Route36PicnickerBeatenText:
	text "Oh no, now I've"
	line "got to go back"
	cont "and heal..."
	
	para "I hope Roland"
	line "doesn't get"
	cont "confused and"
	cont "go back home."
	done

ArthurScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_HARD_STONE_FROM_ARTHUR
	iftrue .AlreadyGotStone
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
