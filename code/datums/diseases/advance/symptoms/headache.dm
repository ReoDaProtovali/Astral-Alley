/*
//////////////////////////////////////

Headache

	Noticable.
	Highly resistant.
	Increases stage speed.
	Not transmittable.
	Low Level.

BONUS
	Displays an annoying message.

//////////////////////////////////////
*/

/datum/symptom/headache
	name = "Headache"
	stealth = -1
	resistance = 4
	stage_speed = 2
	transmittable = 0
	level = 1
	severity = 1

<<<<<<< HEAD
/datum/symptom/headache/Activate(var/datum/disease/advance/A)
	..()
	if(prob(SYMPTOM_ACTIVATION_PROB))
		var/mob/living/M = A.affected_mob
		to_chat(M, span_warning(pick("Your head hurts.", "Your head starts pounding.")))
	return
=======
	threshold_descs = list(
		"Stage Speed 6" = "Headaches will cause severe pain, that weakens the host.",
		"Stage Speed 9" = "Headaches become less frequent but far more intense, preventing any action from the host.",
		"Stealth 4" = "Reduces headache frequency until later stages."
	)

	bodies = list("Skull", "Migraine")

/datum/symptom/headache/severityset(datum/disease/advance/A)
	. = ..()
	if(A.stage_rate >= 6)
		severity += 1
		if(A.stage_rate >= 9)
			severity += 1

/datum/symptom/headache/Start(datum/disease/advance/A)
	if(!..())
		return
	if(A.stealth >= 4)
		base_message_chance = 50
		if(A.stage_rate >= 6)
			power = 2
	if(A.stage_rate >= 9)
		symptom_delay_min = 30 SECONDS
		symptom_delay_max = 60 SECONDS
		power = 3

/datum/symptom/headache/Activate(datum/disease/advance/A)
	if(!..())
		return

	var/mob/living/M = A.affected_mob
	if(M.stat == DEAD)
		return
	if(power < 2)
		if(prob(base_message_chance) || A.stage >= 4)
			to_chat(M, span_warning(pick("Your head hurts.", "Your head pounds.")))
	if(power >= 2 && A.stage >= 4)
		to_chat(M, span_danger(pick("Your head hurts a lot.", "Your head pounds incessantly.")))
		M.Weaken(10)
	if(power >= 3 && A.stage >= 5)
		to_chat(M, span_userdanger(pick("Your head hurts!", "You feel a burning knife inside your brain!", "A wave of pain fills your brain!")))
		M.Stun(15)
>>>>>>> f9734b9232 ([MIRROR] Viruses now spawn with random names (#11082))
