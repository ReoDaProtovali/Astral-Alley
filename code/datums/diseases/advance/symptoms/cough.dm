/*
//////////////////////////////////////

Coughing

	Noticable.
	Little Resistance.
	Doesn't increase stage speed much.
	Transmittable.
	Low Level.

BONUS
	Will force the affected mob to drop small items. Small spread if not wearing a mask.

//////////////////////////////////////
*/

/datum/symptom/cough
	name = "Cough"
	stealth = -1
	resistance = 3
	stage_speed = 1
	transmittable = 2
	level = 1
<<<<<<< HEAD
	severity = 1
=======
	severity = 0
	base_message_chance = 15
	symptom_delay_min = 15 SECONDS
	symptom_delay_max = 45 SECONDS

	var/infective = FALSE

	threshold_descs = list(
		"Resistance 3" = "Host will drop small items when coughing.",
		"Resistance 10" = "Occasionally causes coughing fits that stun the host.",
		"Stage Speed 6" = "Increases cough frequency",
		"Stealth 4" = "The symptom remains hidden until active.",
		"Transmission 11" = "The hosts coughing will occasionally spread the virus."
	)

/datum/symptom/cough/severityset(datum/disease/advance/A)
	. = ..()
	if(A.resistance >= 3)
		severity += 1
		if(A.resistance >= 10)
			severity += 1

/datum/symptom/cough/Start(datum/disease/advance/A)
	if(!..())
		return
	if(A.stealth >= 4)
		supress_warning = TRUE
	if(A.resistance >= 3)
		power = 1.5
		if(A.resistance >= 10)
			power = 2
	if(A.stage_rate >= 6)
		symptom_delay_max = 10
	if(A.transmission >= 11)
		infective = TRUE
>>>>>>> 05b57277bf ([MIRROR] Faltered & Dormant diseases update (#10985))

/datum/symptom/cough/Activate(var/datum/disease/advance/A)
	..()
	if(prob(SYMPTOM_ACTIVATION_PROB))
		var/mob/living/M = A.affected_mob
		switch(A.stage)
			if(1, 2, 3)
				to_chat(M, span_warning(pick("You swallow excess mucus", "You lightly cough.")))
			else
				M.emote("cough")
<<<<<<< HEAD
				var/obj/item/I = M.get_active_hand()
				if(I && I.w_class == ITEMSIZE_SMALL)
					M.drop_item()
				if(!M.wear_mask) // Small spread if not wearing a mask
					A.spread(2)
	return
=======
				addtimer(CALLBACK(M, TYPE_PROC_REF(/mob, emote), "cough"), 1 SECONDS)
				addtimer(CALLBACK(M, TYPE_PROC_REF(/mob, emote), "cough"), 3 SECONDS)
				addtimer(CALLBACK(M, TYPE_PROC_REF(/mob, emote), "cough"), 6 SECONDS)
			if(infective && !(A.spread_flags & DISEASE_SPREAD_FALTERED) && prob(50))
				addtimer(CALLBACK(A, TYPE_PROC_REF(/datum/disease, spread), 2), 20)
>>>>>>> 05b57277bf ([MIRROR] Faltered & Dormant diseases update (#10985))
