/*
//////////////////////////////////////

Spyndrome

	Slightly hidden.
	No change to resistance.
	Increases stage speed.
	Little transmittable.
	Low Level.

BONUS
	Makes the host spin.

//////////////////////////////////////
*/

/datum/symptom/spyndrome
	name = "Spyndrome"
	stealth = 2
	resistance = 0
	stage_speed = 3
	transmittable = 1
	level = 1
	severity = 0

/datum/symptom/spyndrome/Activate(var/datum/disease/advance/A)
	..()

<<<<<<< HEAD
	if(prob(SYMPTOM_ACTIVATION_PROB))
		if(A.affected_mob.buckled())
			to_chat(viewers(A.affected_mob), span_warning("[A.affected_mob.name] struggles violently against their restraints!"))
=======
	prefixes = list("Spinning ", "Rotatory ")
	bodies = list("Rotato")

/datum/symptom/spyndrome/Start(datum/disease/advance/A)
	if(!..())
		return
	if(A.resistance >= 6)
		bigspin = TRUE

/datum/symptom/spyndrome/Activate(datum/disease/advance/A)
	if(!..())
		return
	var/mob/living/M = A.affected_mob
	switch(A.stage)
		if(1, 2, 3)
			if(prob(base_message_chance))
				to_chat(M, span_notice("You can't stand still."))
>>>>>>> f9734b9232 ([MIRROR] Viruses now spawn with random names (#11082))
		else
			to_chat(viewers(A.affected_mob), span_warning("[A.affected_mob.name] spins around violently!"))
			A.affected_mob.emote("spin")
	return
