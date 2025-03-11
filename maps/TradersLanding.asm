TradersLanding_MapScriptHeader: 

	def_scene_scripts


	def_callbacks


	def_warp_events
	warp_event 11, 6, LANDING_BARBEAU, 1
	warp_event 13, 11, LANDING_STOCKROOM, 1
	warp_event 15, 16, LANDING_DORMS, 1
	warp_event 9, 16, LANDING_TAVERN, 1
	warp_event 25, 7, LANDING_HOUSE_1, 1
	warp_event 29, 7, LANDING_HOUSE_2, 1
	warp_event 20, 27, LANDING_DOCKS, 1 
	warp_event 21, 27, LANDING_DOCKS, 1 


	def_coord_events
	coord_event 18, 0, 0, TL_Scene_Part_1_Script_L
	coord_event 19, 0, 0, TL_Scene_Part_1_Script
	coord_event 20, 0, 0, TL_Scene_Part_1_Script
	coord_event 21, 0, 0, TL_Scene_Part_1_Script_R
	
	coord_event 5, 9, 1, TL_Scene_2_L
	coord_event 6, 9, 1, TL_Scene_2_R

	def_bg_events
	bg_event 21, 4, BGEVENT_JUMPTEXT, TL_ReportForWorkSign
	bg_event 16, 18, BGEVENT_JUMPTEXT, TL_OpenForBusinessSign
	bg_event 14, 6, BGEVENT_JUMPTEXT, TL_KenseysOfficeSign
	bg_event 22, 12, BGEVENT_READ, TL_AmosWantedSign

;SHRINE



	def_object_events

	object_event 19, 5, SPRITE_BARBEAU, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_LANDING_SCENE_1_BARBEAU ; ADD TO EVENTS
	object_event 20, 5, SPRITE_KENSEY, 	SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_LANDING_SCENE_1_KENSEY
	object_event 18, 0, SPRITE_KURT, 	SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_LANDING_SCENE_1_KURT
	
	object_event  5, 5, SPRITE_BARBEAU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, LandingBarbeauScript, -1 ; ADD TO INITIALIZE EVENTS
	object_event 5, 10, SPRITE_KURT, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1 ; ADD TO INITIALIZE EVENTS

	object_event 20, 25, SPRITE_BRIGADER, 	SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, jumptextfaceplayer, TL_Brigader_Script, EVENT_BEAT_KENSEY_PORT
	object_event 21, 25, SPRITE_BRIGADER, 	SPRITEMOVEDATA_STANDIING_UP, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, jumptextfaceplayer, TL_Brigader_Script, EVENT_BEAT_KENSEY_PORT

	object_event 10, 19, SPRITE_FIREBREATHER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, LandingEggScript, EVENT_BEAT_KENSEY_PORT


	object_const_def
	const TRADERS_LANDING_BARBEAU_1
	const TRADERS_LANDING_KENSEY
	const TRADERS_LANDING_KURT
	const TRADERS_LANDING_BARBEAU_2
	const TRADERS_LANDING_KURT_2

TL_Scene_Part_1_Script_R:
	applyonemovement PLAYER, step_left
	sjump TL_Scene_Part_1_Script
	
TL_Scene_Part_1_Script_L:
	applyonemovement PLAYER, step_right
;JUMPTHRU
TL_Scene_Part_1_Script:
	applyonemovement PLAYER, step_down
	applyonemovement PLAYER, step_down
	applyonemovement PLAYER, step_down
	applyonemovement PLAYER, step_down
	refreshscreen
	trainerpic KENSEY
	waitbutton
	closepokepic
	pause 30
	showemote EMOTE_SHOCK, TRADERS_LANDING_KENSEY, 10
	opentext
	writetext TL_Text1
	waitbutton
	closetext

	refreshscreen
	trainerpic BARBEAU
	waitbutton
	closepokepic

	showemote EMOTE_QUESTION, TRADERS_LANDING_BARBEAU_1, 10
	showtext TL_Text2
	showtext TL_Text3
	turnobject TRADERS_LANDING_BARBEAU_1, LEFT
	showtext TL_Text4 ; 
	showemote EMOTE_SHOCK, TRADERS_LANDING_KENSEY, 10
	showtext TL_Text5
	waitbutton
	closetext
	applymovement TRADERS_LANDING_KENSEY, TL_Move_Kensey_1
	disappear TRADERS_LANDING_KENSEY
	turnobject TRADERS_LANDING_BARBEAU_1, DOWN
	showtext TL_Text6
	appear TRADERS_LANDING_KURT
	applymovement TRADERS_LANDING_KURT, TL_Move_Kurt_1
	turnobject TRADERS_LANDING_BARBEAU_1, LEFT	
	showtext TL_Text7
	showtext TL_Text8
	applymovement TRADERS_LANDING_BARBEAU_1, TL_Move_Kurt_1
	disappear TRADERS_LANDING_BARBEAU_1
	applyonemovement TRADERS_LANDING_KURT, step_up
	turnobject TRADERS_LANDING_KURT, RIGHT
	showtext TL_Text9
	applymovement TRADERS_LANDING_KURT, TL_Move_Kurt_2
	disappear TRADERS_LANDING_KURT
	setevent EVENT_LANDING_SCENE_1_BARBEAU
	setevent EVENT_LANDING_SCENE_1_KENSEY
	setevent EVENT_LANDING_SCENE_1_KURT
	end

