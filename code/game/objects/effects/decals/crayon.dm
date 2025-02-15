/obj/effect/decal/cleanable/crayon
	name = "rune"
	desc = "A rune drawn in crayon."
	icon = 'icons/obj/rune.dmi'
	plane = DIRTY_PLANE
	layer = DIRTY_LAYER
	anchored = TRUE

<<<<<<< HEAD
/obj/effect/decal/cleanable/crayon/New(location,main = "#FFFFFF",shade = "#000000",var/type = "rune")
	..()
	loc = location

=======
/obj/effect/decal/cleanable/crayon/Initialize(mapload, main = "#FFFFFF",shade = "#000000",var/type = "rune", new_age = 0)
>>>>>>> e4f07e43f3 ([MIRROR] cleans up INIT (#10164))
	name = type
	desc = "A [type] drawn in crayon."

	switch(type)
		if("rune")
			type = "rune[rand(1,6)]"
		if("graffiti")
			type = pick("amyjon","face","matt","revolution","engie","guy","end","dwarf","uboa")

<<<<<<< HEAD
	var/icon/mainOverlay = new/icon('icons/effects/crayondecal.dmi',"[type]",2.1)
	var/icon/shadeOverlay = new/icon('icons/effects/crayondecal.dmi',"[type]s",2.1)
=======
	. = ..(mapload, new_age) // mapload, age
>>>>>>> e4f07e43f3 ([MIRROR] cleans up INIT (#10164))

	mainOverlay.Blend(main,ICON_ADD)
	shadeOverlay.Blend(shade,ICON_ADD)

	add_overlay(mainOverlay)
	add_overlay(shadeOverlay)

	add_hiddenprint(usr)
