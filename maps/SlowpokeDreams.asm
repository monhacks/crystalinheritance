SlowpokeDreams_MapScriptHeader: ;	def_scene_scripts


	def_callbacks


	def_warp_events



	def_coord_events



	def_bg_events



	def_object_events
	object_event  5, 4, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, SLOWKING, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SlowkingDreamsScript, EVENT_SLOWKING_DREAMS
	itemball_event 5, 10, POKE_BALL, 1, EVENT_DREAMS_POKEBALL

	object_const_def



SlowkingDreamsScript:
	opentext
	writetext SlowkingWiseText
	cry SLOWKING
	pause 15
	closetext
	loadvar VAR_BATTLETYPE, BATTLETYPE_TRAP
	loadwildmon SLOWKING, 40
	startbattle
	ifequal $1, .Continue
.Continue:
	showtext SlowkingAfterText
	special HealParty
	setevent EVENT_SLOWKING_DREAMS
	warp OLIVINE_LIGHTHOUSE_6F, 9, 10 
	end
	
SlowkingWiseText:
	text "You peer inside"
	line "my mind hole?"
	
	para "My sacrifice: ten"
	line "thousand LD50 of"
	cont "Tentacruel poison"
	cont "course my veins."

	para "I see every poss-"
	line "ible outcome,"
	para "every butterfly"
	line "wing flap is like"
	para "a concussion on"
	line "my cerebellum."
	
	para "Though I am in "
	line "such pain, I can"
	cont "not walk away."
	
	para "My analytical an-"
	line "xiety saves you"
	cont "from yourselves,"
	cont "for now."
	
	para "Two hurricanes,"
	line "smothered in the"
	cont "tropics before"
	cont "making landfall."
	
	para "But eventually, "
	line "I will pass on."
	
	para "And how will you"
	line "navigate this"
	cont "world without me?"
	done


SlowkingAfterText:
	text "Ha! Though I saw"
	line "so many worlds, I"
	cont "failed to account"
	cont "for this."
	
	para "It is time for me"
	line "to step back."
	
	para "My false sense of"
	line "security may have"
	cont "been a curse, not"
	cont "a blessing."
	
	para "A changing world"
	line "is not doomed - "
	para "it is an invita-"
	line "tion to build."
	
	para "Go forth. The"
	line "future is yours"
	cont "to shape."
	done
