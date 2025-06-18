/*
//////////////////////////////////////

Hyphema (Eye bleeding)

	Slightly noticable.
	Lowers resistance tremendously.
	Decreases stage speed tremendously.
	Decreases transmittablity.
	Critical Level.

Bonus
	Causes blindness.

//////////////////////////////////////
*/

/datum/symptom/visionloss
	name = "Hyphema"
	stealth = -1
	resistance = -4
	stage_speed = -4
<<<<<<< HEAD
	transmittable = -3
	level = 5
	severity = 4
=======
	transmission = -2
	level = 3
	severity = 2
	base_message_chance = 50
	symptom_delay_min = 30 SECONDS
	symptom_delay_max = 80 SECONDS

	var/remove_eyes = FALSE

	threshold_descs = list(
		"Resistance 12" = "Weakens extraocular muscles, eventually leading to complete detachment of the eyes.",
		"Stealth 4" = "The symptom remains hidden until active."
	)

	prefixes = list("Eye ")
	bodies = list("Blind")
	suffixes = list(" Blindness")

/datum/symptom/visionloss/severityset(datum/disease/advance/A)
	. = ..()
	if(A.resistance >= 12)
		severity += 1

/datum/symptom/visionloss/Start(datum/disease/advance/A)
	if(!..())
		return
	if(A.stealth >= 4)
		supress_warning = TRUE
	if(A.resistance >= 12)
		remove_eyes = TRUE
>>>>>>> f9734b9232 ([MIRROR] Viruses now spawn with random names (#11082))

/datum/symptom/visionloss/Activate(datum/disease/advance/A)
	..()
	if(prob(SYMPTOM_ACTIVATION_PROB))
		if(iscarbon(A))
			var/mob/living/carbon/M = A.affected_mob
			var/obj/item/organ/internal/eyes/eyes = M.internal_organs_by_name[O_EYES]
			if(!eyes)
				return
			switch(A.stage)
				if(1, 2)
					to_chat(M, span_warning("Your eyes itch."))
				if(3, 4)
					to_chat(M, span_boldwarning("Your eyes burn!"))
					M.eye_blurry = 20
					eyes.take_damage(1)
				else
					to_chat(M, span_userdanger("Your eyes burn horrificly!"))
					M.eye_blurry = 40
					eyes.take_damage(5)
					if(eyes.damage >= 10)
						M.disabilities |= NEARSIGHTED
						if(prob(eyes.damage - 10 + 1))
							if(!M.eye_blind)
								to_chat(M, span_userdanger("You go blind!"))
								M.Blind(20)
