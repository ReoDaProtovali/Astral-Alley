// Specific types
/datum/mini_hud/mapper
    var/obj/item/mapping_unit/owner

/datum/mini_hud/mapper/New(var/datum/hud/other, owner)
<<<<<<< HEAD
    src.owner = owner
    screenobjs = list(new /obj/screen/movable/mapper_holder(null, owner))
    ..()
=======
	src.owner = owner
	screenobjs = list(new /atom/movable/screen/movable/mapper_holder(null, owner))
	..()
>>>>>>> 303e88c0b2 ([MIRROR] obj screen to atom movable screen (#11719))

/datum/mini_hud/mapper/Destroy()
    owner?.hud_item = null
    owner?.hud_datum = null
    return ..()