TL_Text1:
Kensey: You must get your navigators to help! We have promised the outsiders safe port. 

TL_Text2:
Barbeau: How can I force them? They refuse. We know that the guardian of the sea protects us. 

TL_Text3:
Kensey: You’re being difficult. Yes, Lugia is the guardian of the sea, but she also serves the emperor. You don’t understand what’s at stake. 

TL_Text4:
Barbeau: I know we’re caught between the emperor’s heel and the outsiders’ cannons. When the time comes, I have faith she will choose us over the emperor.

TL_Text5:
Kensey: Ugh! If the ships don’t make passage, the outsiders will see it as an act of war! All of Johto depends on you. Get to it. 
Kensey leaves

TL_Text6:
Barbeau: (sighs) … Father, what would you do?

Kurt appears
TL_Text7:
Kurt: Excuse me! Are you the elder here? We are trying to oppose the emperor's import of steel, and we may be able to help you. 

TL_Text8:
Barbeau: Hush! You'll get me in trouble. If you are serious, meet me by the shrine at the west of town. 

TL_Text9:
Kurt: PLAYER. Lugia in this timeline is with the emperor. But with your silver wing, we could go to our time and bring her here to wreck the emperor's port. Let's see if Barbeau will help us out. 




TL_Scene_2_L:
	applyonemovement PLAYER, step_right
TL_Scene_2_R:
	applymovement PLAYER, TL_2_PlayerMovesUp
	turnobject TRADERS_LANDING_BARBEAU_2, RIGHT
	showtext TL_2_Text1 ; you've comE? 
	pause 10
	appear TRADERS_LANDING_KURT_2
	applymovement TRADERS_LANDING_KURT_2, TL_2_PlayerMovesUp
	turnobject TRADERS_LANDING_BARBEAU_2, DOWN
	showtext TL_2_Text2 ; we are on a quest from celebi from a different world, to stop expansion of steel types. We believe that this shrine will get celebi to help us out. 
	showemote EMOTE_SHOCK, TRADERS_LANDING_BARBEAU_2, 10
	showtext TL_2_Text3 ; best chance i've got. kensey and those pokeballs are so brutal. Just promise me you will take good care of her?
	showemote EMOTE_BOLT, TRADERS_LANDING_KURT_2, 10
	showtext TL_2_Text4 ; yes we will
	turnobject TRADERS_LANDING_BARBEAU_2, UP
	applyonemovement TRADERS_LANDING_BARBEAU_2, step_up
	turnobject PLAYER, UP
	applyonemovement PLAYER, step_up
	applymovement TRADERS_LANDING_KURT_2, TL_2_KurtMoves2
	showtext TL_2_Text5 ; honor Lugia
	playsound SFX_WARP_TO
	setevent EVENT_BARBEAU_WARPED
	special FadeOutPalettes
	waitsfx
	warp ROUTE_40, 14, 2
	end

TL_2_Text1:
	text "Barbeau: You"
	line "made it to our"
	cont "shrine."
	
	para "But where's your"
	line "grandpa?"
	done

TL_2_Text2:
	text "Kurt: Mister"
	line "Barbeau! We are on"
	para "a quest given by"
	line "Celebi, from a"
	cont "time away."
	
	para "We share the same"
	line "goal: stop those"
	cont "ships landing."
	
	para "In our time, we"
	line "are threatened"
	cont "by an onslaught"
	cont "of Steel types."
	
	para "I believe if you"
	line "pray here, we can"
	cont "bring Lugia back"
	cont "to help you."
	done
	
TL_2_Text3:
	text "Barbeau: You are"
	line "my best shot."
	
	para "We're stuck with"
	line "brutal outsiders"
	cont "on one side, and"
	
	para "brutal General"
	line "Kensey on the"
	cont "other side."
	
	para "Just promise me:"
	line "you will look"
	cont "after Lugia?"
	
	para "If anything were"
	line "to happen to her,"
	para "it would be..."
	line "devastating."
	
	para "Lugia is not a"
	line "machine to be"
	cont "used."
	done

TL_2_Text4:
	text "Kurt: I promise,"
	line "I will respect"
	cont "her limits."
	
	para "We even have a"
	line "Silver Wing."
	
	para "You can trust"
	line "us."
	done
	
