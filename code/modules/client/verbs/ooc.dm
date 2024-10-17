
/client/verb/ooc(msg as text)
	set name = "OOC"
	set category = "OOC.Chat" //CHOMPEdit

	if(say_disabled)	//This is here to try to identify lag problems
		to_chat(usr, "<span class='warning'>Speech is currently admin-disabled.</span>")
		return

	if(!mob)	return
	if(IsGuestKey(key))
		to_chat(src, "Guests may not use OOC.")
		return

	msg = sanitize(msg)
	if(!msg)	return

	if(!is_preference_enabled(/datum/client_preference/show_ooc))
		to_chat(src, "<span class='warning'>You have OOC muted.</span>")
		return

	if(!holder)
		if(!CONFIG_GET(flag/ooc_allowed)) // CHOMPEdit
			to_chat(src, "<span class='danger'>OOC is globally muted.</span>")
			return
		if(!CONFIG_GET(flag/dooc_allowed) && (mob.stat == DEAD)) // CHOMPEdit
			to_chat(usr, "<span class='danger'>OOC for dead mobs has been turned off.</span>")
			return
		if(prefs.muted & MUTE_OOC)
			to_chat(src, "<span class='danger'>You cannot use OOC (muted).</span>")
			return
		if(findtext(msg, "byond://") && !CONFIG_GET(flag/allow_byond_links)) // CHOMPEdit
			to_chat(src, "<B>Advertising other servers is not allowed.</B>")
			log_admin("[key_name(src)] has attempted to advertise in OOC: [msg]")
			message_admins("[key_name_admin(src)] has attempted to advertise in OOC: [msg]")
			return
		if(findtext(msg, "discord.gg") && !CONFIG_GET(flag/allow_discord_links)) // CHOMPEdit
			to_chat(src, "<B>Advertising discords is not allowed.</B>")
			log_admin("[key_name(src)] has attempted to advertise a discord server in OOC: [msg]")
			message_admins("[key_name_admin(src)] has attempted to advertise a discord server in OOC: [msg]")
			return
		if((findtext(msg, "http://") || findtext(msg, "https://")) && !CONFIG_GET(flag/allow_url_links)) // CHOMPEdit
			to_chat(src, "<B>Posting external links is not allowed.</B>")
			log_admin("[key_name(src)] has attempted to post a link in OOC: [msg]")
			message_admins("[key_name_admin(src)] has attempted to post a link in OOC: [msg]")
			return

	log_ooc(msg, src)

	if(msg)
		handle_spam_prevention(MUTE_OOC)

	var/ooc_style = "everyone"
	if(holder && !holder.fakekey)
		ooc_style = "elevated"

		if(holder.rights & R_EVENT) //Retired Admins
			ooc_style = "event_manager"
		if(holder.rights & R_ADMIN && !(holder.rights & R_BAN)) //Game Masters
			ooc_style = "moderator"
		if(holder.rights & R_DEBUG && !(holder.rights & R_BAN)) //Developers
			ooc_style = "developer"
		if(holder.rights & R_ADMIN && holder.rights & R_BAN) //Admins
			ooc_style = "admin"

	msg = GLOB.is_valid_url.Replace(msg,"<span class='linkify'>$1</span>")

	for(var/client/target in GLOB.clients)
		if(target.is_preference_enabled(/datum/client_preference/show_ooc))
			if(target.is_key_ignored(key)) // If we're ignored by this person, then do nothing.
				continue
			var/display_name = src.key
			if(holder)
				if(holder.fakekey)
					if(target.holder)
						display_name = "[holder.fakekey]/([src.key])"
					else
						display_name = holder.fakekey
			if(holder && !holder.fakekey && (holder.rights & R_ADMIN|R_FUN|R_EVENT) && CONFIG_GET(flag/allow_admin_ooccolor) && (src.prefs.ooccolor != initial(src.prefs.ooccolor))) // keeping this for the badmins // CHOMPEdit
				to_chat(target, "<span class='ooc'><font color='[src.prefs.ooccolor]'>" + create_text_tag("ooc", "OOC:", target) + " <EM>[display_name]:</EM> <span class='message'>[msg]</span></font></span>")
			else
				to_chat(target, "<span class='ooc'><span class='[ooc_style]'>" + create_text_tag("ooc", "OOC:", target) + " <EM>[display_name]:</EM> <span class='message'>[msg]</span></span></span>")

