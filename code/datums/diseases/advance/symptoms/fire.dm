/*
//////////////////////////////////////

Spontaneous Combustion

	Slightly hidden.
	Lowers resistance tremendously.
	Decreases stage tremendously.
	Decreases transmittablity tremendously.
	Fatal Level.

Bonus
	Ignites infected mob.

//////////////////////////////////////
*/

/datum/symptom/fire
	name = "Spontaneous Combustion"
	stealth = 1
<<<<<<< HEAD
	resistance = -4
	stage_speed = -4
	transmittable = -4
	level = 6
	severity = 5
=======
	resistance = -1
	stage_speed = -2
	transmission = -1
	level = 7
	severity = 4

	base_message_chance = 20
	symptom_delay_min = 40 SECONDS
	symptom_delay_max = 85 SECONDS

	var/infective = FALSE

	threshold_descs = list(
		"Stage Speed 4" = "Increases the intensity of the flames.",
		"Stage Speed 8" = "Further increases the intensity of the flames.",
		"Transmission 8" = "Host will spread the virus through skin flake when bursting into flames.",
		"Stealth 4" = "The symptom remains hidden until active."
	)

	prefixes = list("Burning ")
	bodies = list("Combustion")
	suffixes = list(" Combustion")

/datum/symptom/fire/Start(datum/disease/advance/A)
	if(!..())
		return
	if(A.stage_rate >= 4)
		power = 1.5
		if(A.stage_rate >= 8)
			power = 2
	if(A.stealth >= 4)
		supress_warning = TRUE
	if(A.transmission >= 8)
		infective = TRUE
>>>>>>> f9734b9232 ([MIRROR] Viruses now spawn with random names (#11082))

/datum/symptom/fire/Activate(datum/disease/advance/A)
	..()
	if(prob(SYMPTOM_ACTIVATION_PROB))
		var/mob/living/M = A.affected_mob
		switch(A.stage)
			if(3)
				to_chat(M, span_warning(pick("You feel hot.", "You hear a crackling noise.", "You smell smoke.")))
			if(4)
				Firestacks_stage_4(M, A)
				M.IgniteMob()
				to_chat(M, span_userdanger("Your skin bursts into flames!"))
				M.emote("scream")
			if(5)
				Firestacks_stage_5(M, A)
				M.IgniteMob()
				to_chat(M, span_userdanger("Your skin erupts into an inferno!"))
				M.emote("scream")
	return

/datum/symptom/fire/proc/Firestacks_stage_4(mob/living/M, datum/disease/advance/A)
	var/get_stacks = max((sqrtor0(20 + A.totalStageSpeed() * 2)) - (sqrtor0(16 + A.totalStealth())), 1)
	M.adjust_fire_stacks(get_stacks)
	M.adjustFireLoss(get_stacks * 0.5)
	return 1

/datum/symptom/fire/proc/Firestacks_stage_5(mob/living/M, datum/disease/advance/A)
	var/get_stacks = max((sqrtor0(20 + A.totalStageSpeed() * 3))-(sqrtor0(16 + A.totalStealth())), 1)
	M.adjust_fire_stacks(get_stacks)
	M.adjustFireLoss(get_stacks)
	return 1
