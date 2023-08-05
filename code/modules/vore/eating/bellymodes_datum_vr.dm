GLOBAL_LIST_INIT(digest_modes, list())

/datum/digest_mode
	var/id = DM_HOLD
	var/noise_chance = 0

/**
 * This proc has all the behavior for the given digestion mode.
 * It returns either null, or an associative list in the following format:
 * list("to_update" = TRUE/FALSE, "soundToPlay" = sound())
 * where to_update is whether or not a updateVorePanel() call is necessary,
 * and soundToPlay will play the given sound at the end of the process tick.
 */
/datum/digest_mode/proc/process_mob(obj/belly/B, mob/living/L)
	return null

/datum/digest_mode/proc/handle_atoms(obj/belly/B, list/touchable_atoms)
    return FALSE

/datum/digest_mode/digest
	id = DM_DIGEST
	noise_chance = 50

/datum/digest_mode/digest/process_mob(obj/belly/B, mob/living/L)
	var/oldstat = L.stat
	//Pref protection!
	if(!L.digestable || L.absorbed)
		return null

	//Person just died in guts!
	if(L.stat == DEAD)
		if(!L.digestion_in_progress) //CHOMPEdit Start
			if(L.is_preference_enabled(/datum/client_preference/digestion_noises))
				if(!B.fancy_vore)
					SEND_SOUND(L, sound(get_sfx("classic_death_sounds")))
				else
					SEND_SOUND(L, sound(get_sfx("fancy_death_prey")))
			B.handle_digestion_death(L)
			if(!B.fancy_vore)
				return list("to_update" = TRUE, "soundToPlay" = sound(get_sfx("classic_death_sounds")))
			return list("to_update" = TRUE, "soundToPlay" = sound(get_sfx("fancy_death_pred")))
		else
			B.handle_digestion_death(L)
	if(!L)
		return //CHOMPEdit End

		//CHOMPEDIT: Parasitic digestion immunity hook, used to be a synx istype check but this is more optimized.
	if(L.parasitic)
		if(isliving(L))
			var/paratox = B.digest_brute+B.digest_burn
			B.owner.adjust_nutrition(-paratox)
			L.adjust_nutrition(paratox)
			L.adjustBruteLoss(-paratox*2) //Should automaticaly clamp to 0
			L.adjustFireLoss(-paratox*2) //Should automaticaly clamp to 0
			if(B.health_impacts_size) //CHOMPEdit - Health probably changed so...
				B.owner.update_fullness() //CHOMPEdit - This is run whenever a belly's contents are changed.
			return

 		//CHOMPedit end

	// Deal digestion damage (and feed the pred)
	var/old_health = L.health; //CHOMPEdit - Store old health for the hard crit calculation
	var/old_brute = L.getBruteLoss()
	var/old_burn = L.getFireLoss()
	var/old_oxy = L.getOxyLoss()
	var/old_tox = L.getToxLoss()
	var/old_clone = L.getCloneLoss()
	L.adjustBruteLoss(B.digest_brute)
	L.adjustFireLoss(B.digest_burn)
	L.adjustOxyLoss(B.digest_oxy)
	L.adjustToxLoss(B.digest_tox)
	L.adjustCloneLoss(B.digest_clone)
	//CHOMPEdit start - Send a message when a prey-thing enters hard crit.
	if(iscarbon(L) && old_health > 0 && L.health <= 0)
		to_chat(B.owner, "<span class='notice'>You feel [L] go still within your [lowertext(B.name)].</span>")
	//CHOMPEdit end
	var/actual_brute = L.getBruteLoss() - old_brute
	var/actual_burn = L.getFireLoss() - old_burn
	var/actual_oxy = L.getOxyLoss() - old_oxy
	var/actual_tox = L.getToxLoss() - old_tox
	var/actual_clone = L.getCloneLoss() - old_clone
	var/damage_gain = (actual_brute + actual_burn + actual_oxy/2 + actual_tox + actual_clone*2)*(B.nutrition_percent / 100)
	if(B.slow_digestion) //CHOMPEdit Start
		damage_gain = damage_gain * 0.5
	var/offset = (1 + ((L.weight - 137) / 137)) // 130 pounds = .95 140 pounds = 1.02
	var/difference = B.owner.size_multiplier / L.size_multiplier
	if(B.health_impacts_size) //CHOMPEdit - Health probably changed so...
		B.owner.update_fullness() //CHOMPEdit - This is run whenever a belly's contents are changed.
	/*if(isrobot(B.owner)) //CHOMPEdit: Borgos can now use nutrition too
		if(B.reagent_mode_flags & DM_FLAG_REAGENTSDIGEST && B.reagents.total_volume < B.reagents.maximum_volume) //digestion producing reagents
			var/mob/living/silicon/robot/R = B.owner
			R.cell.charge += 20*damage_gain
			B.digest_nutri_gain += offset * (1.5 * damage_gain / difference)
			B.GenerateBellyReagents_digesting()
		else
			var/mob/living/silicon/robot/R = B.owner
			R.cell.charge += 25*damage_gain */
	if(offset && damage_gain > 0) // If any different than default weight, multiply the % of offset.
		if(B.reagent_mode_flags & DM_FLAG_REAGENTSDIGEST && B.reagents.total_volume < B.reagents.maximum_volume) //digestion producing reagents
			B.owner.adjust_nutrition(offset * (3 * damage_gain / difference) * L.get_digestion_nutrition_modifier() * B.owner.get_digestion_efficiency_modifier()) //Uncertain if balanced fairly, can adjust by multiplier for the cost of reagent, dont go below 1 or else it will result in more nutrition than normal - Jack
			B.digest_nutri_gain += offset * (1.5 * damage_gain / difference) * L.get_digestion_nutrition_modifier() * B.owner.get_digestion_efficiency_modifier() //for transfering nutrition value over to GenerateBellyReagents_digesting()
			B.GenerateBellyReagents_digesting()
		else
			B.owner.adjust_nutrition(offset * (4.5 * damage_gain / difference) * L.get_digestion_nutrition_modifier() * B.owner.get_digestion_efficiency_modifier()) //4.5 nutrition points per health point. Normal same size 100+100 health prey with average weight would give 900 points if the digestion was instant. With all the size/weight offset taxes plus over time oxyloss+hunger taxes deducted with non-instant digestion, this should be enough to not leave the pred starved.
	else
		B.owner.adjust_nutrition(offset * (4.5 * damage_gain / difference) * L.get_digestion_nutrition_modifier() * B.owner.get_digestion_efficiency_modifier()) //CHOMPEdit End
	if(L.stat != oldstat)
		return list("to_update" = TRUE)

