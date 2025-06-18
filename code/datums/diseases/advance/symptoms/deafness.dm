/*
//////////////////////////////////////

Deafness

	Slightly hidden.
	Lowers resistance.
	Increases stage speed slightly.
	Decreases transmittablity.
	Intense Level.

Bonus
	Causes intermittent loss of hearing.

//////////////////////////////////////
*/

/datum/symptom/deafness
	name = "Deafness"
	stealth = 1
	resistance = -2
	stage_speed = 1
	transmittable = -3
	level = 4
	severity = 3

/datum/symptom/deafness/Activate(datum/disease/advance/A)
	..()
	if(prob(SYMPTOM_ACTIVATION_PROB))
		var/mob/living/M = A.affected_mob

<<<<<<< HEAD
		switch(A.stage)
			if(3, 4)
				to_chat(M, span_warning("[pick("you hear a ringing in your ear.", "You ears pop.")]"))
			if(5)
				to_chat(M, span_userdanger("You ear pop and begin ringing loudly!"))
				M.ear_deaf += 20
	return
=======
	prefixes = list("Aural ")
	bodies = list("Ear")

/datum/symptom/deafness/severityset(datum/disease/advance/A)
	. = ..()
	if(A.resistance >= 9)
		severity += 1

/datum/symptom/deafness/Start(datum/disease/advance/A)
	if(!..())
		return
	if(A.stealth >= 4)
		supress_warning = TRUE
	if(A.resistance >= 9)
		power = 2

/datum/symptom/deafness/Activate(var/datum/disease/advance/A)
	if(!..())
		return
	var/mob/living/carbon/M = A.affected_mob
	if(M.stat == DEAD)
		return
	switch(A.stage)
		if(3, 4)
			if(prob(base_message_chance) && !supress_warning)
				to_chat(M, span_warning(pick("You hear a ringing in your ears.", "Your ears pop.")))
		if(5)
			if(power >= 2)
				M.adjustEarDamage(100, 10)
				to_chat(M, span_userdanger("Your ears pop painfully and start bleeding!"))
				M.emote("scream")
			else
				to_chat(M, span_userdanger("Your ears pop and begin ringing loudly!"))
				M.adjustEarDamage(0, 10)
>>>>>>> f9734b9232 ([MIRROR] Viruses now spawn with random names (#11082))
