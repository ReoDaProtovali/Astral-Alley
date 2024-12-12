/datum/seed/banana
	name = PLANT_BANANA
	seed_name = PLANT_BANANA
	display_name = "banana tree"
<<<<<<< HEAD
	kitchen_tag = "banana"
	chems = list("banana" = list(10,10))
	trash_type = /obj/item/weapon/bananapeel
=======
	kitchen_tag = PLANT_BANANA
	chems = list(REAGENT_ID_BANANA = list(10,10))
	trash_type = /obj/item/bananapeel
>>>>>>> fd5d9267ff ([MIRROR] Converts gas, ore, plants and reagent strings to defines (#9611))

/datum/seed/banana/New()
	..()
	set_trait(TRAIT_HARVEST_REPEAT,1)
	set_trait(TRAIT_MATURATION,6)
	set_trait(TRAIT_PRODUCTION,6)
	set_trait(TRAIT_YIELD,3)
	set_trait(TRAIT_PRODUCT_ICON,"bananas")
	set_trait(TRAIT_PRODUCT_COLOUR,"#FFEC1F")
	set_trait(TRAIT_PLANT_COLOUR,"#69AD50")
	set_trait(TRAIT_PLANT_ICON,"tree4")
	set_trait(TRAIT_IDEAL_HEAT, 298)
	set_trait(TRAIT_IDEAL_LIGHT, 7)
	set_trait(TRAIT_WATER_CONSUMPTION, 6)
