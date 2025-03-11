LandingDocks_MapScriptHeader: 
	def_scene_scripts


	def_callbacks


	def_warp_events
	warp_event 2, 19, ARDUOUS_ANCHORAGE, 2
	warp_event 3, 19, ARDUOUS_ANCHORAGE, 2
	warp_event 2,  8, TRADERS_LANDING, 7
	warp_event 3,  8, TRADERS_LANDING, 8

	def_coord_events
	coord_event 14, 16, 0, LandingDocksScene


	def_bg_events



	def_object_events ; objects placed 
	object_event  9, 16, SPRITE_KURT, 	SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_DOCKS_KURT ; initialize 
	object_event 15, 12, SPRITE_KENSEY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_DOCKS_KENSEY
	object_event 14, 11, SPRITE_BARBEAU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_DOCKS_BARBEAU
	object_event 14, 12, SPRITE_SURGE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED,OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_DOCKS_SURGE
	object_event  15,  14, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, LUGIA, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_DOCKS_LUGIA 


	object_const_def
	const LANDING_DOCKS_KURT
	const LANDING_DOCKS_KENSEY
	const LANDING_DOCKS_BARBEAU
	const LANDING_DOCKS_SURGE
	const LANDING_DOCKS_LUGIA


LandingDocksScene:
	applyonemovement PLAYER, step_up
	showemote EMOTE_BOLT, LANDING_DOCKS_SURGE, 10
	showtext Docks_Text1
	turnobject LANDING_DOCKS_KENSEY, UP
	showtext Docks_Text2
	appear LANDING_DOCKS_KURT
	applymovement LANDING_DOCKS_KURT, Docks_KurtMove1
	appear LANDING_DOCKS_LUGIA
	cry LUGIA
	pause 20
	refreshscreen
	pokepic LUGIA
	waitbutton
	closepokepic
	showtext Docks_Text3
	applymovement LANDING_DOCKS_LUGIA, Docks_LugiaMove1
	disappear LANDING_DOCKS_LUGIA
	showemote EMOTE_SHOCK, LANDING_DOCKS_BARBEAU, 30
	showtext Docks_Text4
	showemote EMOTE_SHOCK, LANDING_DOCKS_SURGE, 10
	applymovement LANDING_DOCKS_SURGE, Docks_CaptainMove1
	showemote EMOTE_HAPPY, LANDING_DOCKS_BARBEAU, 10
	showtext Docks_Text5
	showemote EMOTE_QUESTION, LANDING_DOCKS_KENSEY, 10
	showtext Docks_Text6
	turnobject LANDING_DOCKS_KENSEY, DOWN
	showtext Docks_Text7
	applyonemovement LANDING_DOCKS_KURT, step_right
	turnobject LANDING_DOCKS_KURT, UP
	showtext Docks_Text8
	showemote EMOTE_QUESTION, LANDING_DOCKS_BARBEAU, 20
	showtext Docks_Text9
	applyonemovement LANDING_DOCKS_KURT, step_left
	turnobject LANDING_DOCKS_KURT, UP
	showtext Docks_Text10
	showemote EMOTE_BOLT, LANDING_DOCKS_BARBEAU, 10
	showtext Docks_Text11
	applyonemovement LANDING_DOCKS_KURT, step_left
	turnobject LANDING_DOCKS_KURT, RIGHT
	applyonemovement PLAYER, step_up
	playmusic MUSIC_HEAL
	special HealParty
	special SaveMusic	
	playmusic MUSIC_NONE	
	special RestoreMusic	
	applyonemovement LANDING_DOCKS_BARBEAU, step_down
	winlosstext BarbeauBeatenText1, 0
	loadtrainer BARBEAU, 1 
	startbattle
	reloadmapafterbattle ; OBJECTS IN THE RIGHT SPOT?
	
; end 
	setscene $1
	setevent EVENT_DOCKS_KURT
	setevent EVENT_DOCKS_KURT
	setevent EVENT_DOCKS_KURT
	setevent EVENT_DOCKS_KURT
	setevent EVENT_DOCKS_KURT
	playsound SFX_WARP_TO
	special FadeOutPalettes
	waitsfx
	warp CLASTS_CRADLE_B1F, 21, 12
	end

