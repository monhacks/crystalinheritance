CattleCull39_MapScriptHeader: ;TODO putthe locations of everything 
	def_scene_scripts


	def_callbacks


	def_warp_events



	def_coord_events



	def_bg_events
	bg_event 15,  7, BGEVENT_JUMPTEXT, CattleCull39SignText


	def_object_events
	object_event 0,  0, SPRITE_NOMAD_M, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, GenericTrainerNomadMDale, -1
	object_event 0,  0 SPRITE_NOMAD_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, GenericTrainerNomadMJacob, -1
	object_event 0,  0, SPRITE_NOMAD_F, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, GenericTrainerNomadFMarlene, -1
	object_event 0,  0, SPRITE_NOMAD_F, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, GenericTrainerNomadFRin, -1


	object_const_def

GenericTrainerNomadFMarlene:
   generictrainer NOMAD_F, MARLENE, EVENT_BEAT_NOMAD_F_MARLENE, NomadMarleneSeenText, NomadMarleneBeatenText


   text "They fear barbari-"
   line "ans will kidnap"
   cont "our children."
   para "But here, we lose"
   line "them anyway..."
   done

NomadMarleneSeenText:
   text "My child won't"
   line "know our ways..."
   para "They call this"
   line "safety?"
   done

NomadMarleneBeatenText:
   text "My little one saw"
   line "our strength..."
   done


GenericTrainerNomadMDale:
   generictrainer NOMAD_M, DALE, EVENT_BEAT_NOMAD_M_DALE, NomadDaleSeenText, NomadDaleBeatenText

   text "We read storms to"
   line "guide our kin."
   para "Now guards watch"
   line "our paths..."
   para "Who guards our"
   line "old wisdom?"
   done

NomadDaleSeenText:
   text "The winds speak"
   line "to wanderers..."
   para "Their weathermen"
   line "are deaf."
   done

NomadDaleBeatenText:
   text "You flow like the"
   line "changing tides."
   done



GenericTrainerNomadFRin:
   generictrainer NOMAD_F, RIN, EVENT_BEAT_NOMAD_F_RIN, NomadRinSeenText, NomadRinBeatenText

   text "Their new healing"
   line "house rises..."
   para "But health flowed"
   line "with movement."
   para "What sickness do"
   line "they fear most?"
   done

NomadRinSeenText:
   text "Our lives moved"
   line "with seasons."
   done

NomadRinBeatenText:
   text "True strength needs"
   line "freedom..."
   done

GenericTrainerNomadMJacob:
   generictrainer NOMAD_M, JACOB, EVENT_BEAT_NOMAD_M_JACOB, NomadJacobSeenText, NomadJacobBeatenText

   text "They say their"
   line "routes are safe."
   para "Safe for gold,"
   line "perhaps..."
   done

NomadJacobSeenText:
   text "I knew every cove"
   line "and inlet..."
   para "Their maps make"
   line "us worthless."
   done

NomadJacobBeatenText:
   text "You battle like a"
   line "true navigator."
   done

CattleCull39SignText:
	text "Emperor's Road-"
	line "Follow through"
	para "Cattle Cull to"
	line "Trader's Landing"
	done
