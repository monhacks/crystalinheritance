SulfurSty_MapScriptHeader: ;	def_scene_scripts


	def_callbacks


	def_warp_events
	warp_event 0, 0, SULFUR_STY_HOUSE_1, 1
	warp_event 0, 0, SULFUR_STY_HOUSE_2, 1



	def_coord_events



	def_bg_events



	def_object_events
; brigaders fighting ninjas
; ninjas with heracross or ursaring, brigaders with primeape or electabuzz or scizor

	tmhmball_event 0, 0, TM_EXPLOSION, EVENT_GOT_TM_EXPLOSION
	tmhmball_event 0, 0, TM_FOCUS_BLAST, EVENT_GOT_TM_FOCUS_BLAST


	object_const_def
