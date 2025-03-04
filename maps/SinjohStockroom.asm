SinjohStockroom_MapScriptHeader: 
	def_scene_scripts


	def_callbacks


	def_warp_events
	warp_event  3,  7, SINJOH_CROSSROADS, 2
	warp_event  4,  7, SINJOH_CROSSROADS, 2


	def_coord_events



	def_bg_events



	def_object_events
	object_event 5,  4, SPRITE_FIREBREATHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SinjohLeftoversScript, -1
	pokemon_event  6, 4, SNORLAX, -1, -1, PAL_NPC_RED, SnorlaxText, -1


SinjohLeftoversScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_LEFTOVERS
	iftrue .AlreadyGaveLeftovers
	writetext LeftiesIntroText
	promptbutton
	verbosegiveitem LEFTOVERS
	iffalse .BagFull
	setevent EVENT_GOT_LEFTOVERS
	writetext LeftiesAfterText
	waitbutton
	closetext
	end

.AlreadyGaveLeftovers:
	writetext LeftiesAfterText
	waitbutton
	closetext
	end

.BagFull:
	writetext LeftiesBagFullText
	waitbutton
	closetext
	end

LeftiesIntroText:
	text "I get hungry in"
	line "the middle of"
	cont "long battles."
	
	para "Instead of leav-"
	line "ing for a snack,"
	
	para "I make sure to"
	line "have Leftovers"
	cont "around."

	para "Here, I have some"
	line "to share."
	done

LeftiesAfterText:
	text "Those leftovers"
	line "will sustain you"
	cont "for long battles."
	done


LeftiesBagFullText:
	text "Oh no! Your Bag"
	line "is full."
	done

SnorlaxText:
	text "Snorlax lulls on"
	line "the ground,"
	
	para "content in a"
	line "food coma."
	done