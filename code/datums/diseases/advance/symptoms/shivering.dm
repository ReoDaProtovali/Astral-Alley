/*
//////////////////////////////////////

Shivering

	No change to hidden.
	Increases resistance.
	Increases stage speed.
	Little transmittable.
	Low level.

Bonus
	Cools down your body.

//////////////////////////////////////
*/

/datum/symptom/shivering
	name = "Shivering"
	stealth = 0
	resistance = 2
	stage_speed = 2
	transmittable = 2
	level = 2
	severity = 2

/datum/symptom/shivering/Activate(datum/disease/advance/A)
<<<<<<< HEAD
	..()
	if(prob(SYMPTOM_ACTIVATION_PROB))
		var/mob/living/L = A.affected_mob
		to_chat(L, span_warning(pick("You feel cold.", "You start shivering.")))
		if(L.bodytemperature > BODYTEMP_COLD_DAMAGE_LIMIT)
			Chill(L, A)
	return
=======
	if(!..())
		return
	var/mob/living/carbon/M = A.affected_mob
	if(M.stat == DEAD)
		return
	if(!unsafe || A.stage < 4)
		to_chat(M, span_warning(pick("You feel cold.", "You shiver.")))
	else
		to_chat(M, span_userdanger(pick("You feel your blood run cold.", "You feel ice in your veins.", "You feel like you can't heat up.", "You shiver violently.")))
		set_body_temp(M, A)
>>>>>>> d1c0c3ee0d ([MIRROR] Virology fixes (#11500))

/datum/symptom/shivering/proc/Chill(mob/living/M, datum/disease/advance/A)
	var/get_cold = (sqrtor0(16+A.totalStealth()*2))+(sqrtor0(21+A.totalResistance()*2))
	M.bodytemperature = max(M.bodytemperature - (get_cold * A.stage), BODYTEMP_COLD_DAMAGE_LIMIT + 1)
	return 1
