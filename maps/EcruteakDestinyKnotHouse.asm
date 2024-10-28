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

EcruteakBlueMailScript: 
	checkevent EVENT_GOT_LITEBLUEMAIL ;;TO ADD
	iftrue_jumptextfaceplayer GiveLiteBlueMailText
	checkevent EVENT_GAVE_BIG_MUSHROOM
	iftrue_jumptextfaceplayer GiveLiteBlueMailText
	faceplayer
	opentext	
	writetext NeedABigMushroomText
	waitbutton
	checkitem BIG_MUSHROOM
	iffalse NoBigMushroom
	writetext Text_BigMushroomQuestion ;;
	yesorno
	iffalse BigMushroomRefused
	takeitem BIG_MUSHROOM
	jumpopenedtext TextReadingTheTeaLeaves
	verbosegiveitem LITEBLUEMAIL
	iffalse_endtext
	setevent EVENT_GOT_LITEBLUEMAIL 
	jumpopenedtext GiveLiteBlueMailText 


HerbalistWifeText:
	text "My husband's tea"
	line "is popular with"
	cont "young lovers."
	
	para "They want to see"
	line "if they will end"
	cont "up together."
	done


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
	text "Oh! That's a Tiny-"
	line "Mushroom! I can"
	cont "show you your"
	cont "future, if you"
	cont "just give it to me."
	done

BigMushroomRefused:
	text "No? Well, you won't"
	line "have any corres-"
	cont "pondence with the"
	cont "future then."
	done

TextReadingTheTeaLeaves:
	text "Some hot water,"
	line "some Toe Of"
	cont "Politoed, some"
	cont "Moss of Zubat,"
	cont "and it looks nice"
	cont "and blue..."

	para "Oh? It's blank."
	done

GiveLiteBlueMailText:
	text "The spirits have"
	line "spoken! Your"
	cont "future is"
	cont "undecided!"

	para "Who will you"
	line "correspond with?"
	done
