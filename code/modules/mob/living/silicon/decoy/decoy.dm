/mob/living/silicon/decoy
	name = "AI"
	icon = 'icons/mob/AI.dmi'//
	icon_state = "ai"
	anchored = TRUE // -- TLE
	canmove = 0

<<<<<<< HEAD
/mob/living/silicon/decoy/New()
	src.icon = 'icons/mob/AI.dmi'
	src.icon_state = "ai"
	src.anchored = TRUE
	src.canmove = 0
=======
/mob/living/silicon/decoy/Initialize(mapload)
	. = ..(mapload, TRUE)
>>>>>>> 5853b61b55 ([MIRROR] New to init final (#10649))
