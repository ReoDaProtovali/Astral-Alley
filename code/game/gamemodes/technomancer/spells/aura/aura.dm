/obj/item/weapon/spell/aura
	name = "aura template"
	desc = "If you can read me, the game broke!  Yay!"
	icon_state = "generic"
	cast_methods = null
	aspect = null
	var/glow_color = "#FFFFFF"

<<<<<<< HEAD
/obj/item/weapon/spell/aura/New()
	..()
=======
/obj/item/spell/aura/Initialize(mapload)
	. = ..()
>>>>>>> fe69ddd909 ([MIRROR] some more NEW to init (#10148))
	set_light(calculate_spell_power(7), calculate_spell_power(4), l_color = glow_color)
	START_PROCESSING(SSobj, src)
	log_and_message_admins("has started casting [src].")

/obj/item/weapon/spell/aura/Destroy()
	STOP_PROCESSING(SSobj, src)
	log_and_message_admins("has stopped maintaining [src].")
	return ..()

/obj/item/weapon/spell/aura/process()
	return
