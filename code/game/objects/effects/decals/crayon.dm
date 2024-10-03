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
/obj/effect/decal/cleanable/crayon/Initialize(var/ml, main = "#FFFFFF",shade = "#000000",var/type = "rune", new_age = 0)
	. = ..(ml, new_age) // mapload, age
>>>>>>> 2e83b6b796 (gives graffiti the right vars (#9127))
	name = type
	desc = "A [type] drawn in crayon."

	switch(type)
		if("rune")
			type = "rune[rand(1,6)]"
		if("graffiti")
			type = pick("amyjon","face","matt","revolution","engie","guy","end","dwarf","uboa")

	var/icon/mainOverlay = new/icon('icons/effects/crayondecal.dmi',"[type]",2.1)
	var/icon/shadeOverlay = new/icon('icons/effects/crayondecal.dmi',"[type]s",2.1)

	mainOverlay.Blend(main,ICON_ADD)
	shadeOverlay.Blend(shade,ICON_ADD)

	add_overlay(mainOverlay)
	add_overlay(shadeOverlay)

<<<<<<< HEAD
	add_hiddenprint(usr)
=======
/obj/effect/decal/cleanable/crayon/update_icon()
	cut_overlays()
	var/icon/mainOverlay = new/icon('icons/effects/crayondecal.dmi',"[art_type]",2.1)
	var/icon/shadeOverlay = new/icon('icons/effects/crayondecal.dmi',"[art_type]s",2.1)

	if(mainOverlay && shadeOverlay)
		mainOverlay.Blend(art_color,ICON_ADD)
		shadeOverlay.Blend(art_shade,ICON_ADD)

		add_overlay(mainOverlay)
		add_overlay(shadeOverlay)
	return
// CHOMPEdit End
>>>>>>> 2e83b6b796 (gives graffiti the right vars (#9127))
