GoldenrodBikeShop_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, GOLDENROD_CITY, 2
	warp_event  3,  7, GOLDENROD_CITY, 2

	def_coord_events

	def_bg_events
	bg_event  1,  2, BGEVENT_JUMPTEXT, GoldenrodBikeShopBicycleText
	bg_event  0,  3, BGEVENT_JUMPTEXT, GoldenrodBikeShopBicycleText
	bg_event  1,  3, BGEVENT_JUMPTEXT, GoldenrodBikeShopBicycleText
	bg_event  0,  5, BGEVENT_JUMPTEXT, GoldenrodBikeShopBicycleText
	bg_event  1,  5, BGEVENT_JUMPTEXT, GoldenrodBikeShopBicycleText
	bg_event  0,  6, BGEVENT_JUMPTEXT, GoldenrodBikeShopBicycleText
	bg_event  1,  6, BGEVENT_JUMPTEXT, GoldenrodBikeShopBicycleText
	bg_event  6,  6, BGEVENT_JUMPTEXT, GoldenrodBikeShopBicycleText
	bg_event  7,  6, BGEVENT_JUMPTEXT, GoldenrodBikeShopBicycleText
	bg_event  3,  0, BGEVENT_JUMPTEXT, GoldenrodBikeShopJustReleasedCompactBikeText

	def_object_events
	object_event  7,  2, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodBikeShopClerkScript, -1

GoldenrodBikeShopClerkScript:
	checkevent EVENT_GOT_BICYCLE
	iftrue_jumptextfaceplayer GoldenrodBikeShopClerkFirstRateBikesText
	faceplayer
	opentext
	writetext GoldenrodBikeShopClerkIntroText
	yesorno
	iffalse_jumpopenedtext GoldenrodBikeShopClerkRefusedText
	writetext GoldenrodBikeShopClerkAgreedText
	promptbutton
	waitsfx
	verbosegivekeyitem BICYCLE
	setevent EVENT_GOT_BICYCLE
	jumpthisopenedtext

GoldenrodBikeShopClerkFirstRateBikesText:
	text "My Bicycles are"
	line "first-rate! You"

	para "can ride them"
	line "anywhere."
	done

GoldenrodBikeShopClerkIntroText:
	text "See that bike in"
	line "the corner? It's"
	para "from my very"
	line "first shipment."

	para "But now... Well,"
	line "I need to keep"
	para "up with the"
	line "times, you know?"
	
	para "That old bike..."
	line "I can't just"
	cont "toss it."

	para "Say, would you"
	line "take it? Give it"
	cont "a new adventure?"
	done

GoldenrodBikeShopClerkAgreedText:
	text "Really? Great!"

	para "I hope you have"
	line "some great ad-"
	cont "ventures on it."
	done

GoldenrodBikeShopClerkRefusedText:
	text "…sigh… Oh, for"
	line "the kindness of"
	cont "people…"
	done

GoldenrodBikeShopBicycleText:
	text "It's a retro"
	line "Bicycle!"
	
	para "Need to remember"
	line "to ask Kurt how"
	cont "the brakes work."
	done

GoldenrodBikeShopJustReleasedCompactBikeText:
	text "Just released!"

	para "First-rate compact"
	line "Bicycles!"
	done
