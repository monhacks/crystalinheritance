ClastsCradle3F_MapScriptHeader: 
	def_scene_scripts


	def_callbacks


	def_warp_events
	warp_event 5, 7, SULFUR_STY, 3
	warp_event 5, 5, CLASTS_CRADLE_2F, 1


	def_coord_events



	def_bg_events



	def_object_events
	; AMOS heals you 
	object_event 3, 3, SPRITE_AMOS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_COMMAND, 0, AmosScript, EVENT_BEAT_ADRINNA_MINE
	pokemon_event  4, 3, GALLADE, -1, -1, PAL_NPC_BLUE, GalladeText, -1

	object_const_def

GalladeText:
	text "Galloo!"
	done

AmosScript:
	faceplayer
	checkevent EVENT_AMOS_INTRO_MINE
	iftrue .AmosHeals
	showtext AmosCradleText1
	setevent EVENT_AMOS_INTRO_MINE
.AmosHeals:
	showtext AmosHealsText
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	special HealParty
	playmusic MUSIC_HEAL
	pause 60
	special RestartMapMusic
	special Special_FadeInQuickly
	showtext AmosCradleText2
	end 


AmosCradleText1:
	text "<PLAYER>, the"
	line "ninjas from the"
	cont "hideout will hold"
	para "Adrinna's troops"
	line "back. Kurt is in"
	cont "the mine already."
	
	para "We need to get to"
	line "Adrinna before he"
	para "can reach Mount"
	line "Mortar's heart,"
	
	para "or he may be able"
	line "to capture an in-"
	cont "credibly strong"
	cont "#mon."
	done
	
AmosHealsText:
	text "I'm sorry that I"
	line "doubted you,"
	cont "earlier."
	
	para "Let me heal your"
	line "#mon."
	done
	
	
AmosCradleText2:
	text "Adrinna is deep"
	line "within the mine-"
	
	para "We're counting on"
	line "you to disrupt"
	cont "his plans!"
	done
