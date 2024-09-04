GauldenroodHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  3,  7, GAULDENROD, 3
	warp_event  4,  7, GAULDENROD, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, LemonadeHouseLadyScript, -1

	object_const_def
	const LEMONADE_HOUSE_LADY

LemonadeHouseLadyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_LEMONADE_FROM_LADY
	iftrue_jumpopenedtext AlreadyGaveLemonadeText
	writetext WantLemonadeText
	yesorno
	iffalse_jumpopenedtext RefusedLemonadeTradeText
	checkitem TINYMUSHROOM
	iffalse_jumpopenedtext NoTinyMushroomText
	takeitem TINYMUSHROOM
	writetext GivingLemonadeText
	promptbutton
	verbosegiveitem LEMONADE
	iffalse_endtext
	setevent EVENT_GOT_LEMONADE_FROM_LADY
	jumpopenedtext GotLemonadeText

WantLemonadeText:
	text "I just wrote"
	line "letters to all my"
	cont "favorite battlers"
	cont "at the stadium,"
	cont "but I forgot to"
	cont "get postage."

	para "When I asked one"
	line "of the brigaders,"
	cont "he told me it"
	cont "needs a mushroom"
	cont "stamp."

	para "Do you have a"
	line "mushroom that"
	cont "would be small"
	cont "enough?"

	para "I would give you"
	line "some fresh-squeezed"
	cont "lemonade from my"
	cont "garden."
	done

GivingLemonadeText:
	text "Oh, wonderful!"
	line "Thank you so much!"

	para "Here, take this"
	line "lemonade. I made"
	cont "it from the fruit"
	cont "in my backyard!"
	done

GotLemonadeText:
	text "Enjoy the lemonade!"

	para "Thanks again for"
	line "the Tinymushroom."
	cont "Now I can stamp"
	cont "all my letters!"
	done

AlreadyGaveLemonadeText:
	text "Thanks again for"
	line "the TinyMushroom!"
	cont "Now I can stamp"
	cont "all my letters!"
	done

RefusedLemonadeTradeText:
	text "Really? That's"
	line "too bad."
	done

NoTinyMushroomText:
	text "Oh, you don't have"
	line "a Tiny Mushroom?"

	para "That's okay. If you"
	line "find one, feel free"
	cont "to come back!"
	done
