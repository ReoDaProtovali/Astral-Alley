/datum/recipe/buttspie
	appliance = OVEN
	reagents = list(REAGENT_ID_CINNAMONPOWDER = 10)
	items = list(
		/obj/item/weapon/reagent_containers/food/snacks/butterscotch,
		/obj/item/weapon/reagent_containers/food/snacks/sliceable/flatdough
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/slicable/buttspie

/datum/recipe/cinnamon_roll
	appliance = OVEN
	reagents = list(REAGENT_ID_CINNAMONPOWDER = 5, REAGENT_ID_SUGAR = 10)
	items = list(
		/obj/item/weapon/reagent_containers/food/snacks/dough,
		/obj/item/weapon/reagent_containers/food/snacks/spreads/butter
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/cinnamonroll

/datum/recipe/spicy_boys //TODO: Possibly see if recipe can be in the candymaker?
	appliance = OVEN
<<<<<<< HEAD
	reagents = list("cinnamonpowder" = 5, "sugar" = 10, "cornoil" = 10)
	result = /obj/item/weapon/reagent_containers/food/snacks/spicy_boys
=======
	reagents = list(REAGENT_ID_CINNAMONPOWDER = 5, REAGENT_ID_SUGAR = 10, REAGENT_ID_CORNOIL = 10)
	result = /obj/item/reagent_containers/food/snacks/spicy_boys
>>>>>>> fd5d9267ff ([MIRROR] Converts gas, ore, plants and reagent strings to defines (#9611))
	result_quantity = 6

/datum/recipe/welders_original //TODO: Possibly see if recipe can be in the candymaker?
	appliance = OVEN
	reagents = list(REAGENT_ID_SUGAR = 5)
	items = list(
		/obj/item/weapon/reagent_containers/food/snacks/butterscotch
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/welders_original
	result_quantity = 6

/datum/recipe/blondies
	appliance = OVEN
	reagents = list(REAGENT_ID_BLONDIEMIX = 10, REAGENT_ID_EGG = 3)
	reagent_mix = RECIPE_REAGENT_REPLACE //No egg or mix in final recipe
	result = /obj/item/weapon/reagent_containers/food/snacks/sliceable/blondies