/client/verb/looc(msg as text)
	set name = "LOOC"
	set desc = "Local OOC, seen only by those in view."
	set category = "OOC.Chat" //CHOMPEdit

	if(say_disabled)	//This is here to try to identify lag problems
		to_chat(usr, "<span class='danger'>Speech is currently admin-disabled.</span>")
		return

	if(!mob)
		return

	if(IsGuestKey(key))
		to_chat(src, "Guests may not use OOC.")
		return

	msg = sanitize(msg)
	if(!msg)
		return

	if(!is_preference_enabled(/datum/client_preference/show_looc))
		to_chat(src, "<span class='danger'>You have LOOC muted.</span>")
		return

	if(!holder)
		if(!CONFIG_GET(flag/looc_allowed)) // CHOMPEdit
			to_chat(src, "<span class='danger'>LOOC is globally muted.</span>")
			return
		if(!CONFIG_GET(flag/dooc_allowed) && (mob.stat == DEAD)) // CHOMPEdit
			to_chat(usr, "<span class='danger'>OOC for dead mobs has been turned off.</span>")
			return
		if(prefs.muted & MUTE_LOOC)
			to_chat(src, "<span class='danger'>You cannot use OOC (muted).</span>")
			return
		if(findtext(msg, "byond://") && !CONFIG_GET(flag/allow_byond_links)) // CHOMPEdit
			to_chat(src, "<B>Advertising other servers is not allowed.</B>")
			log_admin("[key_name(src)] has attempted to advertise in OOC: [msg]")
			message_admins("[key_name_admin(src)] has attempted to advertise in OOC: [msg]")
			return
		if(findtext(msg, "discord.gg") && !CONFIG_GET(flag/allow_discord_links)) // CHOMPEdit
			to_chat(src, "<B>Advertising discords is not allowed.</B>")
			log_admin("[key_name(src)] has attempted to advertise a discord server in OOC: [msg]")
			message_admins("[key_name_admin(src)] has attempted to advertise a discord server in OOC: [msg]")
			return
		if((findtext(msg, "http://") || findtext(msg, "https://")) && !CONFIG_GET(flag/allow_url_links)) // CHOMPEdit
			to_chat(src, "<B>Posting external links is not allowed.</B>")
			log_admin("[key_name(src)] has attempted to post a link in OOC: [msg]")
			message_admins("[key_name_admin(src)] has attempted to post a link in OOC: [msg]")
			return

	log_looc(msg,src)

	if(msg)
		handle_spam_prevention(MUTE_LOOC)

	var/mob/source = mob.get_looc_source()
	var/turf/T = get_turf(source)
	if(!T) return
	var/list/in_range = get_mobs_and_objs_in_view_fast(T,world.view,0)
	var/list/m_viewers = in_range["mobs"]

	var/list/receivers = list() //Clients, not mobs.
	var/list/r_receivers = list()

	var/display_name = key
	if(holder && holder.fakekey)
		display_name = holder.fakekey
	if(mob.stat != DEAD)
		display_name = mob.name

	if(ishuman(mob))
		var/mob/living/carbon/human/H = mob
		if(H.original_player && H.original_player != H.ckey) //In a body not their own
			display_name = "[H.mind.name] (as [H.name])"


	// Everyone in normal viewing range of the LOOC
	for(var/mob/viewer in m_viewers)
		if(viewer.client && viewer.client.is_preference_enabled(/datum/client_preference/show_looc))
			receivers |= viewer.client
		else if(istype(viewer,/mob/observer/eye)) // For AI eyes and the like
			var/mob/observer/eye/E = viewer
			if(E.owner && E.owner.client)
				receivers |= E.owner.client

	// Admins with RLOOC displayed who weren't already in
	for(var/client/admin in GLOB.admins)
		if(!(admin in receivers) && admin.is_preference_enabled(/datum/client_preference/holder/show_rlooc))
			if(check_rights(R_ADMIN|R_SERVER, FALSE, admin)) //Stop rLOOC showing for retired staff //CHOMPEdit, admins should see LOOC
				r_receivers |= admin

	msg = GLOB.is_valid_url.Replace(msg,"<span class='linkify'>$1</span>")

	// Send a message
	for(var/client/target in receivers)
		var/admin_stuff = ""

		if(target in GLOB.admins)
			admin_stuff += "/([key])"

		to_chat(target, "<span class='looc'>" + create_text_tag("looc", "LOOC:", target) + " <EM>[display_name][admin_stuff]:</EM> <span class='message'>[msg]</span></span>")

	for(var/client/target in r_receivers)
		var/admin_stuff = "/([key])([admin_jump_link(mob, target.holder)])"

		to_chat(target, "<span class='rlooc'>" + create_text_tag("rlooc", "RLOOC:", target) + " <span class='prefix'>(R)</span><EM>[display_name][admin_stuff]:</EM> <span class='message'>[msg]</span></span>")

