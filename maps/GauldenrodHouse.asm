GauldenrodHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  3,  7, GAULDENROD, 4
	warp_event  4,  7, GAULDENROD, 4

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, LemonadeHouseLadyScript, -1

	object_const_def
	const LEMONADE_HOUSE_LADY



	faceplayer
	opentext	
	writetext NeedAMintLeafText
	waitbutton
	checkitem MINT_LEAF
	iffalse_jumpopenedtext Text_NoMintLeaf
	writetext Text_MintLeafQuestion ;;
	yesorno
	iffalse_jumpopenedtext Text_NoMintLeaf
	takeitem MINT_LEAF
	verbosegiveitem TINYMUSHROOM
	iffalse_endtext
	jumpopenedtext GiveTinyMushroomText 
	
LemonadeHouseLadyScript:
	faceplayer
	opentext
	writetext WantLemonadeText
	waitbutton
	checkitem TINYMUSHROOM
	iffalse_jumpopenedtext Text_NoMushroom
	writetext Text_MushroomQuestion
	yesorno
	iffalse_jumpopenedtext Text_NoMushroom
	takeitem TINYMUSHROOM
	iffalse_endtext
	jumpopenedtext GivingLemonadeText 
	

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
	done

Text_MushroomQuestion:
	text "Do you have a"
	line "mushroom that"
	cont "would be small"
	cont "enough?"

	para "I would give you"
	line "some fresh"
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

Text_NoMushroom:
	text "Really? That's"
	line "too bad."
	done
