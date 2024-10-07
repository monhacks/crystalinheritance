GoldenrodBandHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, GOLDENROD_CITY, 18
	warp_event  3,  7, GOLDENROD_CITY, 18

	def_coord_events

	def_bg_events

	def_object_events
	object_event  1,  3, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodBandHouseRocker1Text, -1
	object_event  6,  4, SPRITE_ROCKER, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodBandHouseRocker2Text, -1
	object_event  2,  4, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodBandHouseBattleGirlScript, -1

GoldenrodBandHouseRocker1Text:
	text "I think we should"
	line "become a metal"
	cont "band."
	
	para "We can call our-"
	line "selves Bloodbath"
	cont "and Beyond."
	done

GoldenrodBandHouseRocker2Text:
	text "Our cover band is"
	line "called Guns and"
	cont "Roserades."
	done

GoldenrodBandHouseBattleGirlScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_MUSCLE_BAND
	iftrue .AlreadyGotItem
	writetext GoldenrodBandHouseBattleGirlText1
	promptbutton
	verbosegiveitem MUSCLE_BAND
	iffalse .BagFull
	setevent EVENT_GOT_MUSCLE_BAND
	jumpthisopenedtext

	text "That Muscle Band"
	line "will power up your"
	cont "#mon's physical"
	cont "moves."

	para "It's perfect for"
	line "a rock band!"
	done

.AlreadyGotItem:
	jumpthisopenedtext
	
	text "Rock on with that"
	line "Muscle Band!"
	done

.BagFull:
	jumpthisopenedtext
	
	text "Oh, your bag is"
	line "full. Make some"
	cont "room and come back"
	cont "for this sweet"
	cont "Muscle Band!"
	done

GoldenrodBandHouseBattleGirlText1:
	text "You want to be in"
	line "the band?"
	
	para "Take this. It'll"
	line "help you rock!"
	done