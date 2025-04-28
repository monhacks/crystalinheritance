BrassTower4FWarp_MapScriptHeader: ;	def_scene_scripts


	def_callbacks


	def_warp_events
	warp_event 4, 9, BRASS_TOWER_4F, 2
	warp_event 5, 9, BRASS_TOWER_4F, 2


	def_coord_events



	def_bg_events



	def_object_events
	object_event  5,  4, SPRITE_ADRINNA, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BrassTowerAdrinna, -1


	object_const_def
	
BrassTowerAdrinna:
	faceplayer
	checkevent EVENT_BEAT_ADRINNA_TOWER
	iftrue_jumptext .AfterText
	checkpoke CELEBI
	iftrue .DeclinedCelebi 
	showtext .SeenText
	pause 10
	yesorno
	iftrue .YesToAdrinna
.Declined:
	showtext .NoToAdrinnaText
	winlosstext .BeatenText, 0
	loadtrainer ADRINNA, 3
	startbattle
	reloadmapafterbattle
	showtext .AfterText
	setevent EVENT_BEAT_ADRINNA_TOWER
	end

.DeclinedCelebi:
	showtext AdrinnaSeenText0
	sjump .Declined
	end

.YesToAdrinna:
	showtext .AreYouSure
	yesorno
	iffalse .Declined ; jumps above
	setevent EVENT_ACCEPTED_ADRINNA
	showtext .AdrinnaTakesOverText
	setevent EVENT_BEAT_ADRINNA_TOWER
	end

AdrinnaSeenText0:
	text "I knew your tal-"
	line "ents would rise"
	cont "you to the top."
	
	para "The world is best"
	line "when the strong"
	cont "can sort thems-"
	cont "elves into power."
	
	para "<PLAYER>. You"
	line "could be so much"
	cont "more without your"
	cont "bleeding-heart"
	cont "grandfather."
	
	para "If you shed those"
	line "antiquated bonds,"
	cont "you would gain"
	cont "fame from Anarres"
	cont "to the Landing"
	cont "and beyond!"
	
	para "You know that tr-"
	line "dition serves the"
	cont "leeching elders."
	
	para "Hm? I can see in"
	line "your eyes, you're"
	cont "as weak as your"
	cont "Grandfather."
	done


.SeenText:
	text "I knew your tal-"
	line "ents would rise"
	cont "you to the top."
	
	para "The world is best"
	line "when the strong"
	cont "can sort thems-"
	cont "elves into power."
	
	para "<PLAYER>. You"
	line "could be so much"
	cont "more without your"
	cont "bleeding-heart"
	cont "grandfather."
	
	para "If you shed those"
	line "antiquated bonds,"
	cont "you would gain"
	cont "fame from Anarres"
	cont "to the Landing"
	cont "and beyond!"
	
	para "You know that tr-"
	line "dition serves the"
	cont "leeching elders."
	
	para "What do you say?"
	line "Burn it down with"
	cont "me. We only need"
	cont "a cult of self."
	done

.BeatenText:
	text "Unbelievable."
	line "I gathered the"
	cont "strongest #mon"
	cont "and it got me"
	para "nothing. Your"
	line "bond... how does"
	cont "it overcome me?"
	done

.AfterText:
	text "Goodbye <PLAYER>."
	line "I know that one"
	cont "day, you'll look"
	cont "up at a diseased,"
	para "spoiled politic,"
	line "and wish that"
	cont "you had taken my"
	cont "chance to smother"
	cont "that it when you"
	cont "had the chance."
	done

.AdrinnaTakesOverText:
	text "Excellent. Meet"
	line "me on the roof."
	para "We need to show"
	line "everyone that how"
	cont "the emperor"
	cont "manipulates them."
	done

.AreYouSure:
	text "Really? You will"
	line "join me in burn-"
	cont "ing down Johto's"
	cont "traditions?"
	done

.NoToAdrinnaText:
	text "Disappointing."
	line "No matter - I'll"
	cont "dispatch you, and"
	cont "then the emperor!"
	done
