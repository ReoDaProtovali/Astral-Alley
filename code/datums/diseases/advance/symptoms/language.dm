/*
//////////////////////////////////////

Lingual Disocation

	Improves stealth.
	Increases resistance.
	Decreases stage speed.
	Slightly decreases transmissibility.
	Moderate Level.

Bonus
	Randomly changes the language of the mob.

//////////////////////////////////////
*/

/datum/symptom/language
	name = "Lingual Disocation"
	stealth = 3
	resistance = 2
	stage_speed = -2
	transmittable = -1
	level = 3
	severity = 1
<<<<<<< HEAD
=======
	symptom_delay_min = 20 SECONDS
	symptom_delay_max = 50 SECONDS

	var/gibberish = FALSE

	threshold_descs = list(
		"Resistance 5" = "The host might end up speaking a completely made up language."
	)

	prefixes = list("Babel's ", "Tongue-Twisting ")
	bodies = list("Tongue", "Language")

/datum/symptom/language/Start(datum/disease/advance/A)
	if(!..())
		return
	if(A.resistance)
		gibberish = TRUE
>>>>>>> f9734b9232 ([MIRROR] Viruses now spawn with random names (#11082))

/datum/symptom/language/Activate(var/datum/disease/advance/A)
	..()
	if(prob(SYMPTOM_ACTIVATION_PROB))
		var/mob/living/carbon/human/H = A.affected_mob
		H.apply_default_language(pick(H.languages))
	return
