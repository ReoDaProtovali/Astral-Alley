// CHOMPEdit Start
/obj/effect/plant/HasProximity(turf/T, datum/weakref/WF, old_loc)
	SIGNAL_HANDLER
	if(isnull(WF))
		return
	var/atom/movable/AM = WF.resolve()
	if(isnull(AM))
		log_debug("DEBUG: HasProximity called with [AM] on [src] ([usr]).")
		return
// CHOMPEdit End
	if(!is_mature() || seed.get_trait(TRAIT_SPREAD) != 2)
		return

	var/mob/living/M = AM
	if(!istype(M))
		return

	if(M.is_incorporeal()) // CHOMPEdit - Don't buckle phased entities.
		return

	if(!has_buckled_mobs() && !M.buckled && !M.anchored && (issmall(M) || prob(round(seed.get_trait(TRAIT_POTENCY)/3))))
		//wait a tick for the Entered() proc that called HasProximity() to finish (and thus the moving animation),
		//so we don't appear to teleport from two tiles away when moving into a turf adjacent to vines.
		spawn(1)
			entangle(M)

/obj/effect/plant/Moved(atom/old_loc, direction, forced = FALSE)
	. = ..()
	if(seed.get_trait(TRAIT_SPREAD)==2)
		if(isturf(old_loc))
			unsense_proximity(callback = TYPE_PROC_REF(/atom,HasProximity), center = old_loc) // CHOMPEdit
		if(isturf(loc))
			sense_proximity(callback = TYPE_PROC_REF(/atom,HasProximity)) // CHOMPEdit

/obj/effect/plant/attack_hand(var/mob/user)
	manual_unbuckle(user)

/obj/effect/plant/attack_generic(var/mob/user)
	manual_unbuckle(user)

/obj/effect/plant/Crossed(atom/movable/O)
	if(O.is_incorporeal())
		return
	if(isliving(O))
		trodden_on(O)

/obj/effect/plant/proc/trodden_on(var/mob/living/victim)
	if(!is_mature())
		return
	var/mob/living/carbon/human/H = victim
	if(prob(round(seed.get_trait(TRAIT_POTENCY)/3)))
		entangle(victim)
	if(istype(H) && H.shoes)
		return
	seed.do_thorns(victim,src)
	seed.do_sting(victim,src,pick("r_foot","l_foot","r_leg","l_leg"))

	if(seed.get_trait(TRAIT_SPORING) && prob(round(seed.get_trait(TRAIT_POTENCY)/2)))
		seed.create_spores(get_turf(victim))

/obj/effect/plant/proc/unbuckle()
	if(has_buckled_mobs())
		for(var/mob/living/L as anything in buckled_mobs)
			if(L.buckled == src)
				L.buckled = null
				L.anchored = initial(L.anchored)
				L.update_canmove()
		buckled_mobs = list()
	return

/obj/effect/plant/proc/manual_unbuckle(mob/user as mob)
	if(has_buckled_mobs())
		var/chance = 20
		if(seed)
			chance = round(100/(20*seed.get_trait(TRAIT_POTENCY)/100))
		if(prob(chance))
			for(var/mob/living/L as anything in buckled_mobs)
				if(!(user in buckled_mobs))
					L.visible_message(\
<<<<<<< HEAD
					"<b>\The [user]</b> frees \the [L] from \the [src].",\
					"<b>\The [user]</b> frees you from \the [src].",\
					"<span class='warning'>You hear shredding and ripping.</span>")
				else
					L.visible_message(\
					"<b>\The [L]</b> struggles free of \the [src].",\
					"<span class='notice'>You untangle \the [src] from around yourself.</span>",\
					"<span class='warning'>You hear shredding and ripping.</span>")
=======
					span_infoplain(span_bold("\The [user]") + " frees \the [L] from \the [src]."),\
					span_infoplain(span_bold("\The [user]") + " frees you from \the [src]."),\
					span_warning("You hear shredding and ripping."))
				else
					L.visible_message(\
					span_infoplain(span_bold("\The [L]") + " struggles free of \the [src]."),\
					span_notice("You untangle \the [src] from around yourself."),\
					span_warning("You hear shredding and ripping."))
>>>>>>> 7416cbea22 ([MIRROR] next set of spans (#9247))
				unbuckle()
		else
			user.setClickCooldown(user.get_attack_speed())
			health -= rand(1,5)
			var/text = pick("rip","tear","pull", "bite", "tug")
			user.visible_message(\
			"<span class='warning'>\The [user] [text]s at \the [src].</span>",\
			"<span class='warning'>You [text] at \the [src].</span>",\
			"<span class='warning'>You hear shredding and ripping.</span>")
			check_health()
			return

/obj/effect/plant/proc/entangle(var/mob/living/victim)

	if(has_buckled_mobs())
		return

	if(victim.buckled || victim.anchored)
		return

	//grabbing people
	if(!victim.anchored && Adjacent(victim) && victim.loc != src.loc)
		var/can_grab = 1
		if(istype(victim, /mob/living/carbon/human))
			var/mob/living/carbon/human/H = victim
			if(istype(H.shoes, /obj/item/clothing/shoes/magboots) && (H.shoes.item_flags & NOSLIP))
				can_grab = 0
		if(can_grab)
			src.visible_message("<span class='danger'>Tendrils lash out from \the [src] and drag \the [victim] in!</span>")
			victim.forceMove(src.loc)
			buckle_mob(victim)
			victim.set_dir(pick(cardinal))
			to_chat(victim, "<span class='danger'>Tendrils [pick("wind", "tangle", "tighten")] around you!</span>")
			victim.Weaken(0.5)
			seed.do_thorns(victim,src)
