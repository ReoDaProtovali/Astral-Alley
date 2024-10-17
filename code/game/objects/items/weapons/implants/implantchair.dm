//This file was auto-corrected by findeclaration.exe on 25.5.2012 20:42:32

/obj/machinery/implantchair
	name = "loyalty implanter"
	desc = "Used to implant occupants with loyalty implants."
	icon = 'icons/obj/machines/implantchair.dmi'
	icon_state = "implantchair"
	density = TRUE
	opacity = 0
	anchored = TRUE

	var/ready = 1
	var/malfunction = 0
	var/list/obj/item/weapon/implant/loyalty/implant_list = list()
	var/max_implants = 5
	var/injection_cooldown = 600
	var/replenish_cooldown = 6000
	var/replenishing = 0
	var/mob/living/carbon/occupant = null
	var/injecting = 0

/obj/machinery/implantchair/New()
	..()
	add_implants()


/obj/machinery/implantchair/attack_hand(mob/user as mob)
	user.set_machine(src)
	var/health_text = ""
	if(src.occupant)
		if(src.occupant.health <= -100)
			health_text = "<FONT color=red>Dead</FONT>"
		else if(src.occupant.health < 0)
			health_text = "<FONT color=red>[round(src.occupant.health,0.1)]</FONT>"
		else
			health_text = "[round(src.occupant.health,0.1)]"

	var/dat =span_bold("Implanter Status") + "<BR>"

	dat +=span_bold("Current occupant:") + " [src.occupant ? "<BR>Name: [src.occupant]<BR>Health: [health_text]<BR>" : "<FONT color=red>None</FONT>"]<BR>"
	dat += span_bold("Implants:") + " [src.implant_list.len ? "[implant_list.len]" : "<A href='?src=\ref[src];replenish=1'>Replenish</A>"]<BR>"
	if(src.occupant)
		dat += "[src.ready ? "<A href='?src=\ref[src];implant=1'>Implant</A>" : "Recharging"]<BR>"
	user.set_machine(src)
	user << browse(dat, "window=implant")
	onclose(user, "implant")


/obj/machinery/implantchair/Topic(href, href_list)
	if((get_dist(src, usr) <= 1) || istype(usr, /mob/living/silicon/ai))
		if(href_list["implant"])
			if(src.occupant)
				injecting = 1
				go_out()
				ready = 0
				spawn(injection_cooldown)
					ready = 1

		if(href_list["replenish"])
			ready = 0
			spawn(replenish_cooldown)
				add_implants()
				ready = 1

		src.updateUsrDialog()
		src.add_fingerprint(usr)
		return


/obj/machinery/implantchair/attackby(var/obj/item/weapon/G as obj, var/mob/user as mob)
	if(istype(G, /obj/item/weapon/grab))
		var/obj/item/weapon/grab/grab = G
		if(!ismob(grab.affecting))
			return
		if(grab.affecting.has_buckled_mobs())
			to_chat(user, span("warning", "\The [grab.affecting] has other entities attached to them. Remove them first."))
			return
		var/mob/M = grab.affecting
		if(put_mob(M))
			qdel(G)
	src.updateUsrDialog()
	return


/obj/machinery/implantchair/proc/go_out(var/mob/M)
	if(!( src.occupant ))
		return
	if(M == occupant) // so that the guy inside can't eject himself -Agouri
		return
	if (src.occupant.client)
		src.occupant.client.eye = src.occupant.client.mob
		src.occupant.client.perspective = MOB_PERSPECTIVE
	src.occupant.loc = src.loc
	if(injecting)
		implant(src.occupant)
		injecting = 0
	src.occupant = null
	icon_state = "implantchair"
	return


/obj/machinery/implantchair/proc/put_mob(mob/living/carbon/M as mob)
	if(!iscarbon(M))
		to_chat(usr, "<span class='warning'>\The [src] cannot hold this!</span>")
		return
	if(src.occupant)
		to_chat(usr, "<span class='warning'>\The [src] is already occupied!</span>")
		return
	if(M.client)
		M.client.perspective = EYE_PERSPECTIVE
		M.client.eye = src
	M.stop_pulling()
	M.loc = src
	src.occupant = M
	src.add_fingerprint(usr)
	icon_state = "implantchair_on"
	return 1


/obj/machinery/implantchair/proc/implant(var/mob/M)
	if (!istype(M, /mob/living/carbon))
		return
	if(!implant_list.len)	return
	for(var/obj/item/weapon/implant/loyalty/imp in implant_list)
		if(!imp)	continue
		if(istype(imp, /obj/item/weapon/implant/loyalty))
			for (var/mob/O in viewers(M, null))
				O.show_message("<span class='warning'>\The [M] has been implanted by \the [src].</span>", 1)

			if(imp.handle_implant(M, BP_TORSO))
				imp.post_implant(M)

			implant_list -= imp
			break
	return


/obj/machinery/implantchair/proc/add_implants()
	for(var/i=0, i<src.max_implants, i++)
		var/obj/item/weapon/implant/loyalty/I = new /obj/item/weapon/implant/loyalty(src)
		implant_list += I
	return

/obj/machinery/implantchair/verb/get_out()
	set name = "Eject occupant"
	set category = "Object"
	set src in oview(1)
	if(usr.stat != 0)
		return
	src.go_out(usr)
	add_fingerprint(usr)
	return


/obj/machinery/implantchair/verb/move_inside()
	set name = "Move Inside"
	set category = "Object"
	set src in oview(1)
	if(usr.stat != 0 || stat & (NOPOWER|BROKEN))
		return
	put_mob(usr)
	return
