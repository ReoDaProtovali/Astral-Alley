/obj/structure/table/rack
	icon = 'icons/obj/objects_vr.dmi'

/obj/structure/table/rack/steel
	color = "#666666"

/obj/structure/table/rack/steel/New()
	material = get_material_by_name(MAT_STEEL)
	..()

/obj/structure/table/rack/shelf
	name = "shelving"
	desc = "Some nice metal shelves."
	icon_state = "shelf"

/obj/structure/table/rack/shelf/steel
	color = "#666666"

/obj/structure/table/rack/shelf/steel/New()
	material = get_material_by_name(MAT_STEEL)
	..()

// SOMEONE should add cool overlay stuff to this
/obj/structure/table/rack/gun_rack
	name = "gun rack"
	desc = "Seems like you could prop up some rifles here."
	icon_state = "gunrack"

/obj/structure/table/rack/gun_rack/steel
	color = "#666666"

/obj/structure/table/rack/gun_rack/steel/New()
	material = get_material_by_name(MAT_STEEL)
	..()

/obj/structure/table/rack/wood
	color = "#A1662F"

/obj/structure/table/rack/wood/New()
	material = get_material_by_name(MAT_WOOD)
	..()

/obj/structure/table/rack/shelf/wood
	color = "#A1662F"

/obj/structure/table/rack/shelf/wood/New()
	material = get_material_by_name(MAT_WOOD)
<<<<<<< HEAD
	..()
=======
	. = ..()

/obj/structure/table/rack/glamour
	color = "#fffbe6"

/obj/structure/table/rack/glamour/Initialize(mapload)
	material = get_material_by_name(MAT_GLAMOUR)
	. = ..()

/obj/structure/table/rack/shelf/glamour
	color = "#fffbe6"

/obj/structure/table/rack/shelf/glamour/Initialize(mapload)
	material = get_material_by_name(MAT_GLAMOUR)
	. = ..()
>>>>>>> af855f38c0 ([MIRROR] A few mapping glamour objects (#11303))
