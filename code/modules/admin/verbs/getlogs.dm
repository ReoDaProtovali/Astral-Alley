//This proc allows download of past server logs saved within the data/logs/ folder.
//It works similarly to show-server-log.
/client/proc/getserverlog()
	set name = "Get Server Logs"
	set desc = "Fetch logfiles from data/logs"
	set category = "Admin.Logs"
	browseserverlogs()


/client/proc/browseserverlogs(current=FALSE, runtimes=FALSE)
	var/log_choice = BROWSE_ROOT_ALL_LOGS
	if(current)
		log_choice = BROWSE_ROOT_CURRENT_LOGS
	else if (runtimes)
		log_choice = BROWSE_ROOT_RUNTIME_LOGS
	var/path = browse_files(log_choice)
	feedback_add_details("admin_verb","VTL") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!
	if(!path)
		return

	if(file_spam_check())
		return

	message_admins("[key_name_admin(src)] accessed file: [path]")
<<<<<<< HEAD
	src << run( file(path) )
	to_chat(src, "Attempting to send file, this may take a fair few minutes if the file is very large.")
	return


//Other log stuff put here for the sake of organisation

//Shows today's server log
/datum/admins/proc/view_txt_log()
	set category = "Admin.Logs"
	set name = "Show Server Log"
	set desc = "Shows today's server log."

	var/path = "[log_path].log"
	if( fexists(path) )
		src << run( file(path) )
	else
		to_chat(src, span_red("Error: view_txt_log(): File not found/Invalid path([path])."))
		return
	feedback_add_details("admin_verb","VTL") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!
	return

//Shows today's attack log
/datum/admins/proc/view_atk_log()
	set category = "Admin.Logs"
	set name = "Show Server Attack Log"
	set desc = "Shows today's server attack log."

	to_chat(usr, "This verb doesn't actually do anything.")

	/*
	var/path = "data/logs/[time2text(world.realtime,"YYYY/MM-Month/DD-Day")] Attack.log"
	if( fexists(path) )
		src << run( file(path) )
	else
		to_chat(src, "<font color='red'>Error: view_atk_log(): File not found/Invalid path([path]).</font>")
		return
	usr << run( file(path) )
	feedback_add_details("admin_verb","SSAL") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!
	return
	*/
=======
	switch(tgui_alert(src,"View (in game), Open (in your system's text editor), or Download?", path, list("View", "Open", "Download")))
		if ("View")
			src << browse("<html><pre style='word-wrap: break-word;'>[html_encode(file2text(file(path)))]</pre></html>", list2params(list("window" = "viewfile.[path]")))
		if ("Open")
			src << run(file(path))
		if ("Download")
			src << ftp(file(path))
		else
			return
	to_chat(src, "Attempting to send [path], this may take a fair few minutes if the file is very large.", confidential = TRUE)
>>>>>>> 11a5a81208 ([MIRROR] Server logs (#10486))
