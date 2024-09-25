GoldenrodFlowerShop_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, GOLDENROD_CITY, 6
	warp_event  3,  7, GOLDENROD_CITY, 6

	def_coord_events

	def_bg_events
	bg_event  1,  0, BGEVENT_READ, FlowerShopSeedsSign
	bg_event  2,  1, BGEVENT_READ, FlowerShopBerryBasin
	bg_event  3,  1, BGEVENT_READ, FlowerShopBerryBasin
	bg_event  6,  1, BGEVENT_READ, FlowerShopLogBook
	bg_event  7,  1, BGEVENT_READ, FlowerShopLogBook

	def_object_events
	object_event  2,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, FlowerShopNPC1Script, -1
	object_event  5,  6, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, FlowerShopNPC2Script, -1
	object_event  6,  3, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FlowerShopGloriaScript, -1

	object_const_def
	const GOLDENRODFLOWERSHOP_NPC1

FlowerShopNPC1Script:
	faceplayer
	opentext
	checkevent EVENT_GOT_BERRY_GLORIA
	iftrue .GotBerry
	writetext NPC1GiveBerryText
	promptbutton
	verbosegiveitem RAWST_BERRY
	iffalse .NoRoom
	setevent EVENT_GOT_BERRY_GLORIA
	jumpthisopenedtext NPC1AfterText
.GotBerry
	jumpthisopenedtext NPC1AfterText
.NoRoom
	jumpthisopenedtext NPC1NoRoomText

FlowerShopNPC2Script:
	jumptextfaceplayer FlowerShopNPC2Text

FlowerShopGloriaScript:
	jumptextfaceplayer FlowerShopGloriaText

FlowerShopSeedsSign:
	jumptext FlowerShopSeedsSignText

FlowerShopBerryBasin:
	jumptext FlowerShopBerryBasinText

FlowerShopLogBook:
	jumptext FlowerShopLogBookText

NPC1GiveBerryText:
	text "Sniff, sniff. You"
	line "smell like a"
	cont "forest!"
	para "Are you from out"
	line "of town? You will"
	cont "know how to use"
	cont "this!"
	done

NPC1AfterText:
	text "Rawst Berries are"
	line "great for burns!"
	done

NPC1NoRoomText:
	text "Oh, your Bag is"
	line "full. Come back"
	cont "when you have"
	cont "some space!"
	done

FlowerShopNPC2Text:
	text "We aren't too"
	line "affected by the"
	cont "drought."
	para "We grow every-"
	line "thing in Silph"
	cont "hydro basins"
	cont "here."
	done

FlowerShopGloriaText:
	text "Gloria: Berry"
	line "demand has gone"
	cont "through the roof"
	cont "lately!"
	para "I've had to cut"
	line "back on growing"
	cont "flowers to keep"
	cont "up."
	para "It's good for"
	line "business, but I"
	cont "miss my beautiful"
	cont "blooms…"
	done

FlowerShopSeedsSignText:
	text "Seeds property"
	line "of Silph Co."
	para "Leased to"
	line "GLORIA'S SMILE"
	cont "PLUMES."
	done

FlowerShopBerryBasinText:
	text "The berries are"
	line "growing in a"
	cont "basin of water."
	para "The leaves are"
	line "so green!"
	done

FlowerShopLogBookText:
	text "It's the log book"
	line "for the basins."
	para "Silph Co Hydro-"
	line "ponic Berry"
	cont "Basins."
	para "Grow with less"
	line "water! Rent-to-"
	cont "own. Three year"
	cont "lease."
	para "Financing avail-"
	line "able through"
	cont "Silph Trust, Inc."
	done