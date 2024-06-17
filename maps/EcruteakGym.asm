EcruteakGym_MapScriptHeader:
	def_scene_scripts


	def_callbacks

	def_warp_events
	warp_event  4, 17, ECRUTEAK_CITY, 10
	warp_event  5, 17, ECRUTEAK_CITY, 10
	warp_event  4, 14, ECRUTEAK_GYM, 4
	warp_event  2,  4, ECRUTEAK_GYM, 3
	warp_event  3,  4, ECRUTEAK_GYM, 3
	warp_event  4,  4, ECRUTEAK_GYM, 3
	warp_event  4,  5, ECRUTEAK_GYM, 3
	warp_event  6,  7, ECRUTEAK_GYM, 3
	warp_event  7,  4, ECRUTEAK_GYM, 3
	warp_event  2,  6, ECRUTEAK_GYM, 3
	warp_event  3,  6, ECRUTEAK_GYM, 3
	warp_event  4,  6, ECRUTEAK_GYM, 3
	warp_event  5,  6, ECRUTEAK_GYM, 3
	warp_event  7,  6, ECRUTEAK_GYM, 3
	warp_event  7,  7, ECRUTEAK_GYM, 3
	warp_event  4,  8, ECRUTEAK_GYM, 3
	warp_event  5,  8, ECRUTEAK_GYM, 3
	warp_event  6,  8, ECRUTEAK_GYM, 3
	warp_event  7,  8, ECRUTEAK_GYM, 3
	warp_event  2,  8, ECRUTEAK_GYM, 3
	warp_event  2,  9, ECRUTEAK_GYM, 3
	warp_event  2, 10, ECRUTEAK_GYM, 3
	warp_event  2, 11, ECRUTEAK_GYM, 3
	warp_event  4, 10, ECRUTEAK_GYM, 3
	warp_event  5, 10, ECRUTEAK_GYM, 3
	warp_event  2, 12, ECRUTEAK_GYM, 3
	warp_event  3, 12, ECRUTEAK_GYM, 3
	warp_event  4, 12, ECRUTEAK_GYM, 3
	warp_event  5, 12, ECRUTEAK_GYM, 3
	warp_event  7, 10, ECRUTEAK_GYM, 3
	warp_event  7, 11, ECRUTEAK_GYM, 3
	warp_event  7, 12, ECRUTEAK_GYM, 3
	warp_event  7, 13, ECRUTEAK_GYM, 3

	def_coord_events

	def_bg_events
;	bg_event  3, 15, BGEVENT_READ, EcruteakGymStatue
;	bg_event  6, 15, BGEVENT_READ, EcruteakGymStatue

	def_object_events
;	object_event  5,  1, SPRITE_MORTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakGymMortyScript, -1

	object_const_def


;EcruteakGymMortyScript:
;	faceplayer
;	opentext
;	checkevent EVENT_BEAT_MORTY
;	iftrue .FightDone
;	writetext MortyIntroText
;	waitbutton
;	closetext
;	winlosstext MortyWinLossText, 0
;	loadtrainer MORTY, 1
;	startbattle
;	reloadmapafterbattle
;	setevent EVENT_BEAT_MORTY
;	opentext
;	writetext Text_ReceivedFogBadge
;	playsound SFX_GET_BADGE
;	waitsfx
;	setflag ENGINE_FOGBADGE
;.FightDone:
;	checkevent EVENT_GOT_TM30_SHADOW_BALL
;	iftrue_jumpopenedtext MortyFightDoneText
;	writetext MortyText_FogBadgeSpeech
;	promptbutton
;	verbosegivetmhm TM_SHADOW_BALL
;	setevent EVENT_GOT_TM30_SHADOW_BALL
;	jumpopenedtext MortyText_ShadowBallSpeech

