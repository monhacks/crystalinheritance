TranquilTarn_MapScriptHeader: 
	def_scene_scripts


	def_callbacks
	callback MAPCALLBACK_TILES, TranquilTarnCallback ; todo 


	def_warp_events



	def_coord_events
	coord_event 0, 0, 1, TranquilTarnDestructionScene ; todo 


	def_bg_events



	def_object_events
; trainers are excited about the dragons, need to finish 
	object_event  0,  0, SPRITE_BIRD_KEEPER, 	SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerBirdKeeperHank, EVENT_BEAT_KANNA
	object_event  0,  0, SPRITE_RUIN_MANIAC, 	SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerRuinManiacJones, EVENT_BEAT_KANNA
	object_event  0,  0, SPRITE_RUIN_MANIAC, 	SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerRuinManiacLeland, EVENT_BEAT_KANNA
	object_event  0,  0, SPRITE_BUG_MANIAC, 	SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerBugManiacRob, EVENT_BEAT_KANNA
 ;adrinna troops
	object_event 0, 0, SPRITE_BRIGADER, 	SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, TranquilTarnBrigaderScript, -1
	object_event 0, 0, SPRITE_BRIGADER, 	SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, TranquilTarnBrigaderScript, -1	
	pokemon_event  0, 0, GYARADOS, -1, -1, PAL_NPC_BLUE, GyaradosText, EVENT_BEAT_KANNA
	pokemon_event  0, 0, GYARADOS, -1, -1, PAL_NPC_BLUE, GyaradosText, EVENT_BEAT_KANNA
; other hisui npcs 	
	object_event 0, 0, SPRITE_AROMA_LADY, 	SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, TranquilTarnNPC1Text, EVENT_BEAT_KANNA
	object_event 0, 0, SPRITE_BLACKBELT, 	SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, TranquilTarnNPC2Text, EVENT_BEAT_KANNA

	fruittree_event 17, 26, FRUITTREE_TRANQIL_TARN_1, TOUGH_LEAVES, PAL_NPC_GREEN;OK
	fruittree_event 36,  5, FRUITTREE_TRANQIL_TARN_2, RADIANT_OPAL, PAL_NPC_RED;OK
	tmhmball_event 27, 17, TM_AVALANCE, EVENT_TM_AVALANCHE

	object_const_def


GenericTrainerRuinManiacLeland:
	generictrainer RUIN_MANIAC, ROB, EVENT_BEAT_RUIN_MANIAC_ROB, RuinManiacLelandSeenText, RuinManiacLelandBeatenText

RuinManiacLelandBeatenText:
	text "My #mon couldn't"
	line "even beat you?"
	done
	
RuinManiacLelandSeenText:
	text "I've explored all"
	line "Hisui's caves - "
	
	para "I know a thing or"
	line "two!"
	done

GenericTrainerBugManiacRob:
	generictrainer BUG_MANIAC, ROB, EVENT_BEAT_BUG_MANIAC_ROB, BugManiacRobSeenText, BugManiacRobBeatenText

BugManiacRobBeatenText:
	text "Hm, not quite"
	line "strong enough."
	done
	
BugManiacRobSeenText:
	text "Hisui's bugs are"
	line "strong, right?"
	done

TranquilTarnCallback:
	checkevent EVENT_BEAT_KANNA
	iffalse .Done
	changeblock 0, 0, $00 
.Done:
	endcallback

TranquilTarnBrigaderScript:
	faceplayer
	checkevent EVENT_BEAT_KANNA
	iftrue_jumptext TarnBrigaderText2
	jumpthistext
	
	text "Hey kid, want a"
	line "Gyarados? They're"
	cont "full of Dragon"
	cont "energy."
	
	para "Far stronger than"
	line "your #mon."
	
	para "Go find General"
	line "Adrinna if so."
	done
	
TarnBrigaderText2:
	text "General Adrinna's"
	line "plan worked!"
	
	para "Some of the His-"
	line "uians joined our"
	cont "brigade!"
	
	para "And now, a great"
	like "Lake to raise up"
	cont "Gyarados."
	done

TranquilTarnNPC1Text:
	text "What happened to"
	line "Johto? Last time"
	para "we visited from"
	line "Hisui, there were"
	cont "no soldiers."
	done

TranquilTarnNPC2Text:
	text "Those brigaders"
	line "have no control"
	cont "over their"
	cont "#mon!"
	
	para "Where is their"
	line "discipline?"
	done

GyaradosText:
	text: "Gayash!"
	done



TranquilTarnDestructionScene:
	; gyarados are given to the hisuians
	; hisuians can't control them
	; the tarn is destroyed 
	setscene $0
	end
	