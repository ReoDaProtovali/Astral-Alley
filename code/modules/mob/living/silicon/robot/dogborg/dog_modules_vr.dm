/obj/item/weapon/melee/dogborg/jaws
	icon = 'icons/mob/dogborg_vr.dmi'
	hitsound = 'sound/weapons/bite.ogg'
	throwforce = 0
	w_class = ITEMSIZE_NORMAL
	pry = 1
	tool_qualities = list(TOOL_CROWBAR)

/obj/item/weapon/melee/dogborg/jaws/big
	name = "combat jaws"
	icon_state = "jaws"
	desc = "The jaws of the law."
	force = 25
	armor_penetration = 25
	defend_chance = 15
	attack_verb = list("chomped", "bit", "ripped", "mauled", "enforced")

/obj/item/weapon/melee/dogborg/jaws/small
	name = "puppy jaws"
	icon_state = "smalljaws"
	desc = "The jaws of a small dog."
	force = 10
	defend_chance = 5
	attack_verb = list("nibbled", "bit", "gnawed", "chomped", "nommed")
	var/emagged = 0

/obj/item/weapon/melee/dogborg/jaws/small/attack_self(mob/user)
	var/mob/living/silicon/robot/R = user
	if(R.emagged || R.emag_items)
		emagged = !emagged
		if(emagged)
			name = "combat jaws"
			icon_state = "jaws"
			desc = "The jaws of the law."
			force = 25
			armor_penetration = 25
			defend_chance = 15
			attack_verb = list("chomped", "bit", "ripped", "mauled", "enforced")
		else
			name = "puppy jaws"
			icon_state = "smalljaws"
			desc = "The jaws of a small dog."
			force = 10
			armor_penetration = 0
			defend_chance = 5
			attack_verb = list("nibbled", "bit", "gnawed", "chomped", "nommed")
		update_icon()

// Baton chompers
/obj/item/weapon/melee/borg_combat_shocker
	name = "combat shocker"
	icon = 'icons/mob/dogborg_vr.dmi'
	icon_state = "combatshocker"
	desc = "Shocking!"
	force = 15
	throwforce = 0
	hitsound = 'sound/weapons/genhit1.ogg'
	attack_verb = list("hit")
	w_class = ITEMSIZE_NORMAL
	var/charge_cost = 15
	var/dogborg = FALSE

/obj/item/weapon/melee/borg_combat_shocker/apply_hit_effect(mob/living/target, mob/living/user, var/hit_zone)
	if(isrobot(target))
		return ..()

	var/agony = 60 // Copied from stun batons
	var/stun = 0 // ... same

	var/obj/item/organ/external/affecting = null
	if(ishuman(target))
		var/mob/living/carbon/human/H = target
		affecting = H.get_organ(hit_zone)

	if(user.a_intent == I_HURT)
		// Parent handles messages
		. = ..()
		//whacking someone causes a much poorer electrical contact than deliberately prodding them.
		agony *= 0.5
		stun *= 0.5
	else
		if(affecting)
			if(dogborg)
				target.visible_message(span_danger("[target] has been zap-chomped in the [affecting.name] with [src] by [user]!"))
			else
				target.visible_message(span_danger("[target] has been zapped in the [affecting.name] with [src] by [user]!"))
		else
			if(dogborg)
				target.visible_message(span_danger("[target] has been zap-chomped with [src] by [user]!"))
			else
				target.visible_message(span_danger("[target] has been zapped with [src] by [user]!"))
		playsound(src, 'sound/weapons/Egloves.ogg', 50, 1, -1)

	// Try to use power
	var/stunning = FALSE
	if(isrobot(loc))
		var/mob/living/silicon/robot/R = loc
		if(R.cell?.use(charge_cost) == charge_cost)
			stunning = TRUE

	if(stunning)
		target.stun_effect_act(stun, agony, hit_zone, src)
		msg_admin_attack("[key_name(user)] stunned [key_name(target)] with the [src].")
		if(ishuman(target))
			var/mob/living/carbon/human/H = target
			H.forcesay(hit_appends)

//Boop //New and improved, now a simple reagent sniffer.
/obj/item/device/boop_module
	name = "boop module"
	icon = 'icons/mob/dogborg_vr.dmi'
	icon_state = "nose"
	desc = "The BOOP module, a simple reagent and atmosphere scanner."
	force = 0
	throwforce = 0
	attack_verb = list("nuzzled", "nosed", "booped")
	w_class = ITEMSIZE_TINY

