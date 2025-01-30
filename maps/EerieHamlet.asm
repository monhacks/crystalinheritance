EerieHamlet_MapScriptHeader: 
	def_scene_scripts


	def_callbacks


	def_warp_events



	def_coord_events



	def_bg_events



	def_object_events
	object_event  6,  9, SPRITE_ENGINEER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, EerieHamletHoneyScript, -1


	object_const_def




EerieHamletHoneyScript:
	faceplayer
	opentext	
	writetext NeedAFossilText
	waitbutton
	checkitem OLD_AMBER
	iffalse_jumpopenedtext Text_NoFossil
	writetext Text_FossilQuestion ;;
	yesorno
	iffalse_jumpopenedtext Text_NoFossil
	takeitem OLD_AMBER
	verbosegiveitem SWEET_HONEY
	iffalse_endtext
	jumpopenedtext GiveSweetHoneyText 

NeedAFossilText: 
	text "Cripes, Adrinna"
	line "will be so mad"
	cont "at me. I should"
	cont "be digging at the"
	
	para "mine, but I just"
	line "need one more pot"
	cont "of honey tea."
	
	para "If I had a little"
	line "artifact from the"
	cont "ground, that'd"
	cont "show that I was"
	cont "working hard,"
	
	para "and get Adrinna"
	line "off my back."
	done

Text_FossilQuestion:
	text "Hey, that fossil,"
	line "did you dig it?"
	
	para "I would give you"
	line "some Sweet Honey"
	cont "for it."
	done

	
GiveSweetHoneyText: 
	text "Thanks, this"
	line "fossil will prove"
	cont "I was working."

	para "This honey is so"
	line "sweet, it'll give"
	cont "you the energy"
	
	para "you need to fin-"
	line "ish your work!"
	done

Text_NoFossil:
	text "Uff, back to"
	line "work for me."
	done
