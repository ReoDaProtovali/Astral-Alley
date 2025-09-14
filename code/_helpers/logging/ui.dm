<<<<<<< HEAD
/proc/log_href(text)
	//WRITE_LOG(GLOB.world_href_log, "HREF: [text]")
	WRITE_LOG(href_logfile, "HREF: [text]")
=======
/proc/log_href(text, list/data)
	logger.Log(LOG_CATEGORY_HREF, text, data)
>>>>>>> 5a62077f2c ([MIRROR] JSON Logging Refactor (#11623))

/**
 * Appends a tgui-related log entry. All arguments are optional.
 */
/proc/log_tgui(
	user,
	message,
	context,
	datum/tgui_window/window,
	datum/src_object,
)

	var/entry = ""
	// Insert user info
	if(!user)
		entry += "<nobody>"
	else if(istype(user, /mob))
		var/mob/mob = user
		entry += "[mob.ckey] (as [mob] at [mob.x],[mob.y],[mob.z])"
	else if(istype(user, /client))
		var/client/client = user
		entry += "[client.ckey]"
	// Insert context
	if(context)
		entry += " in [context]"
	else if(window)
		entry += " in [window.id]"
	// Resolve src_object
	if(!src_object && window?.locked_by)
		src_object = window.locked_by.src_object
	// Insert src_object info
	if(src_object)
		entry += "\nUsing: [src_object.type] [REF(src_object)]"
	// Insert message
	if(message)
		entry += "\n[message]"
<<<<<<< HEAD
	//WRITE_LOG(GLOB.tgui_log, entry)
	WRITE_LOG(diary, entry)
=======
	logger.Log(LOG_CATEGORY_HREF_TGUI, entry)
>>>>>>> 5a62077f2c ([MIRROR] JSON Logging Refactor (#11623))