/obj/item/device/boop_module/New()
	..()
	flags |= NOBLUDGEON //No more attack messages

/obj/item/device/boop_module/attack_self(mob/user)
	if (!( istype(user.loc, /turf) ))
		return

	var/datum/gas_mixture/environment = user.loc.return_air()

	var/pressure = environment.return_pressure()
	var/total_moles = environment.total_moles

	user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
	user.visible_message(span_notice("[user] scans the air."), span_notice("You scan the air..."))

	to_chat(user, span_notice("<B>Scan results:</B>"))
	if(abs(pressure - ONE_ATMOSPHERE) < 10)
		to_chat(user, span_notice("Pressure: [round(pressure,0.1)] kPa"))
	else
		to_chat(user, span_warning("Pressure: [round(pressure,0.1)] kPa"))
	if(total_moles)
		for(var/g in environment.gas)
			to_chat(user, span_notice("[gas_data.name[g]]: [round((environment.gas[g] / total_moles) * 100)]%"))
		to_chat(user, span_notice("Temperature: [round(environment.temperature-T0C,0.1)]&deg;C ([round(environment.temperature,0.1)]K)"))

/obj/item/device/boop_module/afterattack(obj/O, mob/user as mob, proximity)
	if(!proximity)
		return
	if (user.stat)
		return
	if(!istype(O))
		return

	user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
	user.visible_message(span_notice("[user] scan at \the [O.name]."), span_notice("You scan \the [O.name]..."))

	if(!isnull(O.reagents))
		var/dat = ""
		if(O.reagents.reagent_list.len > 0)
			for (var/datum/reagent/R in O.reagents.reagent_list)
				dat += "\n \t <span class='notice'>[R]</span>"

		if(dat)
			to_chat(user, span_notice("Your BOOP module indicates: [dat]"))
		else
			to_chat(user, span_notice("No active chemical agents detected in [O]."))
	else
		to_chat(user, span_notice("No significant chemical agents detected in [O]."))

	return


//Delivery
/*
/obj/item/weapon/storage/bag/borgdelivery
	name = "fetching storage"
	desc = "Fetch the thing!"
	icon = 'icons/mob/dogborg_vr.dmi'
	icon_state = "dbag"
	w_class = ITEMSIZE_HUGE
	max_w_class = ITEMSIZE_SMALL
	max_combined_w_class = ITEMSIZE_SMALL
	storage_slots = 1
	collection_mode = 0
	can_hold = list() // any
	cant_hold = list(/obj/item/weapon/disk/nuclear)
*/

/obj/item/weapon/shockpaddles/robot/hound
	name = "paws of life"
	icon = 'icons/mob/dogborg_vr.dmi'
	icon_state = "defibpaddles0"
	desc = "Zappy paws. For fixing cardiac arrest."
	combat = 1
	attack_verb = list("batted", "pawed", "bopped", "whapped")
	chargecost = 500

/obj/item/weapon/shockpaddles/robot/hound/jumper
	name = "jumper paws"
	desc = "Zappy paws. For rebooting a full body prostetic."
	use_on_synthetic = 1

/obj/item/weapon/reagent_containers/borghypo/hound
	name = "MediHound hypospray"
	desc = "An advanced chemical synthesizer and injection system utilizing carrier's reserves, designed for heavy-duty medical equipment."
//	charge_cost = 10 // CHOMPedit: Water requirement removal.
	reagent_ids = list("inaprovaline", "tricordrazine", "dexalin", "bicaridine", "kelotane", "anti_toxin", "spaceacillin", "tramadol", "adranol") // CHOMPedit: More chems for Medihound
	var/datum/matter_synth/water = null

/* CHOMPedit start: Water requirement removal. *

/obj/item/weapon/reagent_containers/borghypo/hound/process() //Recharges in smaller steps and uses the water reserves as well.
	if(isrobot(loc))
		var/mob/living/silicon/robot/R = loc
		if(R && R.cell)
			for(var/T in reagent_ids)
				if(reagent_volumes[T] < volume && water.energy >= charge_cost)
					R.cell.use(charge_cost)
					water.use_charge(charge_cost)
					reagent_volumes[T] = min(reagent_volumes[T] + 1, volume)
	return 1

* CHOMPedit end: Water requirement removal. */

