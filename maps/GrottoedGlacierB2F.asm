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
	coord_event 17, 7, 0, GrottoedGlacierB1FScene1

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
	applymovement GLACIER_B2F_BASCULEGION_ALIVE, GlacierBasc_Move1
	applyonemovement GLACIER_B2F_ADRINNA, step_right
	turnobject GLACIER_B2F_ADRINNA, LEFT
	applymovement GLACIER_B2F_BASCULEGION_ALIVE, GlacierBasc_Move2
	showtext BasculegionText
	loadvar VAR_BATTLETYPE, BATTLETYPE_TRAP
	loadwildmon TOXICROAK, 20
	startbattle
	ifequal $1, .Continue
.Continue:
	disappear GLACIER_B2F_BASCULEGION_ALIVE
	setscene $1
	setevent EVENT_BATTLED_BASCULEGION
	setevent EVENT_BASCULEGION_SLEEPS
	setevent EVENT_BASCULEGION_LIVES
GrottoedGlacierB1FScene1:
	showtext GlacierB2F_Text5
	showemote EMOTE_QUESTION, GLACIER_B2F_KANNA, 10 
	showtext GlacierB2F_Text6
	showemote EMOTE_BOLT, GLACIER_B2F_KANNA, 10 	
	showtext GlacierB2F_Text7
	special HealParty
	winlosstext KannaWinText, 0
	setlasttalked GLACIER_B2F_KANNA
	loadtrainer KANNA, 1
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	setevent EVENT_BEAT_KANNA
	opentext
	writetext KannaWaterfallText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_MARSHBADGE
	verbosegivetmhm HM_WATERFALL	
	writetext KannaTellAmosText	
	closetext
	earthquake 100
	showemote EMOTE_SHOCK, GLACIER_B2F_KANNA, 10 
	opentext 
	writetext GlacierB2F_Text8
	waitbutton
	closetext
	applyonemovement GLACIER_B2F_ADRINNA, teleport_from
	disappear GLACIER_B2F_ADRINNA
	setevent EVENT_GLACIER_ADRINNA
	showtext GlacierB2F_Text9
	applyonemovement GLACIER_B2F_KANNA, teleport_from
	disappear GLACIER_B2F_KANNA	
	setevent EVENT_GLACIER_KANNA
	setscene $2
	end

GlacierB2F_Text1:
	text "Adrinna: Your"
	line "people enjoy the"
	para "Gyarados. Some"
	line "say they will"
	cont "stay in Johto."
	done

GlacierB2F_Text2:
	text "Kanna: Our"
	line "culture is"
	cont "strong. We know"
	para "that discipline"
	line "needs sacrifice."

	para "Adrinna: Tsk,"
	line "Tsk."
	done

GlacierB2F_Text3:
	text "Kanna: We revere"
	line "the Basculegion."
	para "The symbol of"
	line "sacrifice. We"
	cont "owe it to our"
	para "ancestors to"
	line "persevere"
	cont "struggles."
	para "You know nothing"
	line "of it - you"
	para "destroy what"
	line "gives their"
	cont "lives meaning."

	para "Adrinna: I find"
	line "meaning for"
	para "myself. How sad"
	line "that you can't."
	done


GlacierB2F_Text4:
	text "Kanna: It's time"
	line "you saw how"
	para "strong our"
	line "foundation is."
	cont "Basculegion, go!"
	done


GlacierB2F_Text5:
	text "Adrinna: Well"
	line "done, <PLAYER>."
	done

GlacierB2F_Text6:
	text "Kanna: Who is"
	line "this?"
	para "Adrinna: You"
	line "impress me more"
	cont "each time."
	done

GlacierB2F_Text7:
	para "Kanna: Your"
	line "lieutenant? I'll"
	cont "start with you!"
	para "Adrinna: <PLAYER>,"
	line "let me heal you."
	cont "She's hardly"
	cont "being fair."
	done

KannaWinText:
	text "Kanna: Your"
	line "technique - was"
	para "it passed down"
	line "from generations."
	done

Text_ReceivedKannaBadge:
	text "Kanna: Having"
	line "defeated me, I"
	para "am obligated by"
	line "duty to give you"
	para "the Legacy Badge,"
	line "and this HM."
	done

GlacierB2F_Text8:
	text "Kanna: What's"
	line "that? It sounds"
	para "like the glacier"
	line "is cracking!"
	para "Adrinna: Just my"
	line "Gyarados letting"
	para "loose. My"
	line "brigaders are"
	para "showing your"
	line "people what power"
	cont "feels like."
	para "Kanna: But..."
	line "without glaciers"
	cont "to traverse, how"
	cont "will our regions"
	cont "meet?"
	para "Generations of"
	line "knowledge,"
	cont "destroyed!"
	para "Adrinna: It was"
	cont "a nice try to"
	cont "ambush me here."
	cont "Goodbye."
	done

GlacierB2F_Text9:
	text "Kanna: We have"
	line "to leave, before"
	cont "anything else..."
	done
	
KannaWaterfallText:
	text "I hate that you"
	line "beat me, but I"
	para "took an oath. You"
	line "can have this HM"
	para "and the Legacy"
	line "Badge."
	done

KannaTellAmosText:
	text "I'll be telling"
	line "the Johto elders"
	para "about your green"
	line "minion, Adrinna."
	done

GlacierBasc_Move1: ; just in front of adrinna
	fix_facing
	fast_jump_step_down
	fast_jump_step_down
	step_end	

GlacierBasc_Move2: ; in front of player 
	fix_facing
	fast_jump_step_down
	step_end
	
BasculegionText:
	text "Baskaa!"
	done
