CattleCull38_MapScriptHeader: 

	def_scene_scripts


	def_callbacks


	def_warp_events
	warp_event 35,  8, CAPITAL_CULL_GATE, 3
	warp_event 35,  9, CAPITAL_CULL_GATE, 4


	def_coord_events



	def_bg_events
	bg_event 33,  7, BGEVENT_JUMPTEXT, CattleCull38SignText


	def_object_events ; nomads should have flying, psychic, water type #mon 
	object_event 28,  10, SPRITE_NOMAD_M, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, GenericTrainerNomadMJoel, -1
	object_event 17,   5, SPRITE_NOMAD_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, GenericTrainerNomadMGlenn, -1
	object_event 13,  9, SPRITE_NOMAD_F, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, GenericTrainerNomadFReina, -1
	object_event  4,  9, SPRITE_NOMAD_F, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, GenericTrainerNomadFAlina, -1


	object_const_def


CattleCull38SignText:
	text "Emperor's Road-"
	line "Follow through"
	para "Cattle Cull to"
	line "Trader's Landing"
	done
	
GenericTrainerNomadMJoel:
	generictrainer NOMAD_M, NOMAD_M_JOEL, EVENT_BEAT_NOMAD_M_JOEL, NomadJoelSeenText, NomadJoelBeatenText

	text "Each spring, we"
	line "guided our herds"
	para "along the cliffs"
	line "to the shores."
	para "The Emperor says"
	line "progress needs"
	cont "gates and guards."
	done

NomadJoelSeenText:
	text "My Miltank once"
	line "roamed freely."
	para "Now we're both"
	line "fenced in..."
	done

NomadJoelBeatenText:
	text "Even caged 'mon"
	line "can fight!"
	done



GenericTrainerNomadMGlenn:
	generictrainer NOMAD_M, NOMAD_M_GLENN, EVENT_BEAT_NOMAD_M_GLENN, NomadGlennSeenText, NomadGlennBeatenText

	text "Emperor's ships"
	line "patrol our seas."
	para "They say it keeps"
	line "us safe, but it"
	cont "feels like chains."
	done

NomadGlennSeenText:
	text "My nets once"
	line "danced freely"
	para "between the two"
	line "distant shores."
	done

NomadGlennBeatenText:
	text "Your power flows"
	line "like lost tides..."
	done



GenericTrainerNomadFReina:
	generictrainer NOMAD_F, NOMAD_F_REINA, EVENT_BEAT_NOMAD_F_REINA, NomadReinaSeenText, NomadReinaBeatenText

	text "Sacred herbs grow"
	line "on these slopes."
	done

NomadReinaSeenText:
	text "These cliffs hold"
	line "ancient secrets."
	para "Now we're told"
	line "where to step..."
	done

NomadReinaBeatenText:
	text "You move like"
	line "you roam free."
	done

NomadReinaAfterText:


GenericTrainerNomadFAlina:
	generictrainer NOMAD_F, ALINA, EVENT_BEAT_NOMAD_F_ALINA, NomadAlinaSeenText, NomadAlinaBeatenText

	text "Our people moved"
	line "with storms."
	done

NomadAlinaSeenText:
	text "When wisdom is"
	line "caged..."
	para "Is that their"
	line "progress?"
	done

NomadAlinaBeatenText:
	text "Yours know"
	line "true freedom."
	done