/datum/digest_mode/absorb
	id = DM_ABSORB
	noise_chance = 10

/datum/digest_mode/absorb/process_mob(obj/belly/B, mob/living/L)
	if(!L.absorbable || L.absorbed)
		return null
	B.steal_nutrition(L)
	if(L.nutrition < 100)
		B.absorb_living(L)
		if(B.reagent_mode_flags & DM_FLAG_REAGENTSABSORB && B.reagents.total_volume < B.reagents.maximum_volume) //CHOMPedit: absorption reagent production
			B.GenerateBellyReagents_absorbed() //CHOMPedit end: A bonus for pred, I know for a fact prey is usually at zero nutrition when absorption finally happens
		return list("to_update" = TRUE)

/datum/digest_mode/unabsorb
	id = DM_UNABSORB

/datum/digest_mode/unabsorb/process_mob(obj/belly/B, mob/living/L)
	if(L.absorbed && B.owner.nutrition >= 100)
		B.owner.adjust_nutrition(-100)
		B.unabsorb_living(L)
		return list("to_update" = TRUE)

/datum/digest_mode/drain
	id = DM_DRAIN
	noise_chance = 10

/datum/digest_mode/drain/process_mob(obj/belly/B, mob/living/L)
	B.steal_nutrition(L)

/datum/digest_mode/drain/shrink
	id = DM_SHRINK

