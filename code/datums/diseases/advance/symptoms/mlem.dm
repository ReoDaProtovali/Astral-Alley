/*
//////////////////////////////////////

Mlemingtong

	Not noticable or unnoticable.
	Resistant.
	Increases stage speed.
	Little transmittable.
	Low Level.

BONUS
	Mlem. Mlem. Mlem.

//////////////////////////////////////
*/

/datum/symptom/mlem
	name = "Mlemington"
	stealth = 0
	resistance = 3
	stage_speed = 3
	transmittable = 1
	level = 1
	severity = 1

<<<<<<< HEAD
=======
	var/infective = FALSE

	threshold_descs = list(
		"Resistance 5" = "The host may occasionally go on a mlemming spree.",
		"Transmission 8" = "The host will spread the virus through saliva when mlemming."
	)

	prefixes = list("Mlemington's ", "Licking-")
	bodies = list("Mlem", "Lick")

/datum/symptom/mlem/severityset(datum/disease/advance/A)
	. = ..()
	if(A.transmission >= 8)
		infective = TRUE
		severity += 1

/datum/symptom/mlem/Start(datum/disease/advance/A)
	if(!..())
		return
	if(A.resistance >= 5)
		power = 1.5

>>>>>>> f9734b9232 ([MIRROR] Viruses now spawn with random names (#11082))
/datum/symptom/itching/Activate(var/datum/disease/advance/A)
	..()
	if(prob(SYMPTOM_ACTIVATION_PROB))
		var/mob/living/M = A.affected_mob
		M.emote("mlem")
	return
