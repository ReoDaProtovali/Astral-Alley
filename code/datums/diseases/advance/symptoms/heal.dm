/*
//////////////////////////////////////

Healing

	Little bit hidden.
	Lowers resistance tremendously.
	Decreases stage speed tremendously.
	Decreases transmittablity temrendously.
	Fatal Level.

Bonus
	Heals toxins in the affected mob's blood stream.

//////////////////////////////////////
*/

/datum/symptom/heal
	name = "Toxic Filter"
	stealth = 1
	resistance = -4
	stage_speed = -4
	transmittable = -4
	level = 6
	severity = 0

/datum/symptom/heal/Activate(datum/disease/advance/A)
	..()
	if(prob(SYMPTOM_ACTIVATION_PROB * 10))
		var/mob/living/M = A.affected_mob
		switch(A.stage)
			if(4, 5)
				Heal(M, A)
	return

/datum/symptom/heal/proc/Heal(mob/living/M, datum/disease/advance/A)
	var/get_damage = max(0, (sqrtor0(20+A.totalStageSpeed())*(1+rand())))
	M.adjustToxLoss(-get_damage)
	return TRUE

/*
//////////////////////////////////////

Metabolism

	Little bit hidden.
	Lowers resistance.
	Decreases stage speed.
	Decreases transmittablity temrendously.
	High Level.

Bonus
	Cures all diseases (except itself) and creates anti-bodies for them until the symptom dies.

//////////////////////////////////////
*/

/datum/symptom/heal/metabolism
	name = "Anti-Bodies Metabolism"
	stealth = -1
	resistance = -1
	stage_speed = -1
	transmittable = -4
	level = 3
	severity = 0
	var/list/cured_diseases = list()

/datum/symptom/heal/metabolism/Heal(mob/living/M, datum/disease/advance/A)
	var/cured = 0
	for(var/thing in M.GetViruses())
		var/datum/disease/D = thing
		if(D.virus_heal_resistant)
			continue
		if(D != A)
			cured = TRUE
			cured_diseases += D.GetDiseaseID()
			D.cure()
	if(cured)
		to_chat(M, span_notice("You feel much better."))

/datum/symptom/heal/metabolism/End(datum/disease/advance/A)
	var/mob/living/M = A.affected_mob
	if(istype(M))
		if(length(cured_diseases))
			for(var/res in M.GetResistances())
				M.resistances -= res
		to_chat(M, span_warning("You feel weaker."))

/*
//////////////////////////////////////

<<<<<<< HEAD
Longevity

	Medium hidden boost.
	Large resistance boost.
	Large stage speed boost.
	Large transmittablity boost.
	High Level.

Bonus
	After a certain amount of time the symptom will cure itself.

//////////////////////////////////////
*/
=======
/datum/symptom/heal/water/CanHeal(datum/disease/advance/A, actual_power)

	var/mob/living/carbon/human/H = A.affected_mob

	if(H.fire_stacks < 0)
		H.adjust_fire_stacks(min(absorption_coeff, -H.fire_stacks))
		. += power
	if(H.ingested.has_reagent(REAGENT_ID_HOLYWATER))
		H.ingested.remove_reagent(REAGENT_ID_HOLYWATER, 0.5 * absorption_coeff)
		. += power * 0.75
	else if(H.ingested.has_reagent(REAGENT_ID_WATER))
		H.ingested.remove_reagent(REAGENT_ID_WATER, 0.5 * absorption_coeff)
		. += power * 0.5

/datum/symptom/heal/water/Heal(mob/living/carbon/human/H, datum/disease/advance/A, actual_power)
	if(!istype(H))
		return

	var/heal_amt = 2 * actual_power
>>>>>>> 485e9e4933 ([MIRROR] Fixes Tissue Hydration not working (#11304))

/datum/symptom/heal/longevity
	name = "Longevity"
	stealth = 3
	resistance = 4
	stage_speed = 4
	transmittable = 4
	level = 3
	severity = 0
	var/longevity = 30

/datum/symptom/heal/longevity/Heal(mob/living/M, datum/disease/advance/A)
	longevity -= 1
	if(!longevity)
		A.cure()

<<<<<<< HEAD
/datum/symptom/heal/longevity/Start(datum/disease/advance/A)
	longevity = rand(initial(longevity) - 5, initial(longevity) + 5)
=======
	if(prob(5))
		to_chat(H, span_notice("You feel yourself absorbing the water around you to soothe your damaged skin."))

	var/obj/item/organ/external/pickedpart

	for(var/bodypart in zone_list)
		pickedpart = H.get_organ(bodypart)
		if(pickedpart.burn_dam > 0 && !(pickedpart.robotic >= ORGAN_ROBOT))
			pickedpart.heal_damage(0, (heal_amt/zone_list.len))

	return TRUE
>>>>>>> 485e9e4933 ([MIRROR] Fixes Tissue Hydration not working (#11304))

/*
//////////////////////////////////////

	DNA Restoration

	Not well hidden.
	Lowers resistance minorly.
	Does not affect stage speed.
	Decreases transmittablity greatly.
	Very high level.

Bonus
	Heals clone damage, treats radiation.

//////////////////////////////////////
*/

/datum/symptom/heal/dna
	name = "Deoxyribonucleic Acid Restoration"
	stealth = -1
	resistance = -1
	stage_speed = 0
	transmittable = -3
	level = 5
	severity = 0

/datum/symptom/heal/dna/Heal(var/mob/living/carbon/M, var/datum/disease/advance/A)
	var/amt_healed = max(0, (sqrtor0(20+A.totalStageSpeed()*(3+rand())))-(sqrtor0(16+A.totalStealth()*rand())))
	M.adjustBrainLoss(-amt_healed)
	M.radiation = max(M.radiation - 3, 0)
	return TRUE
