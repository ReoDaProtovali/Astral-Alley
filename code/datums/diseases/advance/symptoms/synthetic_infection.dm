/*
//////////////////////////////////////

Synthetic Infection

	Slightly hidden.
	Increases resistance.
	Doesn't increase stage speed.
	Slightly transmittable.
	High Level.

Bonus
	Allows the disease to infect synthetics

//////////////////////////////////////
*/

/datum/symptom/infect_synthetics
<<<<<<< HEAD
    name = "Synthetic Infection"
    stealth = 1
    resistance = 2
    stage_speed = 0
    transmittable = 1
    level = 5
    severity = 3
=======
	name = "Synthetic Infection"
	stealth = 1
	resistance = 2
	stage_speed = 0
	transmission = 1
	level = 5
	severity = 3
>>>>>>> 5193d70d2b ([MIRROR] Virology Update #3 (#10690))

/datum/symptom/infect_synthetics/Start(datum/disease/advance/A)
	A.infect_synthetics = TRUE

/datum/symptom/infect_synthetics/End(datum/disease/advance/A)
	A.infect_synthetics = FALSE