Docks_Text1:
	text "Captain: You must"
	line "send rafts out!"
	
	para "We agreed! I have"
	line "pidgey mail to my"
	cont "other ships."
	
	para "If they don't get"
	line "more, they will"
	cont "send the big ones"
	cont "to your port!"
	
	para "Kensey: We are"
	line "trying!"
	
	para "Captain: That's"
	line "all you can say?"
	done

Docks_Text2:
	text "Kensey: Told you,"
	line "Barbeau! What of"
	cont "your faith now?"
	done

Docks_KurtMove1:
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_up
	step_up
	step_left
	step_end

Docks_Text3:
	text "Kurt: You'll have"
	line "no more steel!"
	
	para "Lugia, I command"
	line "you, run their"
	cont "ships aground!"
	done

Docks_LugiaMove1:
	fix_facing
	fast_jump_step_down
	fast_jump_step_down
	fast_jump_step_down
	fast_jump_step_down
	fast_jump_step_down
	fast_jump_step_down
	step_end

Docks_Text4:
	text "Barbeau: You..."
	line "The Guardian of"
	cont "the sea!?"

	para "Kurt: Outsider,"
	line "get to your life-"
	cont "boat, while you"
	cont "still can."
	done

Docks_CaptainMove1:
	step_down
	step_right
	step_down
	step_down
	step_down
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_end

Docks_Text5:
	text "Barbeau: I told:"
	line "you so!"
	
	para "Lugia saved us!"
	done

Docks_Text6:
	text "Kensey: I don't"
	line "understand - isn't"
	cont "she with Mejimi?"
	
	para "Barbeau: Lugia"
	line "chose us!"	
	done

Docks_Text7:
	text "Kensey: No, she"
	line "chose this bloke."
	
	para "Do you have any"
	line "idea what you've"
	cont "done, fool?"
	done

Docks_Text8:
	text "Kurt: This is for"
	line "the greater good."
	
	para "I captured Lugia"
	line "for the good of"
	cont "Johto."
	done

Docks_Text9:
	text "Barbeau: CAPTURED"
	line "Lugia?"
	done
	
Docks_Text10:
	text "Kurt: Indeed."
	done

Docks_Text11:
	text "Barbeau: She is"
	line "sacred! I cannot"
	cont "fathom you would"
	
	para "keep her locked"
	line "up! Battle me, or"
	cont "choose your"
	cont "champion!"

	para "Kurt: <PLAYER>,"
	line "please show him"
	cont "what good we've"
	cont "done for him."

	para "I'll heal your"
	line "#mon."
	done

BarbeauBeatenText1:
	text "Unbelievable... "
	line "Lugia is no more"
	cont "in the ocean."
	done

Docks_Text12:
	text "Kurt: Excellent,"
	line "<PLAYER>. I'll"
	cont "heal you again."

	para "We've halted the"
	line "flow of steel!"
	done

; heal party 

Docks_Text13:		
	text "Kensey: Useless!"
	line "You fight without"
	cont "thought, Barbeau!"
	
	para "I'll wipe you off"
	line "these docks, and"
	cont "save the port!"
	done
	
; battle KEnsey

KenseyBeaten1:
	text "You have a talent"
	line "for battling. But"
	cont "Steel will still"
	cont "flow."
	done

Docks_Text14:
	text "Kensey: There is"
	line "a mine east of"
	cont "the capital."
	
	para "You only delay"
	line "the inevitable."
	done

Docks_Text15:
	text "Barbeau: Kurt,"
	line "why don't you"
	cont "call back Lugia?"
	done

Docks_Text16:
	text "Kurt: Oh, where"
	line "did she go?"
	done

Docks_Text17:
	text "Barbeau: I saw"
	line "her dive beneath"
	cont "the waves, but "
	
	para "the sea is still."
	line "Is she OK? Was I"
	cont "the last of us to"
	cont "see her?"
	done

Docks_Text18:
	text "Kensey: Now, you"
	line "will see sense!"
	para "Now you have to"
	line "learn some maps!"
	
	para "And you, old man,"
	line "I will tell the"
	cont "emperor that you"
	
	para "are the one who"
	line "stole his Lugia!"
	done

; kensey away

Docks_Text19: 
	text "Barbeau: Kurt,"
	line "<PLAYER>. You did"
	cont "what you said,"
	
	para "At great cost."
	line "I wonder if it"
	cont "was worth it."
	
	para "A few weeks time"
	line "against possibly"
	cont "Lugia's life?"

	para "... Say, do you"
	line "also smell Holly"
	cont "in the air?"
	done

; celebi scene 

