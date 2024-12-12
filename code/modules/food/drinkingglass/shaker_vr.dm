/obj/item/weapon/reagent_containers/food/drinks/glass2/fitnessflask/proteanshake
	name = "protean shake"
	icon = 'icons/obj/drinks.dmi'
	icon_state = "protean_shake"
	base_icon = "protean_shake"
	desc = "A strangely unlabeled, unbranded pre-workout drink carton."

/obj/item/weapon/reagent_containers/food/drinks/glass2/fitnessflask/proteanshake/Initialize()
	. = ..()
	cut_overlays()
	reagents.add_reagent(REAGENT_ID_LIQUIDPROTEAN, 50)
	reagents.add_reagent(REAGENT_ID_NUTRIMENT, 50)

<<<<<<< HEAD
/obj/item/weapon/reagent_containers/food/drinks/glass2/fitnessflask/proteanshake/update_icon()
	return
=======
/obj/item/reagent_containers/food/drinks/glass2/fitnessflask/proteanshake/update_icon()
	return
>>>>>>> fd5d9267ff ([MIRROR] Converts gas, ore, plants and reagent strings to defines (#9611))
