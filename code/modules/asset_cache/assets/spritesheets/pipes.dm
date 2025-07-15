/datum/asset/spritesheet/pipes
	name = "pipes"

/datum/asset/spritesheet/pipes/create_spritesheets()
	for(var/each in list('icons/obj/pipe-item.dmi', 'icons/obj/pipes/disposal.dmi'))
<<<<<<< HEAD
		InsertAll("", each, global.alldirs)
=======
		InsertAll("", each, GLOB.alldirs)
>>>>>>> 2c9453b5c3 ([MIRROR] var/global/list -> GLOB. conversion (#11193))
