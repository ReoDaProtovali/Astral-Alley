<<<<<<< HEAD
/datum/species
	var/bite_mod = 1
	var/grab_resist_divisor_victims = 1
	var/grab_resist_divisor_self = 1
	var/grab_power_victims = 0
	var/grab_power_self = 0
	var/waking_speed = 1
	var/lightweight_light = 0

/datum/species/handle_environment_special(var/mob/living/carbon/human/H)
	for(var/datum/trait/env_trait in env_traits)
		env_trait.handle_environment_special(H)
	return
=======
/datum/species/can_shred(var/mob/living/carbon/human/H, var/ignore_intent)
	if(!ignore_intent && H.a_intent != I_HURT)
		return FALSE
	if(H.get_feralness())
		return TRUE
	return ..()
>>>>>>> 7fc7952b83 (Various character-related changes (#11111))
