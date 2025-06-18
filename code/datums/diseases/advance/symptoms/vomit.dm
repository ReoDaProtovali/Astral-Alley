/*
//////////////////////////////////////

Vomiting

	Noticeable.
	No change to resistance.
	Slightly increases stage speed.
	Increases transmissibility.
	Medium Level.

Bonus
	Forces the affected mob to vomit

//////////////////////////////////////
*/

/datum/symptom/vomit
	name = "Vomiting"
	stealth = -2
	resistance = 0
	stage_speed = 1
	transmittable = 2
	level = 3
	severity = 1
<<<<<<< HEAD
=======
	base_message_chance = 100
	symptom_delay_min = 20 SECONDS
	symptom_delay_max = 60 SECONDS

	var/vomit_blood = FALSE
	var/proj_vomit = 1

	threshold_descs = list(
		"Stage Speed 5" = "Host will vomit blood.",
		"Transmission 6" = "Host will projectile vomit, increasing vomit range.",
		"Stealth 4" = "The symptom remans hidden until active."
	)

	prefixes = list("Digestive ")
	bodies = list("Vomit")
	suffixes = list(" Emission")

/datum/symptom/vomit/Start(datum/disease/advance/A)
	if(!..())
		return
	if(A.stealth >= 4)
		supress_warning = FALSE
	if(A.stage_rate >= 5)
		vomit_blood = TRUE
	if(A.transmission >= 6)
		proj_vomit = 5
>>>>>>> f9734b9232 ([MIRROR] Viruses now spawn with random names (#11082))

/datum/symptom/vomit/Activate(datum/disease/advance/A)
	if(!..())
		return
	var/mob/living/M = A.affected_mob
	if(prob(2))
		to_chat(M, span_warning(pick("you feel nauseated.", "You feel like you're going to throw up!")))
	if(prob(SYMPTOM_ACTIVATION_PROB))
		M.vomit()
