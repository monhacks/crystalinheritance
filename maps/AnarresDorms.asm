AnarresDorms_MapScriptHeader: 
	def_scene_scripts


	def_callbacks


	def_warp_events
	warp_event  4,  5, ANARRES_TOWN, 6
	warp_event  5,  5, ANARRES_TOWN, 6

	def_coord_events


	def_bg_events
	bg_event  0,  2, BGEVENT_READ, AnarresDormsBed 
	bg_event  0,  3, BGEVENT_READ, AnarresDormsBed 
	bg_event  0,  4, BGEVENT_READ, AnarresDormsBed 
	bg_event  0,  5, BGEVENT_READ, AnarresDormsBed 

	def_object_events
	object_event 2, 1, SPRITE_KURT, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AnarresDormsKurtScript, -1 ;
;	object_event 5, 2, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, AnarresDormsNPC1Text, -1 ;
	object_event 5, 3, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, AnarresDormsNPC2Text, -1 ;
	object_event 3, 3, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, AnarresDormsNPC3Text, -1 ;
	
	object_const_def
	

;AnarresDormsNPC1Text:
;	text "I heard that"
;	line "someone made a"
;	cont "way to tutor new"
;	cont "techniques."
;	
;	para "I remember the"
;	line "old days, when"
;	cont "bug types had no"
;	cont "STAB coverage."
;	done
	
AnarresDormsNPC2Text:
	text "The Pineco are"
	line "not to blame."
	
	para "It's natural for"
	line "them to glom on"
	cont "to as many as"
	cont "they can."
	
	para "They don't know"
	line "that if they"
	cont "eat the whole"
	cont "forest, then"
	cont "they'll end up"
	cont "with nothing to"
	cont "eat."
	done
	
AnarresDormsNPC3Text:
	text "We use Apricorns"
	line "to catch our"
	cont "#mon."

	para "They keep a"
	line "#mon as long"
	cont "as you continue"
	cont "to interact."
	done

AnarresDormsBed:
	showtext BedText1
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	special HealParty
	playmusic MUSIC_HEAL
	pause 60
	special RestartMapMusic
	special Special_FadeInQuickly
	showtext BedText2
	end

BedText1:
	text "A comfy bed!"
	line "Time to sleep…"
	done

BedText2:
	text "Ah, refreshed and"
	line "restored!"
	done

AnarresDormsKurtScript: ; will this work?....
	faceplayer
	opentext
	writetext KurtAnarresDormsText
	yesorno
	iffalse .AnarresKurtPC
	winlosstext AnarresKurtBattleText, AnarresKurtBattleText
	loadtrainer KURT, 1 
	loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	reloadmapafterbattle
	opentext
	jumpopenedtext AnarresKurtBattleText2




	
.AnarresKurtPC
	writetext KurAnarresDormsText2
	promptbutton
	special PokemonCenterPC ; per engine/events/std_scripts.asm this is how it should be done. 
	endtext
	end

KurtAnarresDormsText:
	text "<PLAYER>, these"
	line "dorms are a good"
	cont "place to rest."
	
	para "I can run back to"
	line "our time for a PC"
	cont "if you need."
	
	para "Oh! I found some"
	line "neat #mon in"
	cont "the wild areas"
	cont "around here."

	para "Want to battle?"
	done
	
KurAnarresDormsText2:
	text "I can run back"
	line "to manage your"
	cont "party."
	done

AnarresKurtBattleText:
	text "You're becoming"
	line "quite a trainer!"
	done

AnarresKurtBattleText2:
	text "We can battle as"
	line "many times as"
	cont "you like."
	done
