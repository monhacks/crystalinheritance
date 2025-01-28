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
	para "you see a cute"
	line "little girl. The"
	cont "next, she's a"
	cont "grown woman."
	
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
