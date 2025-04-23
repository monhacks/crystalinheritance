GrottoedGlacierB2F_MapScriptHeader:
	def_scene_scripts


	def_callbacks
	callback MAPCALLBACK_TILES,GlacierBouldersB2FCallback
	callback MAPCALLBACK_OBJECTS, GlacierB2FCallback_MoveAK

; PROBABLY WILL NEED A CALLBACK TO MOVE THE PEOPLE 

	def_warp_events
	warp_event 3, 15, GROTTOED_GLACIER_B1F, 2
	warp_event 4, 15, GROTTOED_GLACIER_B1F, 2


	def_coord_events
	coord_event 17, 7, 0, GrottoedGlacierB1FScene0


	def_bg_events



	def_object_events
	object_event  17,  4, SPRITE_KANNA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_GLACIER_KANNA
	object_event  17,  6, SPRITE_ADRINNA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_GLACIER_ADRINNA
	pokemon_event  17, 3, BASCULEGION, -1, -1, PAL_NPC_ROCK, BasculegionText, EVENT_BASCULEGION_SLEEPS
	pokemon_event  17, 3, BASCULEGION, -1, -1, PAL_NPC_RED, BasculegionText, EVENT_BASCULEGION_LIVES ; INITIALIZE 

	object_const_def
	const GLACIER_B2F_KANNA
	const GLACIER_B2F_ADRINNA
	const GLACIER_B2F_BASCULEGION_SLEEPY
	const GLACIER_B2F_BASCULEGION_ALIVE	

GlacierBouldersB2FCallback:
	checkevent EVENT_BOULDER1_IN_GLACIER
	iffalse .Done
	changeblock  8,  8, $2D
	checkevent EVENT_BOULDER2_IN_GLACIER
	iffalse .Done
	changeblock  8, 14, $2F
.Done:
	endcallback


GlacierB2FCallback_MoveAK:
	checkevent EVENT_BATTLED_BASCULEGION ; if >1$?
	iffalse .Skip
	moveobject GLACIER_B2F_KANNA, 18, 3
	moveobject GLACIER_B2F_ADRINNA, 18, 6
.Skip:
	endcallback

GrottoedGlacierB1FScene0:
	pause 10
	showtext GlacierB2F_Text1
	turnobject GLACIER_B2F_KANNA, RIGHT
	showtext GlacierB2F_Text2
	applyonemovement GLACIER_B2F_KANNA, step_right
	applyonemovement GLACIER_B2F_KANNA, step_up	
	turnobject GLACIER_B2F_KANNA, LEFT
	showemote EMOTE_SLEEP, GLACIER_B2F_BASCULEGION_SLEEPY, 10 
	showtext GlacierB2F_Text3
	turnobject GLACIER_B2F_KANNA, DOWN
	showemote EMOTE_BOLT, GLACIER_B2F_KANNA, 10
	showtext GlacierB2F_Text4
	disappear GLACIER_B2F_BASCULEGION_SLEEPY
	appear GLACIER_B2F_BASCULEGION_ALIVE
	pause 10
	showemote EMOTE_BOLT, GLACIER_B2F_BASCULEGION_ALIVE, 10
	applymovement GlacierBasc_Move1
	applyonemovement GLACIER_B2F_ADRINNA, step_right
	turnobject GLACIER_B2F_ADRINNA, LEFT
	applymovement GlacierBasc_Move2
	showtext BasculegionText
	loadvar VAR_BATTLETYPE, BATTLETYPE_TRAP
	loadwildmon TOXICROAK, 20
	startbattle
	ifequal $1, .Continue
.Continue:
	setevent EVENT_BATTLED_BASCULEGION
	setevent EVENT_BASCULEGION_SLEEPS
	setevent EVENT_BASCULEGION_LIVES
	showtext GlacierB2F_Text5
	showemote EMOTE_QUESTION, GLACIER_B2F_KANNA, 10 
	showtext GlacierB2F_Text6
	showemote EMOTE_BOLT GLACIER_B2F_KANNA, 10 	
	showtext GlacierB2F_Text7
	special HealParty
	

;
	writetext KannaWaterfallText
	verbosegivetmhm HM_WATERFALL
	;movement 
	writetext KannaTellAmosText	
; scene with the gyarados
	setevent EVENT_BEAT_KANNA
; all others disappear
	setscene $1
	end

GlacierB2F_Text1:
Adrinna: Your people enjoy the Gyarados. Some say they will stay in Johto. So join us! 

GlacierB2F_Text2:
Kanna:  Our culture is strong. We know that to discipline requires sacrifice. 
Adrinna: Tsk, Tsk.

GlacierB2F_Text3
Kanna: We revere the Basculegion. The symbol of sacrifice. We owe it to our ancestors to persevere struggles. You know nothing of it – you destroy what gives their lives meaning.
Adrinna: I find meaning for myself. How sad that you can’t. 

GlacierB2F_Text4:
Kanna: It’s time you saw how strong our foundation is. Basculegion, go!


GlacierB2F_Text5:
Adrinna: Well done, <PLAYER>. 

GlacierB2F_Text6:
Kanna: Who is this?
Adrinna: You impress me more each time. 

GlacierB2F_Text7
Kanna: Your lieutenant? I’ll start with you!
Adrinna: <PLAYER>, let me heal you. She’s hardly being fair. Please, show her what strength looks like. 

<Battle Kanna>

Kanna: Your technique – was it passed down from generations.
Kanna: Having defeated me, I am obligated by duty to give you the Legacy Badge, and this HM. 
KannaTellAmosText:
	text "I'll be telling"
	line "the Johto elders"
	para "about <PLAYER>."
	Done

<Rumble>
Kanna: What’s that? 
<scene for the tranquil tarn> 
Adrinna: The Gyarados are blowing off steam. I instructed my brigaders to thrash the glacier.
Kanna: But… without a glacier to traverse, and peaceful waters, how will our regions meet? Generations of knowledge, destroyed… 
Adrinna:  My work is done. It was a nice try to ambush me here. Goodbye. 
<Adrinna teleports away>
Kanna: We have to leave, before anything happens… 
<Kanna teleports away>

	
KannaWaterfallText:
	text "I hate that you"
	line "beat me, but I"
	para "took an oath. You"
	line "can have this HM."
	done

KannaTellAmosText:
	text "I'll be telling"
	line "the Johto elders"
	para "about your green"
	line "minion, Adrinna."
	done