TL_2_Text5:
	text "Barbeau: "
	line "Without waypoint,"; keep these lines 
	cont "Clouds shroud all" 
	
	para "Our minds muddled" ; maybe revise?
	line "Fear enthralled"

	para "Beseech thee moon" ; keep these lines
	line "Show us the way,"

	para "Pierce shadows" ; maybe revise?
	line "Until dawn's ray."	
	done
	

TL_KenseysOfficeSign:
	text "Kensey's Office"
	done

TL_ReportForWorkSign:
	text "Coastal Nomads:"
	line "Report for work"
	cont "at lighthouse!"
	para "-General Kensey"
	done

TL_OpenForBusinessSign:
	text "Trader's Landing!"
	line "Open for business!"
	done

TL_Brigader_Script:
	checkevent EVENT_BEAT_KENSEY_PORT ; ADD TO EVENTS 
	iftrue_jumptextfaceplayer TL_Brigader_AfterKenseyText
	jumpthisopenedtext
	
	text "Port is open only"
	line "to workers."
	
	para "Go see Barbeau"
	line "for assignment."
	done

TL_Brigader_AfterKenseyText:
	text "The port will"
	line "take some time"
	cont "to rebuild after"
	cont "that nasty storm."
	done


LandingEggScript: ;cf the cafe script 
	checkevent EVENT_GOT_HSLIGGOO_EGG
	iftrue_jumptextfaceplayer GotHSliggooEggText
	faceplayer
	opentext
	writetext GivingHSliggooEggText
	special PlaceMoneyTopRight
	yesorno
	iffalse_jumpopenedtext NoMoneyText
	checkmoney $0, 10000
	ifequal $2, jumpopenedtext NoMoneyText
	promptbutton
	giveegg H__SLIGGOO
	iffalse_jumpopenedtext NoRoomText
	playsound SFX_TRANSACTION
	takemoney $0, 10000
	special PlaceMoneyTopRight
	setevent EVENT_GOT_HSLIGGOO_EGG
	writetext GotHSliggooEggText
	waitbutton
	closetext
	end


GivingHSliggooEggText:
	text "Hey, you my"
	line "contact?"
	
	para "I gotta the egg"
	line "smuggled outta"
	cont "Hisui, like we"
	cont "talked about."
	
	para "10k, like your"
	line "side agreed?"
	done
	
GotHSliggooEggText:
	text "Now, I just need"
	line "to escape back on"
	cont "the Sailor's boat"
	cont "and it's a big"
	cont "score."
	
	para "Hopefully it's"
	line "smooth sailing."
	done

NoMoneyText:
	text "Getting cheap on"
	line "me now?"
	done

NoRoomText:
	text "Oh! You won't"
	line "take it?"
	done

TL_Move_Kensey_1:
	step_down
	step_down
	step_down
	step_down
	step_end

TL_Move_Kurt_2:
	step_down ; fallthru
TL_Move_Kurt_1:
	step_down
	step_down
	step_down
	step_down
	step_down
	turn_head_right
	done


LandingBarbeauScript:
	faceplayer
	checkevent EVENT_BEAT_KENSEY_PORT
	iftrue .AfterKensey
	opentext
	writetext BarbeauTimeTravelText
	yesorno
	iffalse_jumpopenedtext BarbeauNoTimeTravelText
	writetext TL_2_Text5
	waitbutton
	closetext
	playsound SFX_WARP_TO
	special FadeOutPalettes
	waitsfx
	warp ROUTE_40, 14, 2
	end

BarbeauTimeTravelText:
	text "I thought you"
	line "were bringing"
	cont "Lugia back?"
	
	para "Have you come to"
	line "pray with me?"
	done

BarbeauNoTimeTravelText:
	text "Some other time."
	done



.AfterKensey:
	checkpoke LUGIA
	iftrue_jumptextfaceplayer BarbeauLugiaText
	jumpthisopenedtext
	
	text "What will we do?"
	line "Lugia, guardian"
	cont "of the seas, is"
	para "no longer with"
	line "us. We must find"
	cont "ways to adapt"
	cont "without her."
	done

BarbeauLugiaText:
	text "What will we do?"
	line "Lugia, guardian"
	cont "of the seas, is"
	para "no longer with"
	line "us."
	
	para "Oh? She is with"
	line "you? But I saw!"
	cont "With my own eyes!"
	para "Lugia must have"
	line "chosen you for"
	cont "a reason."
	
	para "We will find a"
	line "way to adapt"
	cont "without her"
	cont "presence."
	done

TL_AmosWantedSign:
	refreshscreen
	trainerpic AMOS
	waitbutton
	closepokepic
	jumpthistext

	text "WANTED: This man"
	line "is wanted for"
	cont "crimes against"
	cont "the emperor."

	para "If you see him,"
	line "please notify a"
	cont "brigader"
	cont "immediately."

	para "Known alias:"
	line "Amos."
	done

TL_2_PlayerMovesUp:
	step_up
	step_up
	step_up
	step_up
	turn_head_left
	step_end

TL_2_KurtMoves2:
	step_left
	step_up
	step_up
	step_end
