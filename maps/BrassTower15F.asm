BrassTower15F_MapScriptHeader: 
	def_scene_scripts


	def_callbacks


	def_warp_events
	warp_event 0, 14, BRASS_TOWER_16F, 1
	warp_event 12, 12, BRASS_TOWER_16F, 2
	warp_event 6, 1, BRASS_TOWER_13F, 3 ; good 



	def_coord_events



	def_bg_events
	bg_event 6, 4, BGEVENT_READ, BrassTowerSwitchScript  ;  cf warehouse entrance basement key .... 
;switch 


	def_object_events
	object_event  13, 2, SPRITE_ELDER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerElderAkira, -1 ; bright
	object_event   9, 12, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, VAPOREON, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BrassTower15FVaporeonScript, EVENT_BRASS_TOWER_VAPOREON
	object_event   6,  8, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, CHANSEY, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BrassTower15FChanseyScript, -1

	pokemon_event  13, 6, GENGAR, -1, -1, PAL_NPC_RED, BrassTowerGuardText, EVENT_BRASS_TOWER_RIGHT_GUARD
	pokemon_event  0,  6, MISDREAVUS, -1, -1, PAL_NPC_RED, BrassTowerGuardText, EVENT_BRASS_TOWER_LEFT_GUARD
	pokemon_event  6,  6, MISDREAVUS, -1, -1, PAL_NPC_RED, BrassTowerGuardText, EVENT_BRASS_TOWER_LEFT_GUARD

	itemball_event 5, 13, HYPER_POTION, 1, EVENT_BRASS_TOWER_HYPER_POTION

	object_const_def
	const BRASSTOWER_VAPOREON

GenericTrainerElderAkira:
    generictrainer ELDER, AKIRA, EVENT_BEAT_ELDER_AKIRA, AkiraSeenText, AkiraBeatenText


AkiraBeatenText:
	text "Oh, but I sense a"
	line "stormcloud in"
	cont "Urgaust's heart."
	done
	
AkiraSeenText:
    text "The Consul will"
	line "clear the sky, a"
	cont "bright new dawn!"
    done

BrassTower15FVaporeonScript:
	showtext VaporeonGuardianText
	cry VAPOREON
	pause 15
	loadvar VAR_BATTLETYPE, BATTLETYPE_TRAP
	loadwildmon VAPOREON, 50
	startbattle
	disappear BRASSTOWER_VAPOREON
	setevent EVENT_BRASS_TOWER_VAPOREON
	reloadmapafterbattle
	end
	
VaporeonGuardianText:
	text "It's a guardian"
	line "Vaporeon!"
	done

BrassTower15FChanseyScript:
	opentext
	writetext BrassTowerHealQuestion
	waitbutton
	closetext
	playmusic MUSIC_HEAL
	special HealParty
	special SaveMusic	
	playmusic MUSIC_NONE	
	special RestoreMusic
	end

BrassTowerHealQuestion:
	text "Chansey heals"
	line "your #mon."
	done