/datum/digest_mode/drain/shrink/process_mob(obj/belly/B, mob/living/L)
	if(L.size_multiplier > B.shrink_grow_size)
		L.resize(L.size_multiplier - 0.01) // Shrink by 1% per tick
		if(L.size_multiplier <= B.shrink_grow_size) //CHOMPEdit - Adds some feedback so the pred knows their prey has stopped shrinking.
			to_chat(B.owner, "<span class='notice'>You feel [L] get as small as you would like within your [lowertext(B.name)].</span>")
		B.owner.update_fullness() //CHOMPEdit - This is run whenever a belly's contents are changed.
		. = ..()

/datum/digest_mode/grow
	id = DM_GROW
	noise_chance = 10

/datum/digest_mode/grow/process_mob(obj/belly/B, mob/living/L)
	if(L.size_multiplier < B.shrink_grow_size)
		L.resize(L.size_multiplier + 0.01) // Shrink by 1% per tick
		if(L.size_multiplier >= B.shrink_grow_size) //CHOMPEdit - Adds some feedback so the pred knows their prey has stopped growing.
			to_chat(B.owner, "<span class='notice'>You feel [L] get as big as you would like within your [lowertext(B.name)].</span>")
		B.owner.update_fullness() //CHOMPEdit - This is run whenever a belly's contents are changed.

/datum/digest_mode/drain/sizesteal
	id = DM_SIZE_STEAL

/datum/digest_mode/drain/sizesteal/process_mob(obj/belly/B, mob/living/L)
	if(L.size_multiplier > B.shrink_grow_size && B.owner.size_multiplier < 2) //Grow until either pred is large or prey is small.
		B.owner.resize(B.owner.size_multiplier + 0.01) //Grow by 1% per tick.
		if(B.owner.size_multiplier >= 2) //CHOMPEdit - Adds some feedback so the pred knows they can't grow anymore.
			to_chat(B.owner, "<span class='notice'>You feel you have grown as much as you can.</span>")
		L.resize(L.size_multiplier - 0.01) //Shrink by 1% per tick
		if(L.size_multiplier <= B.shrink_grow_size) //CHOMPEdit - Adds some feedback so the pred knows their prey has stopped shrinking.
			to_chat(B.owner, "<span class='notice'>You feel [L] get as small as you would like within your [lowertext(B.name)].</span>")
		B.owner.update_fullness() //CHOMPEdit - This is run whenever a belly's contents are changed.
		. = ..()

/datum/digest_mode/heal
	id = DM_HEAL
	noise_chance = 50 //Wet heals! The secret is you can leave this on for gurgle noises for fun.

/datum/digest_mode/heal/process_mob(obj/belly/B, mob/living/L)
	var/oldstat = L.stat
	if(L.stat == DEAD)
		return null // Can't heal the dead with healbelly
	var/mob/living/carbon/human/H = L
	if(B.owner.nutrition > 90 && H.isSynthetic())
		for(var/obj/item/organ/external/E in H.organs) //Needed for healing prosthetics
			var/obj/item/organ/external/O = E
			if(O.brute_dam > 0 || O.burn_dam > 0) //Making sure healing continues until fixed.
				O.heal_damage(0.5, 0.5, 0, 1) // Less effective healing as able to fix broken limbs
				B.owner.adjust_nutrition(-5)  // More costly for the pred, since metals and stuff
				if(B.health_impacts_size) //CHOMPEdit - Health probably changed so...
					B.owner.update_fullness() //CHOMPEdit - This is run whenever a belly's contents are changed.
			if(L.health < L.maxHealth)
				L.adjustToxLoss(-2)
				L.adjustOxyLoss(-2)
				L.adjustCloneLoss(-1)
				B.owner.adjust_nutrition(-1)  // Normal cost per old functionality
				if(B.health_impacts_size) //CHOMPEdit - Health probably changed so...
					B.owner.update_fullness() //CHOMPEdit - This is run whenever a belly's contents are changed.
	if(B.owner.nutrition > 90 && (L.health < L.maxHealth) && !H.isSynthetic())
		L.adjustBruteLoss(-2.5)
		L.adjustFireLoss(-2.5)
		L.adjustToxLoss(-5)
		L.adjustOxyLoss(-5)
		L.adjustCloneLoss(-1.25)
		B.owner.adjust_nutrition(-2)
		if(B.health_impacts_size) //CHOMPEdit - Health probably changed so...
			B.owner.update_fullness() //CHOMPEdit - This is run whenever a belly's contents are changed.
		if(L.nutrition <= 400)
			L.adjust_nutrition(1)
	else if(B.owner.nutrition > 90 && (L.nutrition <= 400))
		B.owner.adjust_nutrition(-1)
		L.adjust_nutrition(1)
	if(L.stat != oldstat)
		return list("to_update" = TRUE)

