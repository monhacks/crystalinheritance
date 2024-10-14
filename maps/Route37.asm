Route37_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events

	def_coord_events

	def_bg_events
	bg_event  5,  3, BGEVENT_JUMPTEXT, Route37SignText
	bg_event  4,  2, BGEVENT_ITEM + ETHER, EVENT_ROUTE_37_HIDDEN_ETHER

	def_object_events
	object_event 16,  8, SPRITE_ENGINEER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SunnyScript, -1 ; ok 
	object_event  6, 12, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerTwinsToriandtil1, -1
	object_event  7, 12, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerTwinsToriandtil2, -1
	object_event 14, 11, SPRITE_PSYCHIC, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerPsychicGreg, -1
	object_event  4,  6, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBeautyCallie, -1
	object_event  9,  6, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBeautyCassandra, -1
	fruittree_event 13,  5, FRUITTREE_ROUTE_37_1, TOUGH_LEAVES, PAL_NPC_GREEN
	fruittree_event 16,  5, FRUITTREE_ROUTE_37_2, WHT_APRICORN, PAL_NPC_SILVER
	fruittree_event 11, 11, FRUITTREE_ROUTE_37_3, SHORE_FOAM, PAL_NPC_BLUE

	object_const_def


GenericTrainerTwinsToriandtil1:
	generictrainer TWINS, ANNANDANNE1, EVENT_BEAT_TWINS_ANN_AND_ANNE, TwinsToriandtil1SeenText, TwinsToriandtil1BeatenText

	text "Til: I can tell"
	line "what my sister and"

	para "my #mon are"
	line "thinking."
	done

GenericTrainerTwinsToriandtil2:
	generictrainer TWINS, ANNANDANNE2, EVENT_BEAT_TWINS_ANN_AND_ANNE, TwinsToriandtil2SeenText, TwinsToriandtil2BeatenText

	text "Tori: We share the"
	line "same feelings as"
	cont "our #mon."
	done

GenericTrainerPsychicGreg:
	generictrainer PSYCHIC_T, GREG, EVENT_BEAT_PSYCHIC_GREG, PsychicGregSeenText, PsychicGregBeatenText

	text "Putting #mon to"
	line "sleep or paralyz-"
	cont "ing them are good"
	cont "battle techniques."
	done

SunnyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_ZAP_CANNON
	iftrue .AlreadyGotTM
	checkevent EVENT_MET_SUNNY_OF_SUNDAY
	iftrue .MetSunny
	writetext MeetSunnyText
	promptbutton
	setevent EVENT_MET_SUNNY_OF_SUNDAY
.MetSunny:
	writetext SunnyGivesGiftText
	promptbutton
	verbosegivetmhm TM_ZAP_CANNON
	iffalse .BagFull
	setevent EVENT_GOT_ZAP_CANNON
	jumpopenedtext SunnyGaveGiftText

.AlreadyGotTM:
	writetext SunnySundayText
	waitbutton
.BagFull:
	endtext

MeetSunnyText:
	text "Sunny: Who are"
	line "you?"

	para "I'm Sunny of"
	line "Sunday."
	done

SunnyGivesGiftText:
	text "I got this from"
	line "someone in Kanto."
	
	para "Maybe they should"
	line "use it to start"
	cont "the Magnet train"
	cont "again."
	done

SunnyGaveGiftText:
	text "Sunny: That"
	line "technique may"
	cont "not hit often,"
	cont "but when it does,"
	cont "it's wicked!"
	done

SunnySundayText:
	text "Sunny: I'm Sunny"
	line "of Sunday."

	done


GenericTrainerBeautyCallie:
	generictrainer BEAUTY, CALLIE, EVENT_BEAT_BEAUTY_CALLIE, BeautyCallieSeenText, BeautyCallieBeatenText

	text "Wow, you're cute"
	line "and skilled too!"
	done

GenericTrainerBeautyCassandra:
	generictrainer BEAUTY, CASSANDRA, EVENT_BEAT_BEAUTY_CASSANDRA, BeautyCassandraSeenText, BeautyCassandraBeatenText

	text "People like you"
	line "are skilled even"

	para "though they're"
	line "young…"
	done

TwinsToriandtil1SeenText:
	text "Til: Tori and I"
	line "are in this to-"
	cont "gether!"
	done

TwinsToriandtil1BeatenText:
TwinsToriandtil2BeatenText:
	text "Til & Tori: Nnn… A"
	line "little too strong."
	done

TwinsToriandtil2SeenText:
	text "Tori: Til and I"
	line "are in this to-"
	cont "gether!"
	done

PsychicGregSeenText:
	text "#mon can't do a"
	line "thing if they are"
	cont "asleep."

	para "I'll show you how"
	line "scary that is!"
	done

PsychicGregBeatenText:
	text "I lost. That's"
	line "pretty sad…"
	done


BeautyCallieSeenText:
	text "Oh, you're a cute"
	line "little trainer!"

	para "Why don't you"
	line "battle me?"
	done

BeautyCallieBeatenText:
	text "You're good…"
	done

BeautyCassandraSeenText:
	text "Hey hey there,"
	line "you young trainer!"

	para "Won't you battle"
	line "with me?"
	done

BeautyCassandraBeatenText:
	text "Wow, you're strong…"
	done

Route37SignText:
	text "Route 37"
	done
