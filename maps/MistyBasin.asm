MistyBasin_MapScriptHeader: ; should be like  "BurnedTowerB1F_MapScriptHeader"
	def_scene_scripts
;	scene_script BellchimeTrailStepDownTrigger

	def_callbacks
;	callback MAPCALLBACK_OBJECTS, SetupValerieMorningWalkCallback

	def_warp_events
;	warp_event  4,  4, WISE_TRIOS_ROOM, 1
;	warp_event  4,  5, WISE_TRIOS_ROOM, 2

	def_coord_events
;	coord_event 21,  9, 1, BellchimeTrailPanUpTrigger

	def_bg_events
;	bg_event 22, 12, BGEVENT_JUMPTEXT, TinTowerSignText

	def_object_events
;	object_event 16,  6, SPRITE_VALERIE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BellchimeTrailValerieScript, EVENT_VALERIE_BELLCHIME_TRAIL

	object_const_def
;	const BELLCHIMETRAIL_VALERIE