/mob/proc/get_looc_source()
	return src

/mob/living/silicon/ai/get_looc_source()
	if(eyeobj)
		return eyeobj
	return src
<<<<<<< HEAD
//CHOMPEdit Begin
=======

/client/verb/fit_viewport()
	set name = "Fit Viewport"
	set category = "OOC.Client Settings" //CHOMPEdit
	set desc = "Fit the width of the map window to match the viewport"

	// Fetch aspect ratio
	var/view_size = getviewsize(view)
	var/aspect_ratio = view_size[1] / view_size[2]

	// Calculate desired pixel width using window size and aspect ratio
	var/list/sizes = params2list(winget(src, "mainwindow.mainvsplit;mapwindow", "size"))

	// Client closed the window? Some other error? This is unexpected behaviour, let's
	// CRASH with some info.
	if(!sizes["mapwindow.size"])
		CRASH("sizes does not contain mapwindow.size key. This means a winget failed to return what we wanted. --- sizes var: [sizes] --- sizes length: [length(sizes)]")

	var/list/map_size = splittext(sizes["mapwindow.size"], "x")

	// Gets the type of zoom we're currently using from our view datum
	// If it's 0 we do our pixel calculations based off the size of the mapwindow
	// If it's not, we already know how big we want our window to be, since zoom is the exact pixel ratio of the map
	var/zoom_value = 0 // src.view_size?.zoom || 0

	var/desired_width = 0
	if(zoom_value)
		desired_width = round(view_size[1] * zoom_value * world.icon_size)
	else

		// Looks like we expect mapwindow.size to be "ixj" where i and j are numbers.
		// If we don't get our expected 2 outputs, let's give some useful error info.
		if(length(map_size) != 2)
			CRASH("map_size of incorrect length --- map_size var: [map_size] --- map_size length: [length(map_size)]")
		var/height = text2num(map_size[2])
		desired_width = round(height * aspect_ratio)

	if (text2num(map_size[1]) == desired_width)
		// Nothing to do
		return

	var/split_size = splittext(sizes["mainwindow.mainvsplit.size"], "x")
	var/split_width = text2num(split_size[1])

	// Avoid auto-resizing the statpanel and chat into nothing.
	desired_width = min(desired_width, split_width - 300)

	// Calculate and apply a best estimate
	// +4 pixels are for the width of the splitter's handle
	var/pct = 100 * (desired_width + 4) / split_width
	winset(src, "mainwindow.mainvsplit", "splitter=[pct]")

	// Apply an ever-lowering offset until we finish or fail
	var/delta
	for(var/safety in 1 to 10)
		var/after_size = winget(src, "mapwindow", "size")
		map_size = splittext(after_size, "x")
		var/got_width = text2num(map_size[1])

		if (got_width == desired_width)
			// success
			return
		else if (isnull(delta))
			// calculate a probable delta value based on the difference
			delta = 100 * (desired_width - got_width) / split_width
		else if ((delta > 0 && got_width > desired_width) || (delta < 0 && got_width < desired_width))
			// if we overshot, halve the delta and reverse direction
			delta = -delta/2

		pct += delta
		winset(src, "mainwindow.mainvsplit", "splitter=[pct]")

/// Attempt to automatically fit the viewport, assuming the user wants it
/client/proc/attempt_auto_fit_viewport()
	if(!prefs.read_preference(/datum/preference/toggle/auto_fit_viewport))
		return
	if(fully_created)
		INVOKE_ASYNC(src, VERB_REF(fit_viewport))
	else //Delayed to avoid wingets from Login calls.
		addtimer(CALLBACK(src, VERB_REF(fit_viewport), 1 SECONDS))

>>>>>>> 4d9879937f ([MIRROR] Port tg statpanel (#9242))
/client/verb/fix_stat_panel()
	set name = "Fix Stat Panel"
	set hidden = TRUE

	init_verbs()
<<<<<<< HEAD
//CHOMPEdit End
=======
>>>>>>> 4d9879937f ([MIRROR] Port tg statpanel (#9242))
