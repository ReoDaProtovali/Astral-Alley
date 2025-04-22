/obj/effect/landmark/poi_loader
	name = "PoI Loader"
	var/size_x
	var/size_y
	var/poi_type = null
	var/remove_from_pool = TRUE

/obj/effect/landmark/poi_loader/New()
INITIALIZE_IMMEDIATE(/obj/effect/landmark/poi_loader)

<<<<<<< HEAD
/obj/effect/landmark/poi_loader/Initialize()
	src.load_poi()
=======
/obj/effect/landmark/poi_loader/Initialize(mapload)
	SSpoints_of_interest.poi_queue += src
>>>>>>> b34a389663 ([MIRROR] Removing the last sleeps in Init (#10715))
	return ..()
