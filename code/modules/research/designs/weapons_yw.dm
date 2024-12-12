/datum/design/item/weapon/energy/hunter
	name = "Hybrid 'Hunter' net gun"
	id = "huntergun"
	req_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 6, TECH_MAGNET = 4)
<<<<<<< HEAD
	materials = list(DEFAULT_WALL_MATERIAL = 6000, "glass" = 3000, "silver" = 1000)
	build_path = /obj/item/weapon/gun/energy/hunter
=======
	materials = list(DEFAULT_WALL_MATERIAL = 6000, MAT_GLASS = 3000, MAT_SILVER = 1000)
	build_path = /obj/item/gun/energy/hunter
>>>>>>> fd5d9267ff ([MIRROR] Converts gas, ore, plants and reagent strings to defines (#9611))
	sort_string = "MAAVC"
	department = LATHE_ALL | LATHE_SECURITY // CHOMPAdd
