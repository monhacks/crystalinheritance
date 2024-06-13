AnarresTown_MapScriptHeader: ; should be like  "BurnedTowerB1F_MapScriptHeader"
	def_scene_scripts
;	scene_script BellchimeTrailStepDownTrigger

	def_callbacks
;	callback MAPCALLBACK_OBJECTS, SetupValerieMorningWalkCallback

	def_warp_events
	warp_event  2, 10, HOLLYS_HOLT, 1
	warp_event  2, 11, HOLLYS_HOLT, 2
	warp_event  9,  3, ANARRES_HOUSE, 1
	warp_event 21, 15, ANARRES_CHARCOAL_KILN, 1
	warp_event 11, 13, ANARRES_TOWER_1F, 1
	warp_event 17, 9, ANARRES_DORMS, 1
	warp_event 21, 5, ANARRES_STOCKROOM, 1
	warp_event 30, 9, MISTY_BASIN, 1

	def_coord_events
;	coord_event 21,  9, 1, BellchimeTrailPanUpTrigger

	def_bg_events
;	bg_event 22, 12, BGEVENT_JUMPTEXT, TinTowerSignText

	def_object_events
;	object_event 16,  6, SPRITE_VALERIE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BellchimeTrailValerieScript, EVENT_VALERIE_BELLCHIME_TRAIL

	object_const_def
;	const BELLCHIMETRAIL_VALERIE
