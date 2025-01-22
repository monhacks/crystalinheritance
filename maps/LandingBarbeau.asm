LandingBarbeau_MapScriptHeader: ;	def_scene_scripts


	def_callbacks


	def_warp_events
	warp_event 3, 8, TRADERS_LANDING, 1


	def_coord_events



	def_bg_events
	bg_event 0, 0, BGEVENT_JUMPTEXT, BarbeauJournal


	def_object_events
	object_event 0, 0, SPRITE_BARBEAU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BarbeauBarbeauScript, EVENT_BARBEAU_BARBEAU ; disappears after you talk to him, then reappears after you beat Kensey 
	object_event 0, 0, SPRITE_KURT, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_BARBEAU_KURT
;pokemon event 

	object_const_def
	const TRADERS_BARBEAU_BARBEAU
	const TRADERS_BARBEAU_KURT 
	
BarbeauJournal:
	text "Barbeau's Journal"
	
	para "The people grow"
	line "restless... Is"
	cont "Amos' plan really"
	para "enough to repel"
	line "the barbarians"
	cont "and the Emperor?"
	done
	
BarbeauBarbeauScript:
	faceplayer
	checkevent EVENT_BEAT_KENSEY_PORT
	iftrue .AfterKensey
	showtext BarbeauText1 ; what are you doing here 
	appear TRADERS_BARBEAU_KURT
	applymovement TRADERS_BARBEAU_KURT, BarbeauKurtMoves1
	showtext BarbeauText2 ; we are here to stop steels
	showemote EMOTE_SHOCK, TRADERS_BARBEAU_BARBEAU, 5
	showtext BarbeauText3 ; kurt has a plan
	turnobject TRADERS_BARBEAU_BARBEAU, RIGHT
	showtext BarbeauText4 ; barbeau will do it 
	end
	
	; hm, what are you doing here
	; kurt barges in
	; kurt: We are here to stop the steel imports
	; barbeau: not possible
	; kurt: celebi is guiding us
	; barbeau: oh? 
	; kurt: we have a silver wing... we can summon Lugia, if you can send us back to our time with a blessing
	; barbeau: I don't understand ... if Kensey finds out I was connected, then bad things will happen 
	; kurt: we can do it
	; barbeau: I will help you
	


.AfterKensey:
	checkpoke LUGIA
	iftrue_jumptextfaceplayer BarbeauLugiaText
	jumpthisopenedtext
	
	text "What will we do?"
	line "Lugia, guardian"
	cont "of the seas, is"
	para "no longer with"
	line "us. We must find"
	cont "ways to adapt"
	cont "without her."
	done

BarbeauLugiaText:
	text "What will we do?"
	line "Lugia, guardian"
	cont "of the seas, is"
	para "no longer with"
	line "us."
	
	para "Oh? She is with"
	line "you? But I saw!"
	cont "With my own eyes!"
	para "Lugia must have"
	line "chosen you for"
	cont "a reason."
	
	para "We will find a"
	line "way to adapt"
	cont "without her"
	cont "presence."
	done
		