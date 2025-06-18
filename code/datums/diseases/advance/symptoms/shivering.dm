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
<<<<<<< HEAD
	severity = 2
=======
	severity = 0
	symptom_delay_min = 20 SECONDS
	symptom_delay_max = 40 SECONDS

	var/unsafe = FALSE

	threshold_descs = list(
		"Stage Speed 5" = "Increases cooling speed; The host can fall below safe temperature levels.",
		"Stage Speed 10" = "Further increases cooling speed."
	)

	bodies = list("Shiver")
	suffixes = list(" Shivers")

/datum/symptom/shivering/severityset(datum/disease/advance/A)
	. = ..()
	if(A.stage_rate >= 5)
		severity += 1
		if(A.stage_rate >= 10)
			severity += 1

/datum/symptom/shivering/Start(datum/disease/advance/A)
	if(!..())
		return
	if(A.stage_rate >= 5)
		power = 1.5
		unsafe = TRUE
		if(A.stage_rate >= 10)
			power = 2.5
>>>>>>> f9734b9232 ([MIRROR] Viruses now spawn with random names (#11082))

/datum/symptom/shivering/Activate(datum/disease/advance/A)
	..()
	if(prob(SYMPTOM_ACTIVATION_PROB))
		var/mob/living/L = A.affected_mob
		to_chat(L, span_warning(pick("You feel cold.", "You start shivering.")))
		if(L.bodytemperature > BODYTEMP_COLD_DAMAGE_LIMIT)
			Chill(L, A)
	return

/datum/symptom/shivering/proc/Chill(mob/living/M, datum/disease/advance/A)
	var/get_cold = (sqrtor0(16+A.totalStealth()*2))+(sqrtor0(21+A.totalResistance()*2))
	M.bodytemperature = max(M.bodytemperature - (get_cold * A.stage), BODYTEMP_COLD_DAMAGE_LIMIT + 1)
	return 1