// E G G
/datum/digest_mode/egg
	id = DM_EGG
/*
/datum/digest_mode/egg/process_mob(obj/belly/B, mob/living/carbon/human/H)
	if(!istype(H) || H.stat == DEAD || H.absorbed)
		return null
	B.put_in_egg(H, 1)*/

/datum/digest_mode/egg/handle_atoms(obj/belly/B, list/touchable_atoms)
	if(B.egg_cycles < 10) //CHOMPEdit Start
		B.egg_cycles ++
		return
	B.egg_cycles = 0
	var/list/egg_contents = list()
	for(var/E in touchable_atoms)
		if(istype(E, /obj/item/weapon/storage/vore_egg)) // Don't egg other eggs.
			var/obj/item/weapon/storage/vore_egg/EG = E
			if(EG.egg_name != B.egg_name)
				if(!B.egg_name)
					EG.egg_name = null
					EG.name = initial(EG.name)
				else
					EG.egg_name = B.egg_name
					EG.name = B.egg_name
			continue
		if(isliving(E))
			var/mob/living/L = E
			if(L.absorbed)
				continue
			egg_contents += L
		if(isitem(E))
			egg_contents += E
	if(egg_contents.len)
		if(!B.ownegg)
			if(B.egg_type in tf_vore_egg_types)
				B.egg_path = tf_vore_egg_types[B.egg_type]
			B.ownegg = new B.egg_path(B)
			if(B.ownegg && B.egg_name)
				B.ownegg.egg_name = B.egg_name
				B.ownegg.name = B.egg_name
		var/scale_clamp = 1
		for(var/atom/movable/C in egg_contents)
			if(isitem(C) && egg_contents.len == 1) //Only egging one item
				var/obj/item/I = C
				B.ownegg.w_class = I.w_class
				B.ownegg.max_storage_space = B.ownegg.w_class
				I.forceMove(B.ownegg)
				B.ownegg.icon_scale_x = 0.2 * B.ownegg.w_class
				B.ownegg.icon_scale_y = 0.2 * B.ownegg.w_class
				B.ownegg.update_transform()
				egg_contents -= I
				B.ownegg = null
				return list("to_update" = TRUE)
			if(isitem(C))
				var/obj/item/I = C
				B.ownegg.w_class += I.w_class //Let's assume a regular outfit can reach total w_class of 16.
				I.forceMove(B.ownegg)
			if(isliving(C))
				var/mob/living/M = C
				var/mob_holder_type = M.holder_type || /obj/item/weapon/holder
				B.ownegg.w_class += M.size_multiplier * 4 //Egg size and weight scaled to match occupant.
				if(M.size_multiplier > scale_clamp)
					scale_clamp = M.size_multiplier
				var/obj/item/weapon/holder/H = new mob_holder_type(B.ownegg, M)
				B.ownegg.max_storage_space = H.w_class
				//B.ownegg.icon_scale_x = 0.25 * B.ownegg.w_class
				//B.ownegg.icon_scale_y = 0.25 * B.ownegg.w_class
				//B.ownegg.update_transform()
				egg_contents -= M
				//if(B.ownegg.w_class > 4)
				//	B.ownegg.slowdown = B.ownegg.w_class - 4
				//B.ownegg = null
				//return list("to_update" = TRUE)
		B.ownegg.calibrate_size()
		B.ownegg.orient2hud()
		B.ownegg.w_class = clamp(B.ownegg.w_class * 0.25, 1, 8) //A total w_class of 16 will result in a backpack sized egg.
		B.ownegg.icon_scale_x = clamp(0.25 * B.ownegg.w_class, 0.25, scale_clamp)
		B.ownegg.icon_scale_y = clamp(0.25 * B.ownegg.w_class, 0.25, scale_clamp)
		B.ownegg.update_transform()
		if(B.ownegg.w_class > 4)
			B.ownegg.slowdown = 4 //CHOMPEdit End
		B.ownegg = null
		return list("to_update" = TRUE)
	return

