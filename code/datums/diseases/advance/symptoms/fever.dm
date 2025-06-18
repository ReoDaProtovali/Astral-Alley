/*
//////////////////////////////////////

Fever

	No change to hidden.
	Increases resistance.
	Increases stage speed.
	Little transmittable.
	Low level.

Bonus
	Heats up your body.

//////////////////////////////////////
*/

/datum/symptom/fever
	name = "Fever"
	stealth = 0
	resistance = 3
	stage_speed = 3
	transmittable = 2
	level = 2
	severity = 2

<<<<<<< HEAD
/datum/symptom/fever/Activate(var/datum/disease/advance/A)
	..()
	if(prob(SYMPTOM_ACTIVATION_PROB))
		var/mob/living/carbon/M = A.affected_mob
=======
	var/unsafe = FALSE

	threshold_descs = list(
		"Resistance 5" = "Increases fever intensity, fever can overheat and harm the host.",
		"Resistance 10" = "Further increases fever intensity."
	)

	bodies = list("Fever")
	suffixes = list(" Fever")

/datum/symptom/fever/severityset(datum/disease/advance/A)
	. = ..()
	if(A.resistance >= 5)
		severity += 1
		prefixes = list("Desert")
		if(A.resistance >= 10)
			severity += 1
			prefixes = list("Volcanic")

/datum/symptom/fever/Start(datum/disease/advance/A)
	if(!..())
		return
	if(A.resistance >= 5)
		power = 1.5
		unsafe = TRUE
		if(A.resistance >= 10)
			power = 2.5

/datum/symptom/fever/Activate(datum/disease/advance/A)
	if(!..())
		return
	var/mob/living/carbon/M = A.affected_mob
	if(M.stat == DEAD)
		return
	if(!unsafe || A.stage < 4)
>>>>>>> f9734b9232 ([MIRROR] Viruses now spawn with random names (#11082))
		to_chat(M, span_warning(pick("You feel hot.", "You feel like you're burning.")))
		if(M.bodytemperature < BODYTEMP_HEAT_DAMAGE_LIMIT)
			Heat(M, A)

	return

/datum/symptom/fever/proc/Heat(var/mob/living/M, var/datum/disease/advance/A)
	var/get_heat = (sqrtor0(21+A.totalTransmittable()*2))+(sqrtor0(20+A.totalStageSpeed()*3))
	M.bodytemperature = min(M.bodytemperature + (get_heat * A.stage), BODYTEMP_HEAT_DAMAGE_LIMIT - 1)
	return TRUE
