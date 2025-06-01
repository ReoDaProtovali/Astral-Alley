/*
//////////////////////////////////////

Spontaneous Combustion

	Slightly hidden.
	Lowers resistance tremendously.
	Decreases stage tremendously.
	Decreases transmittablity tremendously.
	Fatal Level.

Bonus
	Ignites infected mob.

//////////////////////////////////////
*/

/datum/symptom/fire
	name = "Spontaneous Combustion"
	stealth = 1
	resistance = -4
	stage_speed = -4
	transmittable = -4
	level = 6
	severity = 5

/datum/symptom/fire/Activate(datum/disease/advance/A)
	..()
	if(prob(SYMPTOM_ACTIVATION_PROB))
		var/mob/living/M = A.affected_mob
		switch(A.stage)
			if(3)
				to_chat(M, span_warning(pick("You feel hot.", "You hear a crackling noise.", "You smell smoke.")))
			if(4)
				Firestacks_stage_4(M, A)
				M.IgniteMob()
				to_chat(M, span_userdanger("Your skin bursts into flames!"))
				M.emote("scream")
			if(5)
				Firestacks_stage_5(M, A)
				M.IgniteMob()
				to_chat(M, span_userdanger("Your skin erupts into an inferno!"))
				M.emote("scream")
	return

/datum/symptom/fire/proc/Firestacks_stage_4(mob/living/M, datum/disease/advance/A)
<<<<<<< HEAD
	var/get_stacks = max((sqrtor0(20 + A.totalStageSpeed() * 2)) - (sqrtor0(16 + A.totalStealth())), 1)
	M.adjust_fire_stacks(get_stacks)
	M.adjustFireLoss(get_stacks * 0.5)
	return 1

/datum/symptom/fire/proc/Firestacks_stage_5(mob/living/M, datum/disease/advance/A)
	var/get_stacks = max((sqrtor0(20 + A.totalStageSpeed() * 3))-(sqrtor0(16 + A.totalStealth())), 1)
	M.adjust_fire_stacks(get_stacks)
	M.adjustFireLoss(get_stacks)
	return 1
=======
	M.adjust_fire_stacks(1 * power)
	M.take_overall_damage(burn = 2 * power)
	if(infective && !(A.spread_flags & DISEASE_SPREAD_FALTERED))
		M.visible_message(span_danger("[M] bursts into flames, spreading burning sparks about the area!"))
	return TRUE

/datum/symptom/fire/proc/Firestacks_stage_5(mob/living/M, datum/disease/advance/A)
	M.adjust_fire_stacks(3 * power)
	M.take_overall_damage(burn = 5 * power)
	if(infective && !(A.spread_flags & DISEASE_SPREAD_FALTERED))
		M.visible_message(span_danger("[M] bursts into flames, spreading burning sparks about the area!"))
	return TRUE
>>>>>>> 05b57277bf ([MIRROR] Faltered & Dormant diseases update (#10985))