/obj/item/weapon/reagent_containers/borghypo/hound/lost
	name = "Hound hypospray"
	desc = "An advanced chemical synthesizer and injection system utilizing carrier's reserves."
	reagent_ids = list("tricordrazine", "inaprovaline", "bicaridine", "dexalin", "anti_toxin", "tramadol", "spaceacillin")

/obj/item/weapon/reagent_containers/borghypo/hound/trauma
	name = "Hound hypospray"
	desc = "An advanced chemical synthesizer and injection system utilizing carrier's reserves."
	reagent_ids = list("tricordrazine", "inaprovaline", "oxycodone", "dexalin" ,"spaceacillin")


//Tongue stuff
/obj/item/device/robot_tongue
	name = "synthetic tongue"
	desc = "Useful for slurping mess off the floor before affectionately licking the crew members in the face."
	icon = 'icons/mob/dogborg_vr.dmi'
	icon_state = "synthtongue"
	hitsound = 'sound/effects/attackblob.ogg'
	var/emagged = 0
	var/datum/matter_synth/water = null //CHOMPAdd readds water
	var/busy = 0 	//prevents abuse and runtimes

/obj/item/device/robot_tongue/New()
	..()
	flags |= NOBLUDGEON //No more attack messages

/obj/item/device/robot_tongue/attack_self(mob/user)
	var/mob/living/silicon/robot/R = user
	if(R.emagged || R.emag_items)
		emagged = !emagged
		if(emagged)
			name = "hacked tongue of doom"
			desc = "Your tongue has been upgraded successfully. Congratulations."
			icon = 'icons/mob/dogborg_vr.dmi'
			icon_state = "syndietongue"
		else
			name = "synthetic tongue"
			desc = "Useful for slurping mess off the floor before affectionately licking the crew members in the face."
			icon = 'icons/mob/dogborg_vr.dmi'
			icon_state = "synthtongue"
		update_icon()

/obj/item/device/robot_tongue/afterattack(atom/target, mob/user, proximity)
	if(!proximity)
		return

	user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
	if(busy)
		to_chat(user, span_warning("You are already licking something else."))
		return
	if(user.client && (target in user.client.screen))
		to_chat(user, span_warning("You need to take \the [target.name] off before cleaning it!"))
	//CHOMPADD Start
	if(istype(target, /obj/structure/sink) || istype(target, /obj/structure/toilet)) //Dog vibes.
		if (water.energy == water.max_energy && istype(target, /obj/structure/sink)) return
		if (water.energy == water.max_energy && istype(target, /obj/structure/toilet))
			to_chat(user, span_notice("You refrain from lapping water from the [target.name] with your reserves filled."))
			return
		user.visible_message(span_filter_notice("[user] begins to lap up water from [target.name]."), span_notice("You begin to lap up water from [target.name]."))
		busy = 1
		if(do_after(user, 50))
			water.add_charge(50)
			to_chat(src, span_filter_notice("You refill some of your water reserves."))
		busy = 0
	else if(water.energy < 5)
		to_chat(user, span_notice("Your mouth feels dry. You should drink up some water ."))
	//CHOMPADD End
		return
	//CHOMPADD Start
	else if(istype(target,/obj/effect/decal/cleanable))
		user.visible_message(span_filter_notice("[user] begins to lick off \the [target.name]."), span_notice("You begin to lick off \the [target.name]..."))
		busy = 1
		if(do_after(user, 50))
			to_chat(user, span_notice("You finish licking off \the [target.name]."))
			water.use_charge(5)
			qdel(target)
			var/mob/living/silicon/robot/R = user
			R.cell.charge += 50
		busy = 0
	//CHOMPADD End
	else if(istype(target,/obj/item))
		if(istype(target,/obj/item/trash))
			user.visible_message(span_filter_notice("[user] nibbles away at \the [target.name]."), span_notice("You begin to nibble away at \the [target.name]..."))
			busy = 1
			if(do_after (user, 50))
				user.visible_message(span_filter_notice("[user] finishes eating \the [target.name]."), span_notice("You finish eating \the [target.name]."))
				to_chat(user, span_notice("You finish off \the [target.name]."))
				qdel(target)
				var/mob/living/silicon/robot/R = user
				R.cell.charge += 250
				water.use_charge(5)  //CHOMPAdd
			busy = 0 //CHOMPAdd prevents abuse
			return
