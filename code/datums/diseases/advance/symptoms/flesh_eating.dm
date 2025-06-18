/*
//////////////////////////////////////

Necrotizing Fasciitis (AKA Flesh-Eating Disease)

	Very very noticable.
	Lowers resistance tremendously.
	No changes to stage speed.
	Decreases transmittablity tremendously.
	Fatal Level.

Bonus
	Deals brute damage over time.

//////////////////////////////////////
*/

/datum/symptom/flesh_eating
	name = "Necrotizing Fasciitis"
	stealth = -3
	resistance = -4
	stage_speed = 0
<<<<<<< HEAD
	transmittable = -4
	level = 6
	severity = 5
=======
	transmission = -1
	level = 7
	severity = 4
	base_message_chance = 50
	symptom_delay_min = 20 SECONDS
	symptom_delay_max = 60 SECONDS

	var/bleed = FALSE
	var/damage = FALSE

	threshold_descs = list(
		"Resistance 10" = "The host takes brute damage as their flesh is burst open.",
		"Transmission 8" = "The host will bleed far more violently, loosing even more blood, and spraying infected blood everywhere."
	)

	prefixes = list("Bloody ", "Hemo")
	bodies = list("Hemophilia")

/datum/symptom/flesh_eating/Start(datum/disease/advance/A)
	if(!..())
		return
	if(A.resistance >= 10)
		damage = TRUE
	if(A.transmission >= 8)
		power = 2
		bleed = TRUE
>>>>>>> f9734b9232 ([MIRROR] Viruses now spawn with random names (#11082))

/datum/symptom/flesh_eating/Activate(datum/disease/advance/A)
	..()
	if(prob(SYMPTOM_ACTIVATION_PROB))
		var/mob/living/M = A.affected_mob
		switch(A.stage)
			if(2,3)
				to_chat(M, span_warning(pick("You feel a sudden pain across your body.", "Drops of blood appear suddenly on your skin.")))
			if(4,5)
				to_chat(M, span_userdanger(pick("You cringe as a violent pain takes over your body.", "It feels like your body is eating itself inside out.", "IT HURTS.")))
				Flesheat(M, A)
	return

/datum/symptom/flesh_eating/proc/Flesheat(mob/living/M, datum/disease/advance/A)
	var/get_damage = ((sqrtor0(16-A.totalStealth()))*5)
	M.adjustBruteLoss(get_damage)
	return 1
