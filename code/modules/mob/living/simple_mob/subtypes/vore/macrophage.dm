/mob/living/simple_mob/vore/aggressive/macrophage
	name = "Germ"
	desc = "A giant virus!"
	icon = 'icons/mob/macrophage.dmi'
	icon_state = "macrophage-1"

	faction = FACTION_MACROBACTERIA
	maxHealth = 20
	health = 20

	minbodytemp = T0C-30
	heat_damage_per_tick = 40
	cold_damage_per_tick = 40

	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0
	unsuitable_atoms_damage = 0
	shock_resist = 0.5
	taser_kill = FALSE
	water_resist = 1

	var/datum/disease/base_disease = null
	var/list/infections = list()

	melee_damage_lower = 1
	melee_damage_upper = 5
	grab_resist = 100
	see_in_dark = 8

	response_help = "shoos"
	response_disarm = "swats away"
	response_harm = "squashes"
	attacktext = list("squashed")
	friendly = list("shoos", "rubs")

	vore_bump_chance = "attempts to absorb"

	vore_active = TRUE
	vore_capacity = 1
	vore_pounce_chance = 45

	can_be_drop_prey = FALSE
	allow_mind_transfer = TRUE

	pass_flags = PASSTABLE | PASSMOB
	mob_size = MOB_TINY

	ai_holder_type = /datum/ai_holder/simple_mob/melee/macrophage

/mob/living/simple_mob/vore/aggressive/macrophage/giant
	name = "Giant Germ"
	desc = "An incredibly huge virus!"

	size_multiplier = 1.5

	maxHealth = 40
	health = 40

	pass_flags = PASSTABLE | PASSGRILLE

/mob/living/simple_mob/vore/aggressive/macrophage/Initialize()
	. = ..()
	var/datum/disease/advance/random/macrophage/D = new
	health += D.totalResistance()
	maxHealth += D.totalResistance()
	melee_damage_lower += max(0, D.totalResistance())
	melee_damage_upper += max(0, D.totalResistance())
	infections += D
	base_disease = D

/mob/living/simple_mob/vore/aggressive/macrophage/proc/deathcheck()
	if(locate(/mob/living/carbon/human) in vore_selected)
		addtimer(CALLBACK(src, TYPE_PROC_REF(/mob/living/simple_mob/vore/aggressive/macrophage, deathcheck)), 3000)
	else
		death()

<<<<<<< HEAD
/mob/living/simple_mob/vore/aggressive/macrophage/green
	icon_state = "macrophage-2"

/mob/living/simple_mob/vore/aggressive/macrophage/pink
	icon_state = "macrophage-3"

/mob/living/simple_mob/vore/aggressive/macrophage/blue
	icon_state = "macrophage-4"

/mob/living/simple_mob/vore/aggressive/macrophage/do_attack(atom/A, turf/T)
	. = ..()
	if(iscarbon(A))
		var/mob/living/carbon/human/victim = A
		if((victim.HasDisease(base_disease) || !victim.CanContractDisease(base_disease)) && prob(75))
			ai_holder.lose_target()
		victim.ContractDisease(base_disease)

=======
/mob/living/simple_mob/vore/aggressive/macrophage/apply_melee_effects(atom/A)
	if(ishuman(A) && prob(25))
		var/mob/living/carbon/human/H = A
		H.ContractDisease(base_disease)
/*
/mob/living/simple_mob/vore/aggressive/macrophage/do_special_attack(var/atom/A)
	. = TRUE
	set_AI_busy(TRUE)
	do_windup_animation(A, 20)
	addtimer(CALLBACK(src, PROC_REF(charge), A), 20, TIMER_STOPPABLE)

/mob/living/simple_mob/vore/aggressive/macrophage/proc/charge(var/atom/A)
	if(QDELETED(A) || !isturf(get_turf(A)))
		set_AI_busy(FALSE)
		return
	status_flags |= LEAPING
	flying = TRUE
	hovering = TRUE
	visible_message(span_warning("The [src] lunges at \the [A]!"))
	throw_at(A, 7, 2)
	if(status_flags & LEAPING)
		status_flags &= ~LEAPING
	flying = FALSE
	hovering = FALSE

	var/mob/living/target = null
	if(Adjacent(A))
		target = A

	if(ishuman(target))
		var/mob/living/carbon/human/H = target
		H.ContractDisease(base_disease)
	set_AI_busy(FALSE)
*/
>>>>>>> 2916489860 ([MIRROR] Miscellaneous Virology Update (#11230))
/mob/living/simple_mob/vore/aggressive/macrophage/death()
	..()
	if(isbelly(loc))
		var/obj/belly/belly = loc
		if(belly)
			var/mob/living/pred = belly.owner
			pred.ForceContractDisease(base_disease)
	else
<<<<<<< HEAD
		var/obj/effect/decal/cleanable/mucus/sick = new(loc)
=======
		visible_message(span_warning("\The [src] shrivels up and dies, unable to survive!"))
		var/obj/effect/decal/cleanable/blood/sick = new(loc)
		sick.name = "plasma"
		sick.basecolor = "#47cbcf"
		sick.update_icon()
		sick.pixel_x = rand(-24, 24)
		sick.pixel_y = rand(-24, 24)
>>>>>>> 2916489860 ([MIRROR] Miscellaneous Virology Update (#11230))
		sick.viruses += base_disease
	qdel(src)

/obj/belly/macrophage
	name = "capsid"
	fancy_vore = TRUE
	contamination_color = "green"
	vore_verb = "absorb"
	escapable = TRUE
	escapable = 20
	desc = "In an attempt to get away from the giant virus, it's oversized envelope proteins dragged you right past it's matrix, encapsulating you deep inside it's capsid... The strange walls kneading and keeping you tight along within it's nucleoprotein."
	belly_fullscreen = "VBO_gematically_angular"
	belly_fullscreen_color = "#87d8d8"
	digest_mode = DM_ABSORB
	affects_vore_sprites = FALSE

/mob/living/simple_mob/vore/aggressive/macrophage/init_vore()

	if(!voremob_loaded || LAZYLEN(vore_organs))
		return TRUE

	var/obj/belly/B = new /obj/belly/macrophage(src)
	vore_selected = B

/datum/ai_holder/simple_mob/melee/macrophage
	var/datum/disease/virus = null

/datum/ai_holder/simple_mob/melee/macrophage/list_targets()
	var/list/our_targets = ..()
	var/mob/living/simple_mob/vore/aggressive/macrophage/macrophage = holder
	for(var/list_target in our_targets)
		var/mob/living/victim = list_target
		if(victim.viruses)
			if(victim.HasDisease(macrophage.base_disease) && prob(75)) // Less likely to be a target if you're infected
				our_targets -= list_target
				continue
	return our_targets
