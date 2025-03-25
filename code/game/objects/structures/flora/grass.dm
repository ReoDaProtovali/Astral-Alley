//grass
/obj/structure/flora/grass
	name = "grass"
	icon = 'icons/obj/flora/snowflora.dmi'
	anchored = TRUE

/obj/structure/flora/grass/Initialize(mapload, var/grass_icon)
	. = ..()
	icon_state = grass_icon

/obj/structure/flora/grass/brown
	icon_state = "snowgrass1bb"

/obj/structure/flora/grass/brown/Initialize(mapload)
	. = ..(mapload, "snowgrass[rand(1, 3)]bb")

/obj/structure/flora/grass/green
	icon_state = "snowgrass1gb"

/obj/structure/flora/grass/green/Initialize(mapload)
	. = ..(mapload, "snowgrass[rand(1, 3)]gb")

/obj/structure/flora/grass/both
	icon_state = "snowgrassall1"

<<<<<<< HEAD
/obj/structure/flora/grass/both/New()
	..()
	icon_state = "snowgrassall[rand(1, 3)]"
=======
/obj/structure/flora/grass/both/Initialize(mapload)
	. = ..(mapload, "snowgrassall[rand(1, 3)]")
>>>>>>> 55d696e503 ([MIRROR] next new to init (#10524))
