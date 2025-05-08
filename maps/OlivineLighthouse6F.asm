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
	object_event 14, 10, SPRITE_KURT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LighthouseKurtScript, EVENT_BEAT_CHUCK
	object_event 7, 10, SPRITE_JASMINE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_BEAT_CHUCK	
	object_event 8, 10, SPRITE_CHUCK, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_BEAT_CHUCK	

	pokemon_event  9, 9, SLOWKING, -1, -1, PAL_NPC_RED, SlowkingLighthouseText, EVENT_SLOWKING_DREAMS
	pokemon_event  9, 8, TENTACRUEL, -1, -1, PAL_NPC_BLUE, TentacruelLighthouseText, EVENT_SLOWKING_DREAMS

	object_event 18,  9, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Lighthouse6FScientistScript, -1
	itemball_event  2,  9, DUBIOUS_DISC, 1, EVENT_DUBIOUS_DISC

	object_const_def
	const LIGHTHOUSE_KURT1
	const LIGHTHOUSE_JASMINE
	const LIGHTHOUSE_CHUCK
	const LIGHTHOUSE_SLOWKING
	const LIGHTHOUSE_TENTACRUEL

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
	warp SLOWPOKE_DREAMS, 5, 8
	end
;
LighthouseJasmineText1:
	text "Jasmine: How"
	line "can you do this!"
	done

LighthouseChuckText1:
	text "Chuck: It doesn't"
	line "matter - The"
	cont "struggle is how"
	
	para "The Slowking's"
	line "brain gets more"
	cont "powerful!"
	
	para "It's our guardian"
	line "from the sea!"
	done

LighthouseKurtText1:
	text "Kurt: <PLAYER>,"
	line "do something!"


Lighthouse6FScene3:
	applyonemovement PLAYER, step_up
Lighthouse6FScene2:
	applyonemovement PLAYER, step_left
	applyonemovement PLAYER, step_left
	applyonemovement PLAYER, step_left
	applyonemovement PLAYER, step_left  
Lighthouse6FScene1:
	turnobject PLAYER, LEFT
	turnobject LIGHTHOUSE_CHUCK, RIGHT
	showemote EMOTE_BOLT, LIGHTHOUSE_CHUCK, 10
	showtext LighthouseChuckText2
	showemote EMOTE_QUESTION, LIGHTHOUSE_JASMINE, 10
	showtext LighthouseJasmineText2
	showtext LighthouseChuckText2
	showemote EMOTE_BOLT, LIGHTHOUSE_CHUCK, 10
	showtext LighthouseChuckText3
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
	promptbutton
	turnobject LIGHTHOUSE_CHUCK, LEFT
	showtext LighthouseJasmineText3
	promptbutton
	writetext LighthouseChuckText4
	waitbutton
	closetext
	applymovement LIGHTHOUSE_CHUCK, LighthouseChuckLeavesMovement
	disappear LIGHTHOUSE_CHUCK
	applyonemovement LIGHTHOUSE_JASMINE, step_right
	showemote EMOTE_HAPPY, LIGHTHOUSE_JASMINE, 10
	showtext LighthouseJasmineText4
	waitbutton
	closetext
	applymovement LIGHTHOUSE_JASMINE, LighthouseChuckLeavesMovement
	disappear LIGHTHOUSE_JASMINE
	
;
LighthouseChuckText2:
	text "Chuck: Hey,"
	line "what gives?"
	done

LighthouseJasmineText2:
	text "Jasmine: You"
	line "tell me!"
	
	para "Chuck: I had per-"
	line "fect knowledge,"
	cont "perfect control!"
	
	para "Jasmine: You kept"
	line "me blind to it!"

LighthouseChuckText3:
	text "Chuck: I'd have"
	line "mapped the future"
	cont "for you."
	
	para "You'd rather do"
	line "without?"
	
	para "I've lost one"
	line "home to the whims"
	cont "of fate."
	
	para "I won't lose an-"
	line "other. You child,"
	cont "battle me!"
	done
	
ChuckLossText:
	text "Bested by you?"
	line "I thought I knew"
	cont "it all..."

GetStormBadgeText:
	text "Cianwood washed"
	line "away, but not my"
	cont "duty. You deserve"
	cont "this badge."
	done
	
LighthouseJasmineText3:
	text "Jasmine: You told"
	line "me progress was"
	cont "always good, but"
	
	para "you limited us."
	line "Running the desal"
	cont "at its original"
	cont "level, it may"
	
	para "take generations"
	line "for the shore to"
	cont "recover."
	done

LighthouseChuckText4:
	text "Chuck: Let's go."
	line "We can talk about"
	cont "next steps."
	done

LighthouseJasmineText4:
	text "If you have some"
	line "time, I'd like to"
	cont "meet you at my"
	cont "Gym."
	done

LighthouseChuckLeavesMovement:
	step_down
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_end

SlowkingLighthouseText:
	text "OMLAS: ..."
	done
	
TentacruelLighthouseText:
	text "Tentacruel:"
	line "Acruu!"
	done
	

LighthouseKurtScript:
	faceplayer
	checkevent EVENT_BEAT_CHUCK
	iftrue_jumptext LighthouseKurtAfterChuck
	showtext LighthouseKurtText0
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	special HealParty
	playmusic MUSIC_HEAL
	pause 30
	special RestartMapMusic
	special Special_FadeInQuickly
	showtext LighthouseKurtText2
	end 

LighthouseKurtText0:
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
	
LighthouseKurtAfterChuck:
	text "I'm ashamed to"
	line "say that I recog-"
	cont "nized the look in"
	cont "Chuck's eyes."
	
	para "It's the same one"
	line "that was in my"
	cont "reflection, when"
	cont "I commanded Lugia"
	cont "at the port."
	
	para "A lack of aware-"
	line "ness about what"
	cont "might be lost,"
	
	para "How difficult it"
	line "might be to rest-"
	cont "ore balance."
	
	para "Hopefully, Celebi"
	line "was watching, and"
	cont "will see that I"
	cont "have learned."
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
	