/datum/digest_mode/selective //unselectable, "smart" digestion mode for mobs only
	id = DM_SELECT
	noise_chance = 50


/datum/digest_mode/selective/process_mob(obj/belly/B, mob/living/L)
	var/datum/digest_mode/tempmode = GLOB.digest_modes[DM_HOLD]			// Default to Hold in case of big oof fallback
	//if not absorbed, see if they're food
	switch(L.selective_preference)										// First, we respect prey prefs
		if(DM_DIGEST)
			if(L.digestable)
				tempmode = GLOB.digest_modes[DM_DIGEST]					// They want to be digested and can be, Digest
			else
				tempmode = GLOB.digest_modes[DM_DRAIN]					// They want to be digested but can't be! Drain.
		if(DM_ABSORB)
			if(L.absorbable)
				tempmode = GLOB.digest_modes[DM_ABSORB]					// They want to be absorbed and can be. Absorb.
			else
				tempmode = GLOB.digest_modes[DM_DRAIN]					// They want to be absorbed but can't be! Drain.
		if(DM_DRAIN)
			tempmode = GLOB.digest_modes[DM_DRAIN]						// They want to be drained. Drain.
		if(DM_DEFAULT)
			switch(B.selective_preference)								// They don't actually care? Time for our own preference.
				if(DM_DIGEST)
					if(L.digestable)
						tempmode = GLOB.digest_modes[DM_DIGEST]			// We prefer digestion and they're digestible? Digest
					else if(L.absorbable)
						tempmode = GLOB.digest_modes[DM_ABSORB]			// If not digestible, are they absorbable? Then absorb.
					else
						tempmode = GLOB.digest_modes[DM_DRAIN]			// Otherwise drain.
				if(DM_ABSORB)
					if(L.absorbable)
						tempmode = GLOB.digest_modes[DM_ABSORB]			// We prefer absorption and they're absorbable? Absorb.
					else if(L.digestable)
						tempmode = GLOB.digest_modes[DM_DIGEST]			// If not absorbable, are they digestible? Then digest.
					else
						tempmode = GLOB.digest_modes[DM_DRAIN]			// Otherwise drain.
	return tempmode.process_mob(B, L)

/datum/digest_mode/selective/proc/get_selective_mode(obj/belly/B, mob/living/L)
	var/tempmode = DM_HOLD			// Default to Hold in case of big oof fallback
	//if not absorbed, see if they're food
	switch(L.selective_preference)										// First, we respect prey prefs
		if(DM_DIGEST)
			if(L.digestable)
				tempmode = DM_DIGEST					// They want to be digested and can be, Digest
			else
				tempmode = DM_DRAIN					// They want to be digested but can't be! Drain.
		if(DM_ABSORB)
			if(L.absorbable)
				tempmode = DM_ABSORB					// They want to be absorbed and can be. Absorb.
			else
				tempmode = DM_DRAIN					// They want to be absorbed but can't be! Drain.
		if(DM_DRAIN)
			tempmode = DM_DRAIN						// They want to be drained. Drain.
		if(DM_DEFAULT)
			switch(B.selective_preference)								// They don't actually care? Time for our own preference.
				if(DM_DIGEST)
					if(L.digestable)
						tempmode = DM_DIGEST			// We prefer digestion and they're digestible? Digest
					else if(L.absorbable)
						tempmode = DM_ABSORB			// If not digestible, are they absorbable? Then absorb.
					else
						tempmode = DM_DRAIN			// Otherwise drain.
				if(DM_ABSORB)
					if(L.absorbable)
						tempmode = DM_ABSORB			// We prefer absorption and they're absorbable? Absorb.
					else if(L.digestable)
						tempmode = DM_DIGEST			// If not absorbable, are they digestible? Then digest.
					else
						tempmode = DM_DRAIN			// Otherwise drain.
	return tempmode
