/*
//////////////////////////////////////

Confusion

	Little bit hidden.
	Lowers resistance.
	Decreases stage speed.
	Not very transmittable.
	Intense Level.

Bonus
	Makes the affected mob be confused for short periods of time.

//////////////////////////////////////
*/

/datum/symptom/confusion
	name = "Confusion"
	stealth = 1
	resistance = -1
	stage_speed = -3
	transmittable = 0
	level = 4
	severity = 2
<<<<<<< HEAD
=======
	base_message_chance = 25
	symptom_delay_min = 15 SECONDS
	symptom_delay_max = 30 SECONDS

	threshold_descs = list(
		"Transmission 6" = "Increases confusion duration.",
		"Stealth 4" = "The symptom remains hidden until active."
	)

	prefixes = list("Dizzy ")
	bodies = list("Ditz")

/datum/symptom/confusion/severityset(datum/disease/advance/A)
	. = ..()
	if(A.resistance >= 6)
		severity += 1

/datum/symptom/confusion/Start(datum/disease/advance/A)
	if(!..())
		return
	if(A.transmission >= 6)
		power = 1.5
	if(A.stealth >= 4)
		supress_warning = TRUE
>>>>>>> f9734b9232 ([MIRROR] Viruses now spawn with random names (#11082))

/datum/symptom/confusion/Activate(datum/disease/advance/A)
	..()
	if(prob(SYMPTOM_ACTIVATION_PROB))
		var/mob/living/carbon/M = A.affected_mob
		switch(A.stage)
			if(1, 2, 3, 4)
				to_chat(M, span_warning(pick("Your head hurts.", "Your mind blanks for a moment.")))
			else
				to_chat(M, span_userdanger("You can't think straight!"))
				M.AdjustConfused(rand(16, 200))

	return
