/datum/species
	var/crit_mod = 1
	var/list/env_traits = list()
	var/dirtslip = FALSE
	var/photosynthesizing = FALSE
	var/grows = FALSE
	var/shrinks = FALSE
	var/rad_levels = list("safe" = 2.5, "danger_1" = 50, "danger_2" = 75, "danger_3" = 150)
	var/rad_removal_mod = 1
	var/bite_mod = 1
	var/grab_resist_divisor_victims = 1
	var/grab_resist_divisor_self = 1
	var/grab_power_victims = 0
	var/grab_power_self = 0
	var/waking_speed = 1
	var/mudking = FALSE
	var/vanity_base_fit //when shapeshifting using vanity_copy_to, this allows you to have add something so they can go back to their original species fit
	var/lightweight_light = 0

/datum/species/handle_environment_special(var/mob/living/carbon/human/H)
	for(var/datum/trait/env_trait in env_traits)
		env_trait.handle_environment_special(H)
	return

/datum/species/proc/update_misc_tabs(var/mob/living/carbon/human/H)
	return
