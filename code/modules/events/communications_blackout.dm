/datum/event/communications_blackout/announce()
	var/alert = pick(	"Ionospheric anomalies detected. Temporary telecommunication failure imminent. Please contact you*%fj00)`5vc-BZZT", \
						"Ionospheric anomalies detected. Temporary telecommunication failu*3mga;b4;'1v¬-BZZZT", \
						"Ionospheric anomalies detected. Temporary telec#MCi46:5.;@63-BZZZZT", \
						"Ionospheric anomalies dete'fZ\\kg5_0-BZZZZZT", \
						"Ionospheri:%£ MCayj^j<.3-BZZZZZZT", \
						"#4nd%;f4y6,>£%-BZZZZZZZT")

	for(var/mob/living/silicon/ai/A in player_list)	//AIs are always aware of communication blackouts.
<<<<<<< HEAD
		to_chat(A, "<br>")
		to_chat(A, "<span class='warning'><b>[alert]</b></span>")
		to_chat(A, "<br>")
=======
		to_chat(A, span_boldwarning("<br>"))
		to_chat(A, span_boldwarning("[alert]"))
		to_chat(A, span_boldwarning("<br>"))
>>>>>>> 7416cbea22 ([MIRROR] next set of spans (#9247))

	if(prob(30))	//most of the time, we don't want an announcement, so as to allow AIs to fake blackouts.
		command_announcement.Announce(alert, new_sound = sound('sound/misc/interference.ogg', volume=25))


/datum/event/communications_blackout/start()
	for(var/obj/machinery/telecomms/T in telecomms_list)
		T.emp_act(1)
	for(var/obj/machinery/exonet_node/N in machines)
		N.emp_act(1)
