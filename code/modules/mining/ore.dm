/obj/item/weapon/ore
	name = "small rock"
	icon = 'icons/obj/mining.dmi'
	icon_state = "ore2"
	randpixel = 8
	w_class = ITEMSIZE_SMALL
	var/datum/geosample/geologic_data
	var/material

/obj/item/weapon/ore/uranium
	name = "pitchblende"
	icon_state = "ore_uranium"
	origin_tech = list(TECH_MATERIAL = 5)
	material = ORE_URANIUM

<<<<<<< HEAD
/obj/item/weapon/ore/iron
	name = "hematite"
=======
/obj/item/ore/iron
	name = ORE_HEMATITE
>>>>>>> fd5d9267ff ([MIRROR] Converts gas, ore, plants and reagent strings to defines (#9611))
	icon_state = "ore_iron"
	origin_tech = list(TECH_MATERIAL = 1)
	material = ORE_HEMATITE

/obj/item/weapon/ore/coal
	name = "raw carbon"
	icon_state = "ore_coal"
	origin_tech = list(TECH_MATERIAL = 1)
	material = ORE_CARBON

/obj/item/weapon/ore/marble
	name = "recrystallized carbonate"
	icon_state = "ore_marble"
	origin_tech = list(TECH_MATERIAL = 1)
	material = ORE_MARBLE

<<<<<<< HEAD
/obj/item/weapon/ore/glass
	name = "sand"
=======
/obj/item/ore/glass
	name = ORE_SAND
>>>>>>> fd5d9267ff ([MIRROR] Converts gas, ore, plants and reagent strings to defines (#9611))
	icon_state = "ore_glass"
	origin_tech = list(TECH_MATERIAL = 1)
	material = ORE_SAND
	slot_flags = SLOT_HOLSTER

// POCKET SAND!
/obj/item/weapon/ore/glass/throw_impact(atom/hit_atom)
	..()
	var/mob/living/carbon/human/H = hit_atom
	if(istype(H) && H.has_eyes() && prob(85))
		to_chat(H, "<span class='danger'>Some of \the [src] gets in your eyes!</span>")
		H.Blind(5)
		H.eye_blurry += 10
		spawn(1)
			if(istype(loc, /turf/)) qdel(src)


/obj/item/weapon/ore/phoron
	name = "phoron crystals"
	icon_state = "ore_phoron"
	origin_tech = list(TECH_MATERIAL = 2)
	material = ORE_PHORON

/obj/item/weapon/ore/silver
	name = "native silver ore"
	icon_state = "ore_silver"
	origin_tech = list(TECH_MATERIAL = 3)
	material = ORE_SILVER

/obj/item/weapon/ore/gold
	name = "native gold ore"
	icon_state = "ore_gold"
	origin_tech = list(TECH_MATERIAL = 4)
	material = ORE_GOLD

/obj/item/weapon/ore/diamond
	name = "diamonds"
	icon_state = "ore_diamond"
	origin_tech = list(TECH_MATERIAL = 6)
	material = ORE_DIAMOND

/obj/item/weapon/ore/osmium
	name = "raw platinum"
	icon_state = "ore_platinum"
	material = ORE_PLATINUM

/obj/item/weapon/ore/hydrogen
	name = "raw hydrogen"
	icon_state = "ore_hydrogen"
	material = ORE_MHYDROGEN

/obj/item/weapon/ore/verdantium
	name = "verdantite dust"
	icon_state = "ore_verdantium"
	material = ORE_VERDANTIUM
	origin_tech = list(TECH_MATERIAL = 7)

// POCKET ... Crystal dust.
/obj/item/weapon/ore/verdantium/throw_impact(atom/hit_atom)
	..()
	var/mob/living/carbon/human/H = hit_atom
	if(istype(H) && H.has_eyes() && prob(85))
		to_chat(H, "<span class='danger'>Some of \the [src] gets in your eyes!</span>")
		H.Blind(10)
		H.eye_blurry += 15
		spawn(1)
			if(istype(loc, /turf/)) qdel(src)

/obj/item/weapon/ore/lead
	name = "lead glance"
	icon_state = "ore_lead"
	material = ORE_LEAD
	origin_tech = list(TECH_MATERIAL = 3)
/*
/obj/item/weapon/ore/copper
	name = "raw copper"
	icon_state = "ore_copper"
	material = ORE_COPPER

/obj/item/weapon/ore/tin
	name = "raw tin"
	icon_state = "ore_tin"
	material = ORE_TIN

/obj/item/weapon/ore/bauxite
	name = "raw bauxite"
	icon_state = "ore_bauxite"
	material = ORE_BAUXITE
*/
/obj/item/weapon/ore/rutile
	name = "raw rutile"
	icon_state = "ore_rutile"
	material = ORE_RUTILE
/*
/obj/item/weapon/ore/void_opal
	name = "raw void opal"
	icon_state = "ore_void_opal"
	material = ORE_VOPAL

/obj/item/weapon/ore/painite
	name = "raw painite"
	icon_state = "ore_painite"
	material = ORE_PAINITE

/obj/item/weapon/ore/quartz
	name = "raw quartz"
	icon_state = "ore_quartz"
	material = ORE_QUARTZ
*/
/obj/item/weapon/ore/slag
	name = "Slag"
	desc = "Someone screwed up..."
	icon_state = "slag"
	material = null

/obj/item/weapon/ore/Initialize()
	. = ..()
	randpixel_xy()

/obj/item/weapon/ore/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if(istype(W,/obj/item/device/core_sampler))
		var/obj/item/device/core_sampler/C = W
		C.sample_item(src, user)
	else
		return ..()

//VOREStation Add
/obj/item/weapon/ore/attack(mob/living/M as mob, mob/living/user as mob)
	if(M.handle_eat_minerals(src, user))
		return
	..()

/obj/item/weapon/ore/attack_generic(var/mob/living/user) //Allow adminbussed mobs to eat ore if they click it while NOT on help intent.
	if(user.handle_eat_minerals(src))
		return
	..()
//VOREStation Add End

/obj/item/ore_chunk
	name = "ore chunk"
	desc = "A conglomerate of ore."
	icon = 'icons/obj/xenoarchaeology.dmi' //CHOMPEdit
	icon_state = "strange"
	randpixel = 8
	w_class = ITEMSIZE_LARGE //CHOMPEdit
	var/list/stored_ore = list(
		ORE_SAND = 0,
		ORE_HEMATITE = 0,
		ORE_CARBON = 0,
		ORE_COPPER = 0,
		ORE_TIN = 0,
		ORE_VOPAL = 0,
		ORE_PAINITE = 0,
		ORE_QUARTZ = 0,
		ORE_BAUXITE = 0,
		ORE_PHORON = 0,
		ORE_SILVER = 0,
		ORE_GOLD = 0,
		ORE_MARBLE = 0,
		ORE_URANIUM = 0,
		ORE_DIAMOND = 0,
		ORE_PLATINUM = 0,
		ORE_LEAD = 0,
		ORE_MHYDROGEN = 0,
		ORE_VERDANTIUM = 0,
		ORE_RUTILE = 0)

/obj/item/ore_chunk/examine(mob/user)
	. = ..()

	if(!Adjacent(user)) //Can only check the contents of ore boxes if you can physically reach them.
		return .

	add_fingerprint(user) //You pick it up to look at it.

	. += "It is composed of:"
	var/has_ore = 0
	for(var/ore in stored_ore)
		if(stored_ore[ore] > 0)
			. += "- [stored_ore[ore]] [ore]"
			has_ore = 1
	if(!has_ore)
		. += "Nothing. You should contact a developer."