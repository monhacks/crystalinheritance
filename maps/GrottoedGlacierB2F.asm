GrottoedGlacierB2F_MapScriptHeader:
	def_scene_scripts


	def_callbacks
	callback MAPCALLBACK_TILES,GlacierBouldersB2FCallback

	def_warp_events
	warp_event 3, 15, GROTTOED_GLACIER_B1F, 2
	warp_event 4, 15, GROTTOED_GLACIER_B1F, 2


	def_coord_events
	coord_event 17, 7, 0, GrottoedGlacierB1FScene0


	def_bg_events



	def_object_events



	object_const_def
	const GLACIER_B2F_KANNA
	const GLACIER_B2F_ADRINNA
	const GLACIER_B2F_BASCULEGION
	

GlacierBouldersB2FCallback:
	checkevent EVENT_BOULDER1_IN_GLACIER
	iffalse .Done
	changeblock  8,  8, $2D
	checkevent EVENT_BOULDER2_IN_GLACIER
	iffalse .Done
	changeblock  8, 14, $2F
.Done:
	endcallback

GrottoedGlacierB1FScene0:
; adrinna, you know nothing of sacrifice
; kanna, you are mistaken

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
