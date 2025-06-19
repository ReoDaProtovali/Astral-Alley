/datum/admin_secret_item/admin_secret/show_signalers
	name = "Show Last Signalers"

/datum/admin_secret_item/admin_secret/show_signalers/name()
	return "Show Last [length(lastsignalers)] Signaler\s"

/datum/admin_secret_item/admin_secret/show_signalers/execute(var/mob/user)
	. = ..()
	if(!.)
		return

	var/dat = span_bold("Showing last [length(lastsignalers)] signalers.") + "<HR>"
	for(var/sig in lastsignalers)
		dat += "[sig]<BR>"

	var/datum/browser/popup = new(user, "lastsignalers", "Last Signallers", 800, 500)
	popup.set_content(dat)
	popup.open()
