/mob/living/simple_mob/clowns/big/c_shift
	tt_desc = "E Homo sapiens corydon horrificus" //this is a redspace clown
	faction = FACTION_CLOWN

<<<<<<< HEAD
/mob/living/simple_mob/clowns/big/c_shift/New()
	..()
	add_verb(src, /mob/living/simple_mob/clowns/big/c_shift/proc/phase_shift)
=======
/mob/living/simple_mob/clowns/big/c_shift/Initialize(mapload)
	. = ..()
	comp = LoadComponent(comp)
>>>>>>> 3e095bf5db ([MIRROR] Completes the /datum/component/shadekin work (#11148))
