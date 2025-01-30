OlivinePunishmentSpeechHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, OLIVINE_CITY, 4
	warp_event  3,  7, OLIVINE_CITY, 4

	def_coord_events

	def_bg_events

	def_object_events
	object_event  1,  2, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BROWN,  OBJECTTYPE_SCRIPT, 0, VoltSwitchScript, -1
	object_event  5,  5, SPRITE_BEAUTY, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, jumptextfaceplayer, OlivinePunishmentSpeechHouseDaughterText, -1
	object_event  2,  5, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OlivineLightBallScript, -1
	


VoltSwitchScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_VOLT_SWITCH
	iftrue_jumpopenedtext GaveVoltSwitchText
	writetext GiveVoltSwitchText
	promptbutton
	verbosegivetmhm TM_VOLT_SWITCH
	writetext GaveVoltSwitchText
	waitbutton
	closetext
	setevent EVENT_GOT_VOLT_SWITCH
	end

GiveVoltSwitchText:
	text "Kids grow up so"
	line "fast. One day,"
	para "you see cute"
	line "little girls. The"
	cont "next, they're"
	cont "all grown."
	
	para "Reminds me of my"
	line "favorite TM -"
	cont "Volt Switch."
	done

GaveVoltSwitchText:
	text "Your opponent"
	line "won't know what's"
	cont "in front of them"
	cont "with Volt Switch!"
	done


OlivinePunishmentSpeechHouseDaughterText:
	text "I keep trying to"
	line "find an entry-"
	cont "level position,"
	
	para "but the Slowking"
	line "compute does all"
	cont "those things now."
	
	para "I hope I can do"
	line "something, so I"
	cont "can move out."
	done


OlivineLightBallScript:
	faceplayer
	opentext	
	writetext NeedAGoldLeafText
	waitbutton
	checkitem GOLD_LEAF
	iffalse_jumpopenedtext NoGoldLeafText
	writetext Text_GoldLeafMailQuestion ;;
	yesorno
	iffalse_jumpopenedtext NoGoldLeafText
	takeitem GOLD_LEAF
	verbosegiveitem LIGHT_BALL, 2
	iffalse_endtext
	jumpopenedtext GiveLightBallText 

NeedAGoldLeafText:
	text "My boyfriend is"
	line "so shallow. His"
	cont "family cares so"
	cont "much about appea-"
	cont "rances."
	
	para "I need to impress"
	line "them with my next"
	cont "letter."
	done

NoGoldLeafText:
	text "How will I make"
	line "my letters shine?"
	done

Text_GoldLeafMailQuestion:
	text "Oh, Gold Leaf!"
	line "What an idea!"
	
	para "I'll give you my"
	line "best beach toy,"
	
	para "A Light Ball to"
	line "play volleyball"
	cont "with!"
	done

GiveLightBallText:
	text "That ball is sure"
	line "to attract people"
	cont "and #mon"
	cont "at the beach!"
	done
