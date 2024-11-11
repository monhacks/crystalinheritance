AzaleaGym_MapScriptHeader: ;removed benny josh amy+may trainers
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  4, 15, AZALEA_TOWN, 5
	warp_event  5, 15, AZALEA_TOWN, 5

	def_coord_events

	def_bg_events
	bg_event  3, 13, BGEVENT_READ, AzaleaGymStatue
	bg_event  6, 13, BGEVENT_READ, AzaleaGymStatue
	bg_event  0, 1, BGEVENT_READ, DebugRoomPortal

	def_object_events
	object_event  5,  7, SPRITE_BUGSY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaGymBugsyScript, -1


AzaleaGymStatue:
	gettrainername BUGSY, 1, $1
	checkflag ENGINE_HIVEBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	jumpstd gymstatue2

DebugRoomPortal:
	opentext
	writetext AskWarpDebugText
	yesorno
	iffalse_jumpopenedtext NoWarpText
	writetext WarpingDebugText
	waitbutton
	closetext
	playsound SFX_WARP_TO
	special FadeOutPalettes
	waitsfx
	warp DEBUG_ROOM, 5, 3
	end

AskWarpDebugText:
	text "To Debug Room?"
	done
	
NoWarpText:
	text "No warping."
	done

WarpingDebugText:
	text "Warping..."
	done

AzaleaGymBugsyScript:
	checkevent EVENT_BEAT_BUGSY
	iftrue_jumptextfaceplayer .AfterText
	checkevent EVENT_SAW_KLEAVOR
	iftrue .BattleBugsy
	checkevent EVENT_BEAT_HOLLIS
	iftrue .BattleBugsy
	jumpthistextfaceplayer 
		text "<PLAYER>."
		line "I have an idea."
		
		para "Scyther's genes"
		line "are similar to"
		cont "Slowpoke's."
		
		para "Slowpoke has bra-"
		line "nching evolution."
		
		para "I wonder if Scy-"
		line "ther is the same?"
		
		para "No one takes my"
		line "research serious-"
		cont "ly, so I can't"
		cont "get any progress."
		done

.BattleBugsy:
	showtextfaceplayer .SeenText
	winlosstext .BeatenText, 0
	loadtrainer BUGSY, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_BUGSY
	opentext
	writethistext
		text "<PLAYER> received"
		line "the Hive Badge."
		done
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_HIVEBADGE
	setmapscene AZALEA_TOWN, $1
	setevent EVENT_BEAT_TWINS_AMY_AND_MAY
	setevent EVENT_BEAT_BUG_CATCHER_BENNY
	setevent EVENT_BEAT_BUG_CATCHER_AL
	setevent EVENT_BEAT_BUG_CATCHER_JOSH
	writethistext
		text "Do you know the"
		line "benefits of the"
		cont "Hive Badge?"

		para "If you have it,"
		line "#mon up to <LV>30"

		para "will obey you,"
		line "even traded ones."

		para "Here, I also want"
		line "you to have this."
		done
	promptbutton
	verbosegivetmhm TM_U_TURN
	setevent EVENT_GOT_TM69_U_TURN
	jumpthisopenedtext

	text "TM69 contains"
	line "U-turn."

	para "It lets your #-"
	line "mon attack, then"

	para "switch out right"
	line "away."

	para "Isn't that great?"
	line "I discovered it!"
	done

.SeenText:
	text "Oh? You have"
	line "news about a"
	cont "branched evol-"
	cont "ution of Scyther?"

	para "..."
	
	para "Incredible!" 
	
	para "I feel rejuven-"
	line "ated by this."
	
	para "I'm ready to be a"
	line "Gym Leader again!"
	
	para "Let's battle!"
	done

.BeatenText:
	text "Whoa, amazing!"

	para "My research isn't"
	line "complete yet."
	
	para "I'm going to keep"
	line "going until I"
	cont "show everyone the"
	cont "connection between"
	cont "Bug #mon and"
	cont "people."

	para "Please - take"
	line "this Badge."
	done

.AfterText:
	text "Bug #mon are"
	line "deep. There are"

	para "many mysteries to"
	line "be explored."

	para "Study your favor-"
	line "ites thoroughly."
	done

AzaleaGymGuyScript:
	checkevent EVENT_BEAT_BUGSY
	iftrue_jumptextfaceplayer .WinText
	jumpthistextfaceplayer

	text "Yo, challenger!"

	para "Bugsy's young, but"
	line "his knowledge of"

	para "bug #mon is for"
	line "real."

	para "It's going to be"
	line "tough without my"
	cont "advice."

	para "Let's see… Bug"
	line "#mon don't like"
	cont "fire."

	para "Flying-type moves"
	line "are super effec-"
	cont "tive too."
	done

.WinText:
	text "Well done! That"
	line "was a great clash"

	para "of talented young"
	line "trainers."

	para "With people like"
	line "you, the future of"
	cont "#mon is bright!"
	done
