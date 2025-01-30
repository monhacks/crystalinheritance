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
	object_event  0,  2, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, VioletPickyEaterScript, -1
	pokemon_event  0,  3, PARASECT, -1, -1, PAL_NPC_GREEN, ParasectVioletText, -1


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

TangelaVioletText:
	text "Tangela: La!"
	done

ParasectVioletText:
	text "There are spoon-"
	line "sized divits and"
	cont "condiment residue"
	cont "all over its "
	cont "mushroom..."
	
	para "Yet it waddles"
	line "along with a"
	cont "vacant grin."
	done
	


VioletPickyEaterScript:
    faceplayer
    opentext
	writetext NeedRageCandyBarText
	waitbutton
	checkitem RAGECANDYBAR
	iffalse_jumpopenedtext Text_NoCandyBar
	writetext Text_BarQuestion
	yesorno
	iffalse_jumpopenedtext Text_NoCandyBar
	takeitem RAGECANDYBAR
	verbosegiveitem BIG_MUSHROOM
	iffalse_endtext
	jumpopenedtext GiveBigMushroomText
	

NeedRageCandyBarText:
    text "It's getting"
	line "dire here."
	
	para "Without water to"
	line "grow crops, we"
	cont "might have to eat"
	cont ".... MUSHROOMS."
	
	para "Falkner won't let"
	line "anyone in, so I"
	cont "haven't had candy"
	cont "in ages."
    done

Text_BarQuestion:
    text "Wait, I smell"
	line "it! Is that..."
	
	para "Ragecandybar?"
	line "Please, I'll give"
	cont "you the biggest"
	
	para "mushroom I've"
	line "harvested from"
	cont "ol' Paratricia?"	
    done

Text_NoCandyBar:
    text "Ugh...."
    done

GiveBigMushroomText:
    text "Thank goodness."
	line "Don't tell my"
	cont "sister."
    done
