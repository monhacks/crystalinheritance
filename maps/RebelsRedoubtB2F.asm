RebelsRedoubtB2F_MapScriptHeader: 
	def_scene_scripts


	def_callbacks
	callback MAPCALLBACK_TILES, RedoubtB2FDoorsCallback
;CALLBACKS FOR B3F ELDERS HOLLIS, SAMSARA, BARBEAU 

	def_warp_events
	warp_event 2, 14, REBELS_REDOUBT_B1F, 3 
	warp_event 3, 7, REBELS_REDOUBT_B3F, 1
	warp_event 21, 15, REBELS_REDOUBT_B3F, 2
	warp_event 27, 7, REBELS_REDOUBT_B3F, 3
;HOLES 
	warp_event 14, 1, REBELS_REDOUBT_B3F, 4
	warp_event 15, 1, REBELS_REDOUBT_B3F, 5


	def_coord_events



	def_bg_events
	bg_event 10,  9, BGEVENT_JUMPTEXT, RedoubtB2FStatue1Text
	bg_event 10,  7, BGEVENT_JUMPTEXT, RedoubtB2FStatue1Text
	bg_event 10,  5, BGEVENT_JUMPTEXT, RedoubtB2FStatue1Text


	def_object_events
	object_event  3, 11, SPRITE_KURT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 1, RedoubtKurtScript, EVENT_BEAT_AMOS;
	object_event 21,  6, SPRITE_AMOS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 1, RedoubtAmosScript, EVENT_BEAT_AMOS;
;done
	object_event 25,  3, SPRITE_NINJA, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerNinja10, EVENT_BEAT_AMOS;wraith
	object_event  9, 11, SPRITE_NINJA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerNinja11, EVENT_BEAT_AMOS;vapor
	object_event 22, 14, SPRITE_NINJA, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerNinja12, EVENT_BEAT_AMOS;mirage

	object_const_def



RedoubtB2FDoorsCallback:
	checkevent EVENT_BEAT_HOLLIS_REDOUBT
	iffalse .Sandra
	changeblock 0, 0, $00
.Sandra:
	checkevent EVENT_BEAT_SANDRA_REDOUBT
	iffalse .Barbeau
	changeblock 0, 0, $00
.Barbeau:
	checkevent EVENT_BEAT_BARBEAU_REDOUBT
	iffalse .Done
	changeblock 0, 0, $00	
.Done:
	endcallback



GenericTrainerNinja10: ; wraith
	generictrainer NINJA, NINJA10, EVENT_BEAT_NINJA10, .SeenText10, .BeatenText10

.BeatenText10:
	text "So you do have"
	line "something to"
	cont "share."
	done

.SeenText10:
	text "It is uncouth of"
	line "you to enter."
	
	para "Do you belong?"
	done

GenericTrainerNinja11: ; vapor 
	generictrainer NINJA, NINJA11, EVENT_BEAT_NINJA11, .SeenText11, .BeatenText11

.BeatenText11:
	text "Amos will be"
	line "impressed."
	done

.SeenText11:
	text "Our preparations"
	line "are finished, and"
	cont "you think now is"
	cont "the time?"
	done
	
GenericTrainerNinja12: ; mirage 
	generictrainer NINJA, NINJA12, EVENT_BEAT_NINJA12, .SeenText12, .BeatenText12

.BeatenText12:
	text "Your ill aura was"
	line "an illusion."
	done

.SeenText12:
	text "You are the ideal"
	line "foil for Amos!"
	done

RedoubtB2FStatue1Text:
	text "Its eyes seem to"
	line "stare back."
	done
