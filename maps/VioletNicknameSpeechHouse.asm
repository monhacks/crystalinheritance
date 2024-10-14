VioletNicknameSpeechHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  3,  7, VIOLET_CITY, 4
	warp_event  4,  7, VIOLET_CITY, 4

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, jumptextfaceplayer, VioletNicknameSpeechHouseTeacherScript, -1
	object_event  6,  4, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, VioletNicknameSpeechHouseLassText, -1
	pokemon_event  6,  2, TANGELA, -1, -1, PAL_NPC_GREEN, TangelaVioletText, -1
	object_event  0,  2, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_COMMAND, jumptextfaceplayer, VioletNicknameSpeechHouseGrampsText, -1

VioletNicknameSpeechHouseTeacherScript: 
	checkevent EVENT_GOT_GIGA_DRAIN ; 
	iftrue_jumptextfaceplayer VioletCity_GotGigaDrain
	faceplayer
	opentext
	writetext VioletCityGiveGigaDrainText
	promptbutton
	verbosegivetmhm TM_GIGA_DRAIN
	setevent EVENT_GOT_GIGA_DRAIN
	jumpthisopenedtext

VioletCity_GotGigaDrain:
	text "If you get thir-"
	line "sty, you can use"
	cont "that TM."
	done
	
VioletCityGiveGigaDrainText:
	text "The shorelines"
	line "in town recede"
	cont "more each day."
	
	para "That's why we use"
	line "this TM to get"
	cont "enough water."
	done

VioletNicknameSpeechHouseTeacherText:
	text "She uses the names"
	line "of her favorite"
	cont "things to eat."

	para "For the nicknames"
	line "she gives to her"
	cont "#mon, I mean."
	done

VioletNicknameSpeechHouseLassText:
	text "My Tangela gets"
	line "water from the"
	cont "mud!"
	done

VioletNicknameSpeechHouseGrampsText:
	text "The Zephyr Badge"
	line "is named after an"

	para "ancient god of the"
	line "west wind."

	para "Very fitting for a"
	line "Flying-type Gym."
	done

TangelaVioletText:
	text "Tangela: La!"
	done
