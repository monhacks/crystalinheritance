RebelsRedoubtB2F_MapScriptHeader: 
	def_scene_scripts


	def_callbacks
	callback MAPCALLBACK_TILES, RedoubtB2FDoorsCallback

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
	bg_event 12,  7, BGEVENT_JUMPTEXT, RedoubtB2FStatue1Text
	bg_event 14,  5, BGEVENT_JUMPTEXT, RedoubtB2FStatue1Text


	def_object_events
	object_event  3, 11, SPRITE_KURT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RedoubtKurtScript, EVENT_BEAT_AMOS;
	object_event 21,  6, SPRITE_AMOS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RedoubtAmosScript, EVENT_BEAT_AMOS;
;done
	object_event 25,  3, SPRITE_NINJA, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerNinja10, EVENT_BEAT_AMOS;wraith
	object_event  4,  1, SPRITE_NINJA, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerNinja11, EVENT_BEAT_AMOS;vapor
	object_event 22, 14, SPRITE_NINJA, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerNinja12, EVENT_BEAT_AMOS;mirage

	object_const_def



RedoubtB2FDoorsCallback:
	checkevent EVENT_BEAT_HOLLIS_REDOUBT
	iffalse .Sandra
	changeblock 12, 8, $09
.Sandra:
	checkevent EVENT_BEAT_SANDRA_REDOUBT
	iffalse .Barbeau
	changeblock 14, 6, $09
.Barbeau:
	checkevent EVENT_BEAT_BARBEAU_REDOUBT
	iffalse .Done
	changeblock 16, 4, $09
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

RedoubtKurtScript:
	faceplayer
	opentext
	writetext KurtHealRedoubtText
	waitbutton
	playmusic MUSIC_HEAL
	special HealParty
	special SaveMusic	
	writetext KurtHealRedoubtText2
	waitbutton
	closetext
	playmusic MUSIC_NONE	
	special RestoreMusic
	end

KurtHealRedoubtText:
	text "<PLAYER>, there"
	line "is one source"
	cont "of Steel left"
	para "for the emperor:"
	line "in the mine."
	
	para "If we join forces"
	line "with Amos, we can"
	cont "end it for good,"
	
	para "and save Johto's"
	line "heritage."
	
	para "Here, let me heal"
	line "your #mon."	
	done

KurtHealRedoubtText2:
	text "Keep exploring,"
	line "there's got to"
	para "be a way past"
	line "these statues."
	done

RedoubtAmosScript: ;todo 
	faceplayer
	opentext
	checkevent EVENT_BEAT_AMOS
	iftrue .FightDone
	writetext AmosText_Intro ; todo
	waitbutton
	closetext
	winlosstext AmosText_Impressed, 0; todo
	loadtrainer AMOS, 2
	startbattle
	reloadmapafterbattle
	opentext
	writetext Text_ReceivedVisionBadge; todo
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_SOULBADGE ; TODO TO CHECK 
	setevent EVENT_BEAT_AMOS
.FightDone:
	setevent EVENT_BEAT_NINJA7
	setevent EVENT_BEAT_NINJA8
	setevent EVENT_BEAT_NINJA9	
	setevent EVENT_BEAT_NINJA10
	setevent EVENT_BEAT_NINJA12
	setevent EVENT_BEAT_NINJA12
	writetext AmosText_LegacyBadgeSpeech; todo
	promptbutton
	writetext AmosText_MeetYouAtTheMine; todo
	closetext
	end
