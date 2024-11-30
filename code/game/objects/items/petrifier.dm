/obj/item/petrifier
	name = "odd button"
	desc = "A metal device with a single, purple button on it, and a tiny interface."
	icon = 'icons/obj/machines/petrification.dmi'
	icon_state = "petrifier"

	var/mob/living/carbon/human/target
	var/identifier = "statue"
	var/material = "stone"
	var/adjective = "hardens"
	var/tint = "#FFFFFF"
	var/discard_clothes = TRUE
	var/able_to_unpetrify = TRUE
	var/obj/machinery/petrification/linked

/obj/item/petrifier/Initialize(mapload, var/to_link)
	. = ..()
	linked = to_link

/obj/item/petrifier/attack_self(var/mob/user)
	. = ..()
	if (!isturf(user.loc) && user.get_ultimate_mob() != target)
		to_chat(user, "<span class='warning'>The device beeps but does nothing.</span>")
		return
<<<<<<< HEAD:modular_chomp/code/game/objects/items/petrifier.dm
	if (linked?.petrify(src))
		visible_message("<span class='notice'>A ray of purple light streams out of \the [src], aimed directly at [target]. Everywhere the light touches on them quickly [adjective] into [material].</span>")
		to_chat(user, "<span class='warning'>The device fizzles and crumbles into dust.</span>")
=======
	if (linked?.petrify(user, src))
		visible_message(span_notice("A ray of purple light streams out of \the [src], aimed directly at [target]. Everywhere the light touches on them quickly [adjective] into [material]."))
		to_chat(user, span_warning("The device fizzles and crumbles into dust."))
>>>>>>> 03e4547819 ([MIRROR] up ports misc gripper, gargoyle, petrification, some message fixes (#9566)):code/game/objects/items/petrifier.dm
		qdel(src)
