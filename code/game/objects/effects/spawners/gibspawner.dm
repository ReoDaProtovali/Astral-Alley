/obj/effect/gibspawner/generic
	gibtypes = list(/obj/effect/decal/cleanable/blood/gibs,/obj/effect/decal/cleanable/blood/gibs,/obj/effect/decal/cleanable/blood/gibs/core)
	gibamounts = list(2,2,1)

/obj/effect/gibspawner/generic/New()
	gibdirections = list(list(WEST, NORTHWEST, SOUTHWEST, NORTH),list(EAST, NORTHEAST, SOUTHEAST, SOUTH), list())
	..()

/obj/effect/gibspawner/human
	gibtypes = list(/obj/effect/decal/cleanable/blood/gibs,/obj/effect/decal/cleanable/blood/gibs/down,/obj/effect/decal/cleanable/blood/gibs,/obj/effect/decal/cleanable/blood/gibs,/obj/effect/decal/cleanable/blood/gibs,/obj/effect/decal/cleanable/blood/gibs,/obj/effect/decal/cleanable/blood/gibs/core)
	gibamounts = list(1,1,1,1,1,1,1)

<<<<<<< HEAD
/obj/effect/gibspawner/human/New()
	gibdirections = list(list(NORTH, NORTHEAST, NORTHWEST),list(SOUTH, SOUTHEAST, SOUTHWEST),list(WEST, NORTHWEST, SOUTHWEST),list(EAST, NORTHEAST, SOUTHEAST), alldirs, alldirs, list())
=======
/obj/effect/gibspawner/human/Initialize(mapload)
	gibdirections = list(list(NORTH, NORTHEAST, NORTHWEST),list(SOUTH, SOUTHEAST, SOUTHWEST),list(WEST, NORTHWEST, SOUTHWEST),list(EAST, NORTHEAST, SOUTHEAST), GLOB.alldirs, GLOB.alldirs, list())
>>>>>>> f04f992cfe ([MIRROR] code/global.dm => code/_global_vars/ (#10689))
	gibamounts[6] = pick(0,1,2)
	..()

/obj/effect/gibspawner/robot
	sparks = 1
	gibtypes = list(/obj/effect/decal/cleanable/blood/gibs/robot/up,/obj/effect/decal/cleanable/blood/gibs/robot/down,/obj/effect/decal/cleanable/blood/gibs/robot,/obj/effect/decal/cleanable/blood/gibs/robot,/obj/effect/decal/cleanable/blood/gibs/robot,/obj/effect/decal/cleanable/blood/gibs/robot/limb)
	gibamounts = list(1,1,1,1,1,1)

<<<<<<< HEAD
/obj/effect/gibspawner/robot/New()
	gibdirections = list(list(NORTH, NORTHEAST, NORTHWEST),list(SOUTH, SOUTHEAST, SOUTHWEST),list(WEST, NORTHWEST, SOUTHWEST),list(EAST, NORTHEAST, SOUTHEAST), alldirs, alldirs)
=======
/obj/effect/gibspawner/robot/Initialize(mapload)
	gibdirections = list(list(NORTH, NORTHEAST, NORTHWEST),list(SOUTH, SOUTHEAST, SOUTHWEST),list(WEST, NORTHWEST, SOUTHWEST),list(EAST, NORTHEAST, SOUTHEAST), GLOB.alldirs, GLOB.alldirs)
>>>>>>> f04f992cfe ([MIRROR] code/global.dm => code/_global_vars/ (#10689))
	gibamounts[6] = pick(0,1,2)
	..()
