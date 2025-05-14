EcruteakDestinyKnotHouse_MapScriptHeader: ; herbalist, part of trade quest 
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  3,  7, ECRUTEAK_CITY, 17
	warp_event  4,  7, ECRUTEAK_CITY, 17

	def_coord_events

	def_bg_events
	bg_event  2,  1, BGEVENT_JUMPSTD, radio2

	def_object_events
	object_event  5,  4, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, HerbalistWifeText, -1
	object_event  2,  3, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakBlueMailScript, -1




HerbalistWifeText:
	text "My husband's tea"
	line "is popular with"
	cont "young lovers."
	
	para "They want to see"
	line "if they will end"
	cont "up together."
	done

EcruteakBlueMailScript: ; TRADE QUEST 
	faceplayer
	opentext	
	writetext NeedABigMushroomText
	waitbutton
	checkitem BIG_MUSHROOM
	iffalse_jumpopenedtext NoBigMushroom
	writetext Text_BigMushroomQuestion ;;
	yesorno
	iffalse_jumpopenedtext NoBigMushroom
	takeitem BIG_MUSHROOM
	verbosegiveitem LITEBLUEMAIL
	jumpopenedtext TextReadingTheTeaLeaves
	iffalse_endtext
	jumpopenedtext GiveLiteBlueMailText 


NeedABigMushroomText:
	text "Have you come to"
	line "have your fortune"
	cont "told? I can read"
	cont "the tea leaves, so"
	cont "to speak."

	para "The only thing I"
	line "need is a Big"
	cont "Mushroom."
	done

NoBigMushroom:
	text "Oh, you don't have"
	line "one? Please come"
	cont "back."
	done

Text_BigMushroomQuestion:
	text "Oh! That's a BIG"
	line "Mushroom! I can"
	cont "show you your"
	cont "future, if you"
	cont "let me brew it."
	done

TextReadingTheTeaLeaves:
	text "Some hot water,"
	line "some Toe Of"
	cont "Politoed, some"
	cont "Moss of Zubat,"
	cont "and it looks nice"
	cont "and blue..."
	
	para "Dunk the papers"
	line "in the broth..."

	para "Oh? It's blank."
	done

GiveLiteBlueMailText:
	text "The spirits have"
	line "spoken! Your"
	cont "future is"
	cont "undecided!"
	done
