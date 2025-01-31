TimelessTapestry_MapScriptHeader: 
	def_scene_scripts


	def_callbacks


	def_warp_events
	warp_event 3, 5, WHISPERS_TAPESTRY_GATE, 2


	def_coord_events
	coord_event 9, 26, 0, TapestrySceneFinale


	def_bg_events



	def_object_events
	object_event 8, 26, SPRITE_SAMSARA, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TAPESTRY_SAMSARA ; 
	object_event 7, 26, SPRITE_KURT, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	; plyaer at 9, 29 
; ADD THE CHARACTERS FROM THE CABIN 
	object_event 10, 14, SPRITE_SCHOOLGIRL, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, TapestryVera, -1 ; VERA 
	object_event 15, 15, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_COMMAND, jumptextfaceplayer, TapestryPiper, -1 ; PIPER, former beauty 
	object_event 12, 22, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, TapestrySamaria, -1 ; SAMARIA
	object_event 13, 22, SPRITE_VETERAN_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, TapestryShiji, -1
	object_event 16, 15, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_COMMAND, jumptextfaceplayer, TapestryMorphea, -1
	
; SCHOOLGIRL BLUE 
; ACE TRAINER GREEN 
; BEAUTY BROWN 
; VETERAN RED
; GRANNY PURPLE 

	object_const_def
	const TAPESTRY_SAMSARA
	const TAPESTRY_KURT

TapestrySceneFinale: ; if you helped all the kimono girls then piper gets to come with too 
	;cf western capital scene 
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	special Special_FadeInQuickly
	special HealParty
	applyemote EMOTE_QUESTION, TAPESTRY_KURT, 10
	showtext TapestryTextKurt
	pause 10
	showemote EMOTE_HEART, TAPESTRY_SAMSARA, 10
	showtext TapestryTextSamsara		
	closetext
	turnobject TAPESTRY_SAMSARA, UP
	applyonemovement TAPESTRY_SAMSARA, step_up
	disappear TAPESTRY_SAMSARA
	halloffame
	end

TapestryTextKurt:
	text "Kurt: Samsara, "
	line "what will you "
	cont "inscribe here?"
	done
	
TapestryTextSamsara:
	text "Your stories. You"
	line "showed no one"
	cont "owns tomorrow,"
	
	para "that every gener-"
	line "ation is just a"
	cont "caretake for the"
	cont "next one."
	done


TapestryVera:
	text "Vera: Finally, I"
	line "can play outside!"
	done

TapestryPiper:
	text "Piper: These Kim-"
	line "onos... Their em-"
	cont "broidery tells a"
	cont "story."

	para "I'm ready for the"
	line "responsibility."
	done
	
TapestryMorphea:
	text "Morphea: Doesn't"
	line "my great grand-"
	cont "daughter wear"
	cont "the Kimono so"
	cont "elegantly?"
	done

TapestrySamaria:
	text "Samaria: Will our"
	line "plans be enough"
	cont "to stop the emp-"
	cont "eror?"
	
	para "Maybe we should"
	line "have stayed away."
	done
	
TapestryShiji:
	text "Shiji: We heard"
	line "that it was time"
	cont "to return to the"
	cont "Capital."
	
	para "These caverns are"
	line "still under cons-"
	cont "truction."
	done