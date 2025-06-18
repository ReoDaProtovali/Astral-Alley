/*
//////////////////////////////////////

Overactve Adrenal Gland

	No change to stealth.
	Slightly decreases resistance.
	Increases stage speed.
	Decreases transmittablity considerably.
	Moderate Level.

Bonus
	The host produces hyperzine and gets very jittery

//////////////////////////////////////
*/

/datum/symptom/stimulant
	name = "Overactive Adrenal Gland"
	stealth = 0
	resistance = -1
	stage_speed = 2
	transmittable = -3
	level = 3
	severity = 1
<<<<<<< HEAD
=======
	symptom_delay_min = 1
	symptom_delay_max = 1

	var/clearacc = FALSE

	threshold_descs = list(
		"Resistance 8" = "This virus causes an even greater rate of nutriment loss, able to cause starvation, but it's energy gain greatly increases.",
		"Stage 8" = "The virus causes extreme nervousness and paranoia, resulting in occasional hallucinations, and extreme restlessness, but great overall energy."
	)

	prefixes = list("Gray ", "Amped ", "Nervous ")
	bodies = list("Hyper")

/datum/symptom/stimulant/severityset(datum/disease/advance/A)
	. = ..()
	if(A.resistance >= 8)
		severity -= 1
	if(A.stage_rate >= 8)
		severity -= 1
		prefixes = list("Gray ", "Amped ", "Paranoid ")
		suffixes = list(" Madness", " Insanity")

/datum/symptom/stimulant/Start(datum/disease/advance/A)
	if(!..())
		return
	power = initial(power)
	if(A.resistance >= 8)
		power += 2
	if(A.stage_rate >= 8)
		power += 1
		clearacc = TRUE
>>>>>>> f9734b9232 ([MIRROR] Viruses now spawn with random names (#11082))

/datum/symptom/stimulant/Activate(datum/disease/advance/A)
	..()

	if(prob(SYMPTOM_ACTIVATION_PROB))
		var/mob/living/L = A.affected_mob
		to_chat(L, span_notice("You feel a rush of energy inside you!"))
		switch(A.stage)
			if(1, 2)
				L.jitteriness += 5
			if(3, 4)
				L.jitteriness += 10
			else
				if(L.reagents.get_reagent_amount(REAGENT_ID_HYPERZINE) < 10)
					L.reagents.add_reagent(REAGENT_ID_HYPERZINE, 5)
				if(prob(30))
					L.jitteriness += 15
	return
