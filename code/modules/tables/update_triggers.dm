<<<<<<< HEAD
/obj/structure/window/New()
	..()
=======
/obj/structure/window/Initialize(mapload, start_dir=null, constructed=0)
	. = ..()
>>>>>>> 5853b61b55 ([MIRROR] New to init final (#10649))
	for(var/obj/structure/table/T in view(src, 1))
		T.update_connections()
		T.update_icon()

/obj/structure/window/Destroy()
	var/oldloc = loc
	. = ..()
	for(var/obj/structure/table/T in view(oldloc, 1))
		T.update_connections()
		T.update_icon()

/obj/structure/window/Move()
	var/oldloc = loc
	. = ..()
	if(loc != oldloc)
		for(var/obj/structure/table/T in view(oldloc, 1) | view(loc, 1))
			T.update_connections()
			T.update_icon()