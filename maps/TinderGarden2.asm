ShimmerSaddle_MapScriptHeader:
	def_scene_scripts
	scene_script TinderGarden2Script ; warp in at 4, 2

	def_callbacks


	def_warp_events
	

	def_coord_events


	def_bg_events


	def_object_events
	object_event  4,  3, SPRITE_SCHOOLGIRL, SPRITEMOVEDATA_STANDING_UP, 	0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  3,  1, SPRITE_PRYCE, 		PRITEMOVEDATA_STANDING_DOWN, 	0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  5,  3, SPRITE_SCHOOLBOY, 	SPRITEMOVEDATA_STANDING_UP, 	0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  6,  1, SPRITE_WHITNEY, 	SPRITEMOVEDATA_STANDING_DOWN, 	0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	pokemon_event   7, 2, PINECO, 		-1, -1, PAL_NPC_BLUE, 	TG2Text, -1 ; POISON VS GRASS VS ROCK/GND
	pokemon_event   8, 2, TANGELA, 		-1, -1, PAL_NPC_GREEN, 	TG2Text, -1
	pokemon_event   9, 2, GEODUDE, 		-1, -1, PAL_NPC_BROWN, 	TG2Text, -1	
	

	object_const_def
	const TINDER_GARDEN_2_SCHOOLGIRL
	const TINDER_GARDEN_2_PRYCE	
	
TG2Text:
	text "..."
	end



TinderGarden2Script:
	opentext
	showtext TG2_Text1
	waitbutton
	closetext
	pause 30
	opentext
	writetext TG2_Text2
	waitbutton
	closetext
	showemote EMOTE_HEART, TINDER_GARDEN_2_SCHOOLGIRL, 15
	opentext
	writetext TG2_Text3
	waitbutton
	closetext
	halloffame
	end


TG2_Text1:
	text "Twenty years"
	line "later:"
	done
	
TG2_Text2:
	text "<PLAYER>: We are"	
	line "here to honor"
	cont "nature's cycles."
	
	para "We are not above"
	line "or below it, but"
	cont "a part of it."
	
	para "Just as a forest"
	line "needs growth and"
	cont "decay,"
	
	para "We need tradition"
	line "and innovation."
	
	para "We are all part"
	line "of an endless"
	cont "cycle."
	done

TG2_Text3:
	text "Um, <PLAYER>, can"
	line "you please tell"
	cont "us one more time"
	
	para "about the hero on"
	line "the Burned Tower?"
	done
