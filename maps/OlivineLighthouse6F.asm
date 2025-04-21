OlivineLighthouse6F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  8, 14, OLIVINE_LIGHTHOUSE_5F, 2
	warp_event  9,  2, OLIVINE_LIGHTHOUSE_ROOF, 1

	def_coord_events ; TODO REVISE THIS X, Y 
	coord_event 13, 11, 0, Lighthouse6FScene0
	coord_event 13, 10, 0, Lighthouse6FScene
	coord_event  9, 10, 1, Lighthouse6FScene1
	coord_event  9, 10, 1, Lighthouse6FScene2 ; move you if you lose to chuck and don't advance the scene , TODO 
	coord_event  9, 10, 1, Lighthouse6FScene3 ; move you if you lose to chuck and don't advance the scene TODO

	
	def_bg_events

	def_object_events
	;kurt
	object_event 14, 10, SPRITE_KURT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LighthouseKurtScript, EVENT_BEAT_CHUCK
	;jasmine
	object_event 7, 10, SPRITE_JASMINE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_BEAT_CHUCK	
	;chuck
	object_event 8, 10, SPRITE_CHUCK, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_BEAT_CHUCK	
	; slowking 
	pokemon_event  9, 9, SLOWKING, -1, -1, PAL_NPC_RED, SlowkingLighthouseText, EVENT_SLOWKING_DREAMS
	pokemon_event  9, 8, TENTACRUEL, -1, -1, PAL_NPC_BLUE, TentacruelLighthouseText, EVENT_SLOWKING_DREAMS
	;scientist x2
	object_event 18,  9, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Lighthouse6FScientistScript, -1
	object_event 15,  7, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Lighthouse6FScientistScript, EVENT_SLOWKING_DREAMS
	
	itemball_event  2,  9, DUBIOUS_DISC, 1, EVENT_DUBIOUS_DISC

	object_const_def
	const LIGHTHOUSE_KURT1
	const LIGHTHOUSE_JASMINE
	const LIGHTHOUSE_CHUCK
	const LIGHTHOUSE_SLOWKING
	consT LIGHTHOUSE_TENTACRUEL

Lighthouse6FScene0:
	applyonemovement PLAYER, step_up
Lighthouse6FScene:
	applyonemovement PLAYER, step_left
	applyonemovement PLAYER, step_left
	applyonemovement PLAYER, step_left ; now at 10, 10 
	showemote EMOTE_SAD, LIGHTHOUSE_JASMINE, 10
	showtext LighthouseJasmineText1
	showemote EMOTE_BOLT, LIGHTHOUSE_CHUCK, 10
	showtext LighthouseChuckText1
	showemote EMOTE_BOLT, LIGHTHOUSE_KURT1, 10 
	showtext LighthouseKurtText1
	closetext
	applyonemovement PLAYER, step_left
	turnobject PLAYER, UP
	special HealParty
	; no escape, right? 
	warp SLOWPOKE_DREAMS, 5, 8
	end
;
Jasmine: How can you do this!
Chuck: It doesn’t matter! The struggle – that’s how the Slowking’s brain gets more powerful! It is our guardian from the sea! 
Kurt: <PLAYER>! You have to do something!
<Player walks over to the Slowking, teleported to Slowking Dreams>
;
Lighthouse6FScene3:
	applyonemovement PLAYER, step_up
Lighthouse6FScene2:
	applyonemovement PLAYER, step_left
	applyonemovement PLAYER, step_left
	applyonemovement PLAYER, step_left
	applyonemovement PLAYER, step_left  
Lighthouse6FScene1:
	turnobject PLAYER, LEFT
	turnobject LIGHTHOUSE_CHUCK, right
	showemote EMOTE_BOLT, LIGHTHOUSE_CHUCK, 10
	showtext LighthouseChuckText2

	showemote EMOTE_QUESTION, LIGHTHOUSE_JASMINE, 10
	showtext LighthouseJasmineText2
	showtext LighthouseChuckText2
	showemote EMOTE_BOLT, LIGHTHOUSE_CHUCK, 10
	showtext LighthouseChuckText3
; cf polished, TODO FIX 
	winlosstext ChuckLossText, 0
	loadtrainer CHUCK, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_CHUCK
	opentext
	writetext GetStormBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_STORMBADGE
.FightDone:
	checkevent EVENT_GOT_TM01_DYNAMICPUNCH
	iftrue_jumpopenedtext ChuckAfterText
	writetext ChuckExplainBadgeText
	promptbutton
	verbosegivetmhm TM_DYNAMICPUNCH
	setevent EVENT_GOT_TM01_DYNAMICPUNCH
	jumpopenedtext ChuckExplainTMText
	
;
LighthouseChuckText2
Chuck: Hey, what gives? 

LighthouseJasmineText2
Jasmine: You tell me!
Chuck: I had perfect understanding, perfect control!
Jasmine: You kept me blind to this! 

LighthouseChuckText3
Chuck: I would have mapped the future for you. Now, you say you’d rather do without? I’ve already lost one home to the whims of fate. I won’t lose another. You – battle me!
<Battle chuck>
Chuck: Bested by you? But… I thought I knew it all… 
Jasmine: You told me progress was always good, yet your design limited us. Even running our desal at a low level, it may take generations for the ecosystem to recover. 
Chuck: Let’s go to your gym. We can talk about next steps. 
<Chuck and Jasmine leave> 
;


SlowkingLighthouseText:
	text "OMLAS: ..."
	done
	
TentacruelLighthouseText:
	text "Tentacruel:"
	line "Acruu!"
	done
	

LighthouseKurtScript:
	faceplayer
	showtext LighthouseKurtText1
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	special HealParty
	playmusic MUSIC_HEAL
	pause 30
	special RestartMapMusic
	special Special_FadeInQuickly
	showtext LighthouseKurtText2
	end 

LighthouseKurtText1:
	text "Do you hear what"
	line "Chuck is doing in"
	cont "there?"
	
	para "That Slowking,"
	line "locked up in the"
	cont "pool - I can't"
	
	para "fathom how that"
	line "could ever be OK."

	para "Let me heal your"
	line "#mon before"
	cont "we face Chuck."
	done
	
Lighthouse6FScientistScript:
	checkevent EVENT_BEAT_CHUCK
	iftrue_jumptextfaceplayer Lighthouse6FScientistText2
	
	jumpthistext
	
	text "If the half life"
	line "of the toxin is X,"
	
	para "and the context"
	line "windows persist"
	cont "for Y, then we "
	para "need ... how many"
	line "Tentacruels for"
	cont "the forecast?"
	done
	
	
Lighthouse6FScientistText2:
	text "What will become"
	line "of this? I hope"
	cont "an infinity pool."
	done
	