<<<<<<< HEAD
		if(istype(target,/obj/item/weapon/reagent_containers/food))
			user.visible_message("[user] nibbles away at \the [target.name].", "<span class='notice'>You begin to nibble away at \the [target.name]...</span>")
=======
		if(istype(target,/obj/item/reagent_containers/food))
			user.visible_message("[user] nibbles away at \the [target.name].", span_notice("You begin to nibble away at \the [target.name]..."))
>>>>>>> ab154b48b2 ([MIRROR] refactors most spans (#9139))
			busy = 1 //CHOMPAdd prevents abuse
			if(do_after (user, 50))
				user.visible_message("[user] finishes eating \the [target.name].", span_notice("You finish eating \the [target.name]."))
				user << span_notice("You finish off \the [target.name].")
				del(target)
				var/mob/living/silicon/robot/R = user
				R.cell.charge = R.cell.charge + 250
			busy = 0 //CHOMPAdd prevents abuse
			return
<<<<<<< HEAD
		if(istype(target,/obj/item/weapon/cell))
			user.visible_message("<span class='filter_notice'>[user] begins cramming \the [target.name] down its throat.</span>", "<span class='notice'>You begin cramming \the [target.name] down your throat...</span>")
=======
		if(istype(target,/obj/item/cell))
			user.visible_message(span_filter_notice("[user] begins cramming \the [target.name] down its throat."), span_notice("You begin cramming \the [target.name] down your throat..."))
>>>>>>> ab154b48b2 ([MIRROR] refactors most spans (#9139))
			busy = 1
			if(do_after (user, 50))
				user.visible_message(span_filter_notice("[user] finishes gulping down \the [target.name]."), span_notice("You finish swallowing \the [target.name]."))
				to_chat(user, span_notice("You finish off \the [target.name], and gain some charge!"))
				var/mob/living/silicon/robot/R = user
				var/obj/item/weapon/cell/C = target
				R.cell.charge += C.charge / 3
				water.use_charge(5) //CHOMPAdd
				qdel(target)
			busy = 0 //CHOMPAdd prevents abuse
			return
		//CHOMPAdd Start
		user.visible_message(span_filter_notice("[user] begins to lick \the [target.name] clean..."), span_notice("You begin to lick \the [target.name] clean..."))
		busy = 1
		if(do_after(user, 50, exclusive = TRUE))
			to_chat(user, span_notice("You clean \the [target.name]."))
			water.use_charge(5)
			var/obj/effect/decal/cleanable/C = locate() in target
			qdel(C)
			target.clean_blood()
		busy = 0
		//CHOMPADD End
	else if(ishuman(target))
		if(src.emagged)
			var/mob/living/silicon/robot/R = user
			var/mob/living/L = target
			if(!R.use_direct_power(666, 100))
				to_chat(user, span_warning("Warning, low power detected. Aborting action."))
				return
			L.Stun(1)
			L.Weaken(1)
			L.apply_effect(STUTTER, 1)
			L.visible_message(span_danger("[user] has shocked [L] with its tongue!"), \
								span_userdanger("[user] has shocked you with its tongue! You can feel the betrayal."))
			playsound(src, 'sound/weapons/Egloves.ogg', 50, 1, -1)
		else
			user.visible_message(span_notice("\The [user] affectionately licks all over \the [target]'s face!"), span_notice("You affectionately lick all over \the [target]'s face!"))
			playsound(src, 'sound/effects/attackblob.ogg', 50, 1)
			water.use_charge(5) //CHOMPAdd
			var/mob/living/carbon/human/H = target
			if(H.species.lightweight == 1)
				H.Weaken(3)
	//CHOMPAdd Start
	else
		user.visible_message(span_filter_notice("[user] begins to lick \the [target.name] clean..."), span_notice("You begin to lick \the [target.name] clean..."))
		busy = 1
		if(do_after(user, 50))
			to_chat(user, span_notice("You clean \the [target.name]."))
			var/obj/effect/decal/cleanable/C = locate() in target
			qdel(C)
			target.clean_blood()
			water.use_charge(5)
			if(istype(target, /turf/simulated))
				var/turf/simulated/T = target
				T.dirt = 0
	busy = 0
	//CHOMPADD End
	return

/obj/item/pupscrubber
	name = "floor scrubber"
	desc = "Toggles floor scrubbing."
	icon = 'icons/mob/dogborg_vr.dmi'
	icon_state = "scrub0"
	var/enabled = FALSE

/obj/item/pupscrubber/New()
	..()
	flags |= NOBLUDGEON

/obj/item/pupscrubber/attack_self(mob/user)
	var/mob/living/silicon/robot/R = user
	if(!enabled)
		R.scrubbing = TRUE
		enabled = TRUE
		icon_state = "scrub1"
	else
		R.scrubbing = FALSE
		enabled = FALSE
		icon_state = "scrub0"

/obj/item/weapon/gun/energy/taser/mounted/cyborg/ertgun //Not a taser, but it's being used as a base so it takes energy and actually works.
	name = "disabler"
	desc = "A small and nonlethal gun produced by NT.."
	icon = 'icons/mob/dogborg_vr.dmi'
	icon_state = "ertgunstun"
	fire_sound = 'sound/weapons/eLuger.ogg'
	projectile_type = /obj/item/projectile/beam/disable
	charge_cost = 240 //Normal cost of a taser. It used to be 1000, but after some testing it was found that it would sap a borg's battery to quick
	recharge_time = 1 //Takes ten ticks to recharge a laser, so don't waste them all!
	//cell_type = null //Same cell as a taser until edits are made.

/obj/item/weapon/melee/combat_borgblade
	name = "energy blade"
	icon = 'icons/mob/dogborg_vr.dmi'
	icon_state = "swordtail"
	desc = "A glowing dagger. It appears to be extremely sharp."
	force = 35 //Takes 3 hits to 100-0
	armor_penetration = 70
	sharp = TRUE
	edge = TRUE
	throwforce = 0 //This shouldn't be thrown in the first place.
	hitsound = 'sound/weapons/blade1.ogg'
	attack_verb = list("slashed", "stabbed", "jabbed", "mauled", "sliced")
	w_class = ITEMSIZE_NORMAL

/obj/item/device/lightreplacer/dogborg
	name = "light replacer"
	desc = "A device to automatically replace lights. This version is capable to produce a few replacements using your internal matter reserves."
	max_uses = 16
	uses = 10
	var/cooldown = 0
	var/datum/matter_synth/glass = null

/obj/item/device/lightreplacer/dogborg/attack_self(mob/user)//Recharger refill is so last season. Now we recycle without magic!

	var/choice = tgui_alert(user, "Do you wish to check the reserves or change the color?", "Selection List", list("Reserves", "Color"))
	if(!choice)
		return
	if(choice == "Color")
		var/new_color = input(usr, "Choose a color to set the light to! (Default is [LIGHT_COLOR_INCANDESCENT_TUBE])", "", selected_color) as color|null
		if(new_color)
			selected_color = new_color
			to_chat(user, span_filter_notice("The light color has been changed."))
		return
	else
		if(uses >= max_uses)
			to_chat(user, span_warning("[src.name] is full."))
			return
		if(uses < max_uses && cooldown == 0)
			if(glass.energy < 125)
				to_chat(user, span_warning("Insufficient material reserves."))
				return
			to_chat(user, span_filter_notice("It has [uses] lights remaining. Attempting to fabricate a replacement. Please stand still."))
			cooldown = 1
			if(do_after(user, 50))
				glass.use_charge(125)
				add_uses(1)
				cooldown = 0
			else
				cooldown = 0
		else
			to_chat(user, span_filter_notice("It has [uses] lights remaining."))
			return

//Pounce stuff for K-9
/obj/item/weapon/dogborg/pounce
	name = "pounce"
	icon = 'icons/mob/dogborg_vr.dmi'
	icon_state = "pounce"
	desc = "Leap at your target to momentarily stun them."
	force = 0
	throwforce = 0
	var/bluespace = FALSE

/obj/item/weapon/dogborg/pounce/New()
	..()
	flags |= NOBLUDGEON

/obj/item/weapon/dogborg/pounce/attack_self(mob/user)
	var/mob/living/silicon/robot/R = user
	R.leap(bluespace)

/mob/living/silicon/robot/proc/leap(var/bluespace = FALSE)
	if(last_special > world.time)
		to_chat(src, span_filter_notice("Your leap actuators are still recharging."))
		return

	var/power_cost = bluespace ? 1000 : 750
	var/minimum_power = bluespace ? 2500 : 1000
	if(cell.charge < minimum_power)
		to_chat(src, span_filter_notice("Cell charge too low to continue."))
		return

	if(usr.incapacitated(INCAPACITATION_DISABLED))
		to_chat(src, span_filter_notice("You cannot leap in your current state."))
		return

	var/list/choices = list()
	var/leap_distance = bluespace ? 5 : 3
	for(var/mob/living/M in view(leap_distance,src))
		if(!istype(M,/mob/living/silicon))
			choices += M
	choices -= src

	var/mob/living/T = tgui_input_list(src,"Who do you wish to leap at?","Target Choice", choices)

	if(!T || !src || src.stat) return

	if(get_dist(get_turf(T), get_turf(src)) > leap_distance) return

	if(ishuman(T))
		var/mob/living/carbon/human/H = T
		if(H.get_species() == SPECIES_SHADEKIN && (H.ability_flags & AB_PHASE_SHIFTED))
			power_cost *= 2

	if(!use_direct_power(power_cost, minimum_power - power_cost))
		to_chat(src, span_warning("Warning, low power detected. Aborting action."))
		return

	if(last_special > world.time)
		return

	if(usr.incapacitated(INCAPACITATION_DISABLED))
		to_chat(src, span_filter_notice("You cannot leap in your current state."))
		return

	last_special = world.time + 10
	status_flags |= LEAPING
	pixel_y = pixel_y + 10

	src.visible_message(span_danger("\The [src] leaps at [T]!"))
	/* //ChompEDIT START - disable for now
	if(bluespace)
		src.forceMove(get_turf(T))
		T.hitby(src)
	else
		src.throw_at(get_step(get_turf(T),get_turf(src)), 4, 1, src)
	*/ 
	src.throw_at(get_step(get_turf(T),get_turf(src)), 4, 1, src) //ChompEDIT - no bluespace pounce
	//ChompEDIT END
	playsound(src, 'sound/mecha/mechstep2.ogg', 50, 1)
	pixel_y = default_pixel_y

	if(!bluespace)
		sleep(5)

	if(status_flags & LEAPING) status_flags &= ~LEAPING

	if(!src.Adjacent(T))
		to_chat(src, span_warning("You miss!"))
		return

	if(ishuman(T))
		var/mob/living/carbon/human/H = T
		if(H.species.lightweight == 1)
			H.Stun(3) // CHOMPEdit - Crawling made this useless. Changing to stun instead.
			H.drop_both_hands() //Stuns no longer drop items, so were forcing it >:3
			return

	var/armor_block = run_armor_check(T, "melee")
	var/armor_soak = get_armor_soak(T, "melee")
	T.apply_damage(20, HALLOSS,, armor_block, armor_soak)
	if(prob(75)) //75% chance to stun for 5 seconds, really only going to be 4 bcus click cooldown+animation.
		T.apply_effect(5, STUN, armor_block)
		T.drop_both_hands() //CHOMPEdit Stuns no longer drop items

/obj/item/weapon/reagent_containers/glass/beaker/large/borg
	var/mob/living/silicon/robot/R
	var/last_robot_loc

/obj/item/weapon/reagent_containers/glass/beaker/large/borg/Initialize()
	. = ..()
	R = loc.loc
	RegisterSignal(src, COMSIG_OBSERVER_MOVED, PROC_REF(check_loc))

/obj/item/weapon/reagent_containers/glass/beaker/large/borg/proc/check_loc(atom/movable/mover, atom/old_loc, atom/new_loc)
	if(old_loc == R || old_loc == R.module)
		last_robot_loc = old_loc
	if(!istype(loc, /obj/machinery) && loc != R && loc != R.module)
		if(last_robot_loc)
			forceMove(last_robot_loc)
			last_robot_loc = null
		else
			forceMove(R)
		if(loc == R)
			hud_layerise()

/obj/item/weapon/reagent_containers/glass/beaker/large/borg/Destroy()
	UnregisterSignal(src, COMSIG_OBSERVER_MOVED)
	..()
