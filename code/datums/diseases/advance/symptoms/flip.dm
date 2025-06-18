/*
//////////////////////////////////////

Flippinov

	Slightly hidden.
	No change to resistance.
	Increases stage speed.
	Little transmittable.
	Low Level.

BONUS
	Makes the host FLIP.

//////////////////////////////////////
*/

/datum/symptom/spyndrome
	name = "Flippinov"
	stealth = 2
	resistance = 0
	stage_speed = 3
	transmittable = 1
	level = 1
	severity = 0

<<<<<<< HEAD
/datum/symptom/spyndrome/Activate(datum/disease/advance/A)
	..()

	if(prob(SYMPTOM_ACTIVATION_PROB))
		var/mob/living/L = A.affected_mob
		L.emote("flip")
=======
	prefixes = list("Acrobat's ", "Flippin' ")
	bodies = list("Flip")

/datum/symptom/flip/Activate(datum/disease/advance/A)
	if(!..())
		return
	var/mob/living/M = A.affected_mob
	M.emote("flip")
>>>>>>> f9734b9232 ([MIRROR] Viruses now spawn with random names (#11082))
