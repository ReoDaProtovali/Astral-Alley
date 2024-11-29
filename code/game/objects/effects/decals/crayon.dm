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

	name = type
	desc = "A [type] drawn in crayon."

=======
	var/art_type
	var/art_color
	var/art_shade

/obj/effect/decal/cleanable/crayon/Initialize(var/ml, main = "#FFFFFF",shade = "#000000",var/type = "rune", new_age = 0)
	name = type
	desc = "A [type] drawn in crayon."

	// Persistence vars. Unused here but used downstream. If someone updates the persistance code, it's here.
	art_type = type
	art_color = main
	art_shade = shade

>>>>>>> b785d48300 ([MIRROR] Ports Janihud rework from Outpost 21. (#9549))
	switch(type)
		if("rune")
			type = "rune[rand(1,6)]"
		if("graffiti")
			type = pick("amyjon","face","matt","revolution","engie","guy","end","dwarf","uboa")

<<<<<<< HEAD
	var/icon/mainOverlay = new/icon('icons/effects/crayondecal.dmi',"[type]",2.1)
	var/icon/shadeOverlay = new/icon('icons/effects/crayondecal.dmi',"[type]s",2.1)
=======
	. = ..(ml, new_age) // mapload, age
>>>>>>> b785d48300 ([MIRROR] Ports Janihud rework from Outpost 21. (#9549))

	mainOverlay.Blend(main,ICON_ADD)
	shadeOverlay.Blend(shade,ICON_ADD)

	add_overlay(mainOverlay)
	add_overlay(shadeOverlay)

<<<<<<< HEAD
	add_hiddenprint(usr)
=======
		add_overlay(mainOverlay)
		add_overlay(shadeOverlay)

	add_janitor_hud_overlay()
	return
// CHOMPEdit End
>>>>>>> b785d48300 ([MIRROR] Ports Janihud rework from Outpost 21. (#9549))
