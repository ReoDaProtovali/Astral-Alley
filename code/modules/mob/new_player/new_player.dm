//This file was auto-corrected by findeclaration.exe on 25.5.2012 20:42:33

/mob/new_player
	var/ready = 0
	var/spawning = 0			//Referenced when you want to delete the new_player later on in the code.
	var/totalPlayers = 0		//Player counts for the Lobby tab
	var/totalPlayersReady = 0
	var/show_hidden_jobs = 0	//Show jobs that are set to "Never" in preferences
	var/has_respawned = FALSE	//Determines if we're using RESPAWN_MESSAGE
	var/datum/browser/panel
	universal_speak = 1

	invisibility = 101

	density = FALSE
	stat = 2
	canmove = 0

	anchored = TRUE	//  don't get pushed around

	var/created_for

/mob/new_player/New()
	mob_list += src
	add_verb(src,/mob/proc/insidePanel) //CHOMPEdit TGPanel
	//CHOMPEdit Begin
	if(length(GLOB.newplayer_start))
		forceMove(pick(GLOB.newplayer_start))
	else
		forceMove(locate(1,1,1))
	//CHOMPEdit End
	flags |= ATOM_INITIALIZED // Explicitly don't use Initialize().  New players join super early and use New() //CHOMPEdit


/mob/new_player/Destroy()
	if(panel)
		QDEL_NULL(panel)
	. = ..()

/mob/new_player/verb/new_player_panel()
	set src = usr
	new_player_panel_proc()


/mob/new_player/proc/new_player_panel_proc()
	var/output = "<div align='center'>"

	output += "<b>Map:</b> [using_map.full_name]<br>"
	output += "<b>Station Time:</b> [stationtime2text()]<br>"

	if(!ticker || ticker.current_state <= GAME_STATE_PREGAME)
		output += "<b>Server Initializing!</b>"
	else
		output += "<b>Round Duration:</b> [roundduration2text()]<br>"
	output += "<hr>"

	output += "<p><a href='byond://?src=\ref[src];show_preferences=1'>Character Setup</A></p>"

	if(!ticker || ticker.current_state <= GAME_STATE_PREGAME)
		if(ready)
			output += "<p>\[ <span class='linkOn'><b>Ready</b></span> | <a href='byond://?src=\ref[src];ready=0'>Not Ready</a> \]</p>" //ChompEDIT - fixed height
		else
			output += "<p>\[ <a href='byond://?src=\ref[src];ready=1'>Ready</a> | <span class='linkOn'><b>Not Ready</b></span> \]</p>" //ChompEDIT - fixed height
		output += "<p><s>Join Game!</s></p>" //ChompEDIT - fixed height

	else
		output += "<p><a href='byond://?src=\ref[src];manifest=1'>View the Crew Manifest</A></p>" //ChompEDIT - fixed height
		output += "<p><a href='byond://?src=\ref[src];late_join=1'>Join Game!</A></p>"

	output += "<p><a href='byond://?src=\ref[src];observe=1'>Observe</A></p>"

	output += "<hr>" //ChompADD - a line divider between functional and info buttons

	//nobody uses this feature //WELL WE'RE GONNA
	if(!IsGuestKey(src.key))
		establish_db_connection()

		if(SSdbcore.IsConnected()) //CHOMPEdit TGSQL
			var/isadmin = 0
			if(src.client && src.client.holder)
				isadmin = 1
			var/datum/db_query/query = SSdbcore.NewQuery("SELECT id FROM erro_poll_question WHERE [(isadmin ? "" : "adminonly = false AND")] Now() BETWEEN starttime AND endtime AND id NOT IN (SELECT pollid FROM erro_poll_vote WHERE ckey = :t_ckey) AND id NOT IN (SELECT pollid FROM erro_poll_textreply WHERE ckey = :t_ckey)",list("t_ckey" = ckey)) //CHOMPEdit TGSQL
			query.Execute()
			var/newpoll = 0
			while(query.NextRow())
				newpoll = 1
				break
			qdel(query) //CHOMPEdit TGSQL
			if(newpoll)
				output += "<p><b><a href='byond://?src=\ref[src];showpoll=1'>Show Player Polls</A><br>(NEW!)</b></p>" //ChompEDIT - fixed height
			else
				output += "<p><a href='byond://?src=\ref[src];showpoll=1'>Show Player Polls</A><br><i>No Changes</i></p>" //ChompEDIT - fixed height

	if(client?.check_for_new_server_news())
		output += "<p><b><a href='byond://?src=\ref[src];shownews=1'>Show Server News</A><br>(NEW!)</b></p>" //ChompEDIT 'Game updates' --> 'Server news'
	else
		output += "<p><a href='byond://?src=\ref[src];shownews=1'>Show Server News</A><br><i>No Changes</i></p>" //ChompEDIT 'Game updates' --> 'Server news'

	if(SSsqlite.can_submit_feedback(client))
		output += "<p>[href(src, list("give_feedback" = 1), "Give Feedback")]</p>"

	if(GLOB.news_data.station_newspaper)
		if(client.prefs.lastlorenews == GLOB.news_data.newsindex)
			output += "<p><a href='byond://?src=\ref[src];open_station_news=1'>Show [using_map.station_name] News<br><i>No Changes</i></A></p>" //ChompEDIT - fixed height
		else
			output += "<p><b><a href='byond://?src=\ref[src];open_station_news=1'>Show [using_map.station_name] News<br>(NEW!)</A></b></p>" //ChompEDIT - fixed height

	//ChompEDIT start: Show Changelog
	if(client.prefs.lastchangelog == changelog_hash)
		output += "<p><a href='byond://?src=\ref[src];open_changelog=1'>Show Changelog</A><br><i>No Changes</i></p>"
	else
		output += "<p><b><a href='byond://?src=\ref[src];open_changelog=1'>Show Changelog</A><br>(NEW!)</b></p>"
	//ChompEDIT End

	output += "</div>"

	if (client.prefs.lastlorenews == GLOB.news_data.newsindex)
		client.seen_news = 1

	if(GLOB.news_data.station_newspaper && !client.seen_news && client.is_preference_enabled(/datum/client_preference/show_lore_news))
		show_latest_news(GLOB.news_data.station_newspaper)
		client.prefs.lastlorenews = GLOB.news_data.newsindex
		SScharacter_setup.queue_preferences_save(client.prefs)

	panel = new(src, "Welcome","Welcome", 210, 500, src) // VOREStation Edit //ChompEDIT, height 320 -> 500
	panel.set_window_options("can_close=0")
	panel.set_content(output)
	panel.open()
	return

//CHOMPEdit Begin
/mob/new_player/get_status_tab_items()
	. = ..()
	. += ""

	. += "Game Mode: [SSticker.hide_mode ? "Secret" : "[config.mode_names[master_mode]]"]"

	//if(SSvote.mode)
	//	. += "Vote: [capitalize(SSvote.mode)] Time Left: [SSvote.time_remaining] s"

	if(SSticker.current_state == GAME_STATE_INIT)
		. += "Time To Start: Server Initializing"

	else if(SSticker.current_state == GAME_STATE_PREGAME)
		. += "Time To Start: [round(SSticker.pregame_timeleft,1)][round_progressing ? "" : " (DELAYED)"]"
		. += "Players: [totalPlayers]"
		. += "Players Ready: [totalPlayersReady]"
		totalPlayers = 0
		totalPlayersReady = 0
		var/datum/job/refJob = null
		for(var/mob/new_player/player in player_list)
			refJob = player.client.prefs.get_highest_job()
			if(player.client.prefs.obfuscate_key && player.client.prefs.obfuscate_job)
				. += "Anonymous User [player.ready ? "Ready!" : null]"
			else if(player.client.prefs.obfuscate_key)
				. += "Anonymous User [player.ready ? "(Playing as: [refJob ? refJob.title : "Unknown"])" : null]"
			else if(player.client.prefs.obfuscate_job)
				. += "[player.key] [player.ready ? "Ready!" : null]"
			else
				. += "[player.key] [player.ready ? "(Playing as: [refJob ? refJob.title : "Unknown"])" : null]"
			totalPlayers++
			if(player.ready)totalPlayersReady++
//CHOMPEdit End

/mob/new_player/Topic(href, href_list[])
	if(!client)	return 0

	if(href_list["show_preferences"])
		client.prefs.ShowChoices(src)
		return 1

	if(href_list["ready"])
		if(!ticker || ticker.current_state <= GAME_STATE_PREGAME) // Make sure we don't ready up after the round has started
			ready = text2num(href_list["ready"])
		else
			ready = 0

	if(href_list["refresh"])
		//src << browse(null, "window=playersetup") //closes the player setup window
		panel.close()
		new_player_panel_proc()

	if(href_list["observe"])
		if(tgui_alert(src,"Are you sure you wish to observe? If you do, make sure to not use any knowledge gained from observing if you decide to join later.","Observe Round?",list("Yes","No")) == "Yes")
			if(!client)	return 1

			//Make a new mannequin quickly, and allow the observer to take the appearance
			var/mob/living/carbon/human/dummy/mannequin = get_mannequin(client.ckey)
			client.prefs.dress_preview_mob(mannequin)
			var/mob/observer/dead/observer = new(mannequin)
			observer.moveToNullspace() //Let's not stay in our doomed mannequin
			//qdel(mannequin)

			spawning = 1
			if(client.media)
				client.media.stop_music() // MAD JAMS cant last forever yo

			observer.started_as_observer = 1
			close_spawn_windows()
			var/obj/O = locate("landmark*Observer-Start")
			if(istype(O))
				to_chat(src, "<span class='notice'>Now teleporting.</span>")
				observer.forceMove(O.loc)
			else
				to_chat(src, "<span class='danger'>Could not locate an observer spawn point. Use the Teleport verb to jump to the station map.</span>")

			announce_ghost_joinleave(src)

			if(client.prefs.be_random_name)
				client.prefs.real_name = random_name(client.prefs.identifying_gender)
			observer.real_name = client.prefs.real_name
			observer.name = observer.real_name
			if(!client.holder && !CONFIG_GET(flag/antag_hud_allowed))           // For new ghosts we remove the verb from even showing up if it's not allowed. // CHOMPEdit
				remove_verb(observer, /mob/observer/dead/verb/toggle_antagHUD) //CHOMPEdit        // Poor guys, don't know what they are missing!
			observer.key = key
			observer.set_respawn_timer(time_till_respawn()) // Will keep their existing time if any, or return 0 and pass 0 into set_respawn_timer which will use the defaults
			observer.client.init_verbs()
			qdel(src)

			return TRUE

	if(href_list["late_join"])

		if(!ticker || ticker.current_state != GAME_STATE_PLAYING)
			to_chat(usr, span_red("The round is either not ready, or has already finished..."))
			return

		var/time_till_respawn = time_till_respawn()
		if(time_till_respawn == -1) // Special case, never allowed to respawn
			to_chat(usr, "<span class='warning'>Respawning is not allowed!</span>")
		else if(time_till_respawn) // Nonzero time to respawn
			to_chat(usr, "<span class='warning'>You can't respawn yet! You need to wait another [round(time_till_respawn/10/60, 0.1)] minutes.</span>")
			return
/*
		if(client.prefs.species != "Human" && !check_rights(R_ADMIN, 0)) //VORESTATION EDITS: THE COMMENTED OUT AREAS FROM LINE 154 TO 178
			if (config.usealienwhitelist)
				if(!is_alien_whitelisted(src, client.prefs.species))
					tgui_alert(src, "You are currently not whitelisted to Play [client.prefs.species].")
					return 0
*/
		LateChoices()

	if(href_list["manifest"])
		ViewManifest()

	if(href_list["SelectedJob"])

		/* Vorestation Removal Start
		//Prevents people rejoining as same character.
		for (var/mob/living/carbon/human/C in mob_list)
			var/char_name = client.prefs.real_name
			if(char_name == C.real_name)
				to_chat(usr, "<span class='notice'>There is a character that already exists with the same name - <b>[C.real_name]</b>, please join with a different one, or use Quit the Round with the previous character.</span>") //VOREStation Edit
				return
		*/ //Vorestation Removal End

		if(!CONFIG_GET(flag/enter_allowed)) // CHOMPEdit
			to_chat(usr, "<span class='notice'>There is an administrative lock on entering the game!</span>")
			return
		else if(ticker && ticker.mode && ticker.mode.explosion_in_progress)
			to_chat(usr, "<span class='danger'>The station is currently exploding. Joining would go poorly.</span>")
			return

		if(!is_alien_whitelisted(src, GLOB.all_species[client.prefs.species]))
			tgui_alert(src, "You are currently not whitelisted to play [client.prefs.species].")
			return 0

		var/datum/species/S = GLOB.all_species[client.prefs.species]

		if(!(S.spawn_flags & SPECIES_CAN_JOIN))
			tgui_alert_async(src,"Your current species, [client.prefs.species], is not available for play on the station.")
			return 0

		AttemptLateSpawn(href_list["SelectedJob"],client.prefs.spawnpoint)
		return

	if(href_list["privacy_poll"])
		establish_db_connection()
		if(!SSdbcore.IsConnected()) //CHOMPEdit TGSQL
			return
		var/voted = 0

		//First check if the person has not voted yet.
		var/datum/db_query/query = SSdbcore.NewQuery("SELECT * FROM erro_privacy WHERE ckey=:t_ckey", list("t_ckey" = src.ckey)) //CHOMPEdit TGSQL
		query.Execute()
		while(query.NextRow())
			voted = 1
			break
		qdel(query) //CHOMPEdit TGSQL
		//This is a safety switch, so only valid options pass through
		var/option = "UNKNOWN"
		switch(href_list["privacy_poll"])
			if("signed")
				option = "SIGNED"
			if("anonymous")
				option = "ANONYMOUS"
			if("nostats")
				option = "NOSTATS"
			if("later")
				usr << browse(null,"window=privacypoll")
				return
			if("abstain")
				option = "ABSTAIN"

		if(option == "UNKNOWN")
			return

		if(!voted)
			var/list/sqlargs = list("t_ckey" = src.ckey, "t_option" = "[option]") //CHOMPEdit TGSQL
			var/sql = "INSERT INTO erro_privacy VALUES (null, Now(), :t_ckey, :t_option)" //CHOMPEdit TGSQL
			var/datum/db_query/query_insert = SSdbcore.NewQuery(sql,sqlargs) //CHOMPEdit TGSQL
			query_insert.Execute()
			to_chat(usr, "<b>Thank you for your vote!</b>")
			qdel(query_insert)
			usr << browse(null,"window=privacypoll")

	if(!ready && href_list["preference"])
		if(client)
			client.prefs.process_link(src, href_list)
	else if(!href_list["late_join"])
		new_player_panel()

	if(href_list["showpoll"])

		handle_player_polling()
		return

	if(href_list["pollid"])

		var/pollid = href_list["pollid"]
		if(istext(pollid))
			pollid = text2num(pollid)
		if(isnum(pollid))
			src.poll_player(pollid)
		return

	if(href_list["votepollid"] && href_list["votetype"])
		var/pollid = text2num(href_list["votepollid"])
		var/votetype = href_list["votetype"]
		switch(votetype)
			if("OPTION")
				var/optionid = text2num(href_list["voteoptionid"])
				vote_on_poll(pollid, optionid)
			if("TEXT")
				var/replytext = href_list["replytext"]
				log_text_poll_reply(pollid, replytext)
			if("NUMVAL")
				var/id_min = text2num(href_list["minid"])
				var/id_max = text2num(href_list["maxid"])

				if( (id_max - id_min) > 100 )	//Basic exploit prevention
					to_chat(usr, "The option ID difference is too big. Please contact administration or the database admin.")
					return

				for(var/optionid = id_min; optionid <= id_max; optionid++)
					if(!isnull(href_list["o[optionid]"]))	//Test if this optionid was replied to
						var/rating
						if(href_list["o[optionid]"] == "abstain")
							rating = null
						else
							rating = text2num(href_list["o[optionid]"])
							if(!isnum(rating))
								return

						vote_on_numval_poll(pollid, optionid, rating)
			if("MULTICHOICE")
				var/id_min = text2num(href_list["minoptionid"])
				var/id_max = text2num(href_list["maxoptionid"])

				if( (id_max - id_min) > 100 )	//Basic exploit prevention
					to_chat(usr, "The option ID difference is too big. Please contact administration or the database admin.")
					return

				for(var/optionid = id_min; optionid <= id_max; optionid++)
					if(!isnull(href_list["option_[optionid]"]))	//Test if this optionid was selected
						vote_on_poll(pollid, optionid, 1)

	if(href_list["shownews"])
		handle_server_news()
		return

	if(href_list["hidden_jobs"])
		show_hidden_jobs = !show_hidden_jobs
		LateChoices()

	if(href_list["give_feedback"])
		if(!SSsqlite.can_submit_feedback(my_client))
			return

		if(client.feedback_form)
			client.feedback_form.display() // In case they closed the form early.
		else
			client.feedback_form = new(client)

	//ChompEDIT START
	if(href_list["open_changelog"])
		client.prefs.lastchangelog = changelog_hash
		SScharacter_setup.queue_preferences_save(client.prefs)
		client.changes()
		return
	//ChompEDIT END

/mob/new_player/proc/handle_server_news()
	if(!client)
		return
	var/savefile/F = client.get_server_news()
	if(F)
		//client.prefs.lastnews = md5(F["body"]) //Chomp REMOVE
		//SScharacter_setup.queue_preferences_save(client.prefs) //Chomp REMOVE
		//ChompEDIT start - handle reads correctly
		var/title
		F["title"] >> title
		F["title"] >> title //This is done twice on purpose. For some reason BYOND misses the first read, if performed before the world starts
		var/body
		F["body"] >> body
		//ChompEDIT end

		var/dat = "<html><body><center>"
		dat += "<h1>[title]</h1>"
		dat += "<br>"
		dat += "[body]"
		dat += "<br>"
		dat += "<font size='2'><i>Last written by [F["author"]], on [F["timestamp"]].</i></font>"
		dat += "</center></body></html>"
		var/datum/browser/popup = new(src, "Server News", "Server News", 450, 300, src)
		popup.set_content(dat)
		popup.open()

/mob/proc/time_till_respawn()
	if(!ckey)
		return -1 // What?

	var/timer = GLOB.respawn_timers[ckey]
	// No timer at all
	if(!timer)
		return 0
	// Special case, infinite timer
	if(timer == -1)
		return -1
	// Timer expired
	if(timer <= world.time)
		GLOB.respawn_timers -= ckey
		return 0
	// Timer still going
	return timer - world.time

/mob/new_player/proc/IsJobAvailable(rank)
	var/datum/job/job = job_master.GetJob(rank)
	if(!job)
		return 0
	if(!job.is_position_available())
		return 0
	if(jobban_isbanned(src,rank))
		return 0
	if(!job.player_old_enough(src.client))
		return 0
	//VOREStation Add
	if(!job.player_has_enough_playtime(src.client))
		return 0
	if(!is_job_whitelisted(src,rank))
		return 0
	if(!job.player_has_enough_pto(src.client))
		return 0
	//VOREStation Add End
	return 1


/mob/new_player/proc/AttemptLateSpawn(rank,var/spawning_at)
	if (src != usr)
		return 0
	if(!ticker || ticker.current_state != GAME_STATE_PLAYING)
		to_chat(usr, span_red("The round is either not ready, or has already finished..."))
		return 0
	if(!CONFIG_GET(flag/enter_allowed)) // CHOMPEdit
		to_chat(usr, "<span class='notice'>There is an administrative lock on entering the game!</span>")
		return 0
	if(!IsJobAvailable(rank))
		tgui_alert_async(src,"[rank] is not available. Please try another.")
		return 0
	if(!spawn_checks_vr(rank)) return 0 // VOREStation Insert
	if(!client)
		return 0

	//Find our spawning point.
	var/list/join_props = job_master.LateSpawn(client, rank)

	if(!join_props)
		return

	var/turf/T = join_props["turf"]
	var/join_message = join_props["msg"]
	var/announce_channel = join_props["channel"] || "Common"

	if(!T || !join_message)
		return 0

	spawning = 1
	close_spawn_windows()

	//CHOMPEdit start - join as mob in crystal...
	var/obj/item/itemtf = join_props["itemtf"]
	if(itemtf && istype(itemtf, /obj/item/capture_crystal))
		var/obj/item/capture_crystal/cryst = itemtf
		if(cryst.spawn_mob_type)
			// We want to be a spawned mob instead of a person aaaaa
			var/mob/living/carrier = join_props["carrier"]
			var/vorgans = join_props["vorgans"]
			cryst.bound_mob = new cryst.spawn_mob_type(cryst)
			cryst.spawn_mob_type = null
			cryst.bound_mob.ai_holder_type = /datum/ai_holder/simple_mob/inert
			cryst.bound_mob.key = src.key
			log_and_message_admins("[key_name_admin(src)] joined [cryst.bound_mob] inside a capture crystal [ADMIN_FLW(cryst.bound_mob)]")
			if(vorgans)
				cryst.bound_mob.copy_from_prefs_vr()
			if(istype(carrier))
				cryst.capture(cryst.bound_mob, carrier)
			else
				//Something went wrong, but lets try to do as much as we can.
				cryst.bound_mob.capture_caught = TRUE
				cryst.persist_storable = FALSE
			cryst.update_icon()
			qdel(src)
			return
	//CHOMPEdit end

	job_master.AssignRole(src, rank, 1)

	var/mob/living/character = create_character(T)	//creates the human and transfers vars and mind
	character = job_master.EquipRank(character, rank, 1)					//equips the human
	UpdateFactionList(character)
	if(character && character.client)
		var/obj/screen/splash/Spl = new(character.client, TRUE)
		Spl.Fade(TRUE)

	var/datum/job/J = SSjob.get_job(rank)

	// AIs don't need a spawnpoint, they must spawn at an empty core
	if(J.mob_type & JOB_SILICON_AI)

		// IsJobAvailable for AI checks that there is an empty core available in this list
		var/obj/structure/AIcore/deactivated/C = empty_playable_ai_cores[1]
		empty_playable_ai_cores -= C

		character.loc = C.loc

		// AIize the character, but don't move them yet
		character = character.AIize(move = FALSE) // Dupe of code in /datum/controller/subsystem/ticker/proc/create_characters() for non-latespawn, unify?

		AnnounceCyborg(character, rank, "has been transferred to the empty core in \the [character.loc.loc]")
		ticker.mode.latespawn(character)

		qdel(C) //Deletes empty core (really?)
		qdel(src) //Deletes new_player
		return

	// Equip our custom items only AFTER deploying to spawn points eh?
	equip_custom_items(character)	//CHOMPEdit readded to enable custom_item.txt

	//character.apply_traits() //VOREStation Removal

	// Moving wheelchair if they have one
	if(character.buckled && istype(character.buckled, /obj/structure/bed/chair/wheelchair))
		character.buckled.loc = character.loc
		character.buckled.set_dir(character.dir)

	ticker.mode.latespawn(character)

	//CHOMPEdit Begin - non-crew join don't get a message
	if(rank == JOB_OUTSIDER)
		log_and_message_admins("has joined the round as non-crew. (<A HREF='?_src_=holder;[HrefToken()];adminplayerobservecoodjump=1;X=[T.x];Y=[T.y];Z=[T.z]'>JMP</a>)",character)
		if(!(J.mob_type & JOB_SILICON))
			ticker.minds += character.mind
	else if(rank == JOB_ANOMALY)
		log_and_message_admins("has joined the round as anomaly. (<A HREF='?_src_=holder;[HrefToken()];adminplayerobservecoodjump=1;X=[T.x];Y=[T.y];Z=[T.z]'>JMP</a>)",character)
		if(!(J.mob_type & JOB_SILICON))
			ticker.minds += character.mind
	//CHOMPEdit End
	else if(J.mob_type & JOB_SILICON)
		AnnounceCyborg(character, rank, join_message, announce_channel, character.z)
	else
		AnnounceArrival(character, rank, join_message, announce_channel, character.z)
		data_core.manifest_inject(character)
		ticker.minds += character.mind//Cyborgs and AIs handle this in the transform proc.	//TODO!!!!! ~Carn
	if(ishuman(character))
		if(character.client.prefs.auto_backup_implant)
			var/obj/item/weapon/implant/backup/imp = new(src)

			if(imp.handle_implant(character,character.zone_sel.selecting))
				imp.post_implant(character)
	var/gut = join_props["voreny"]
	var/start_absorbed = join_props["absorb"] //CHOMPAdd
	var/mob/living/prey = join_props["prey"]
	//CHOMPEdit Start - Item TF
	if(itemtf && istype(itemtf, /obj/item/capture_crystal))
		//We want to be in the crystal, not actually possessing the crystal.
		var/obj/item/capture_crystal/cryst = itemtf
		var/mob/living/carrier = join_props["carrier"]
		cryst.capture(character, carrier)
		character.forceMove(cryst)
		cryst.update_icon()
	else if(itemtf)
		itemtf.inhabit_item(character, itemtf.name, character)
		var/mob/living/possessed_voice = itemtf.possessed_voice
		itemtf.trash_eatable = character.devourable
		itemtf.unacidable = !character.digestable
		character.forceMove(possessed_voice)
	//CHOMPEdit End
	else if(prey)
		character.copy_from_prefs_vr(1,1) //Yes I know we're reloading these, shut up
		var/obj/belly/gut_to_enter
		for(var/obj/belly/B in character.vore_organs)
			if(B.name == gut)
				gut_to_enter = B
				character.vore_selected = B
		var/datum/effect/effect/system/teleport_greyscale/tele = new /datum/effect/effect/system/teleport_greyscale()
		tele.set_up("#00FFFF", get_turf(prey))
		tele.start()
		character.forceMove(get_turf(prey))
		//CHOMPAdd Start
		if(start_absorbed)
			prey.absorbed = 1
		//CHOMPAdd End
		prey.forceMove(gut_to_enter)
	else
		if(gut)
			//CHOMPAdd Start
			if(start_absorbed)
				character.absorbed = 1
			//CHOMPAdd End
			character.forceMove(gut)

	character.client.init_verbs() // init verbs for the late join

	qdel(src) // Delete new_player mob

/mob/new_player/proc/AnnounceCyborg(var/mob/living/character, var/rank, var/join_message, var/channel, var/zlevel)
	if (ticker.current_state == GAME_STATE_PLAYING)
		var/list/zlevels = zlevel ? using_map.get_map_levels(zlevel, TRUE, om_range = DEFAULT_OVERMAP_RANGE) : null
		if(character.mind.role_alt_title)
			rank = character.mind.role_alt_title
		// can't use their name here, since cyborg namepicking is done post-spawn, so we'll just say "A new Cyborg has arrived"/"A new Android has arrived"/etc.
		global_announcer.autosay("A new[rank ? " [rank]" : " visitor" ] [join_message ? join_message : "has arrived on the station"].", "Arrivals Announcement Computer", channel, zlevels)

/mob/new_player/proc/LateChoices()
	var/name = client.prefs.be_random_name ? "friend" : client.prefs.real_name

	var/dat = "<html><body><center>"
	dat += "<b>Welcome, [name].<br></b>"
	dat += "Round Duration: [roundduration2text()]<br>"

	if(emergency_shuttle) //In case NanoTrasen decides reposess CentCom's shuttles.
		if(emergency_shuttle.going_to_centcom()) //Shuttle is going to CentCom, not recalled
			dat += "<font color='red'><b>The station has been evacuated.</b></font><br>"
		if(emergency_shuttle.online())
			if (emergency_shuttle.evac)	// Emergency shuttle is past the point of no recall
				dat += "<font color='red'>The station is currently undergoing evacuation procedures.</font><br>"
			else						// Crew transfer initiated
				dat += "<font color='red'>The station is currently undergoing crew transfer procedures.</font><br>"

	dat += "Choose from the following open/valid positions:<br>"
	dat += "<a href='byond://?src=\ref[src];hidden_jobs=1'>[show_hidden_jobs ? "Hide":"Show"] Hidden Jobs.</a><br>"

	var/deferred = ""
	for(var/datum/job/job in job_master.occupations)
		if(job && IsJobAvailable(job.title))
			// Checks for jobs with minimum age requirements
			if((job.minimum_character_age || job.min_age_by_species) && (client.prefs.age < job.get_min_age(client.prefs.species, client.prefs.organ_data["brain"])))
				continue
			//CHOMPEdit Begin - Check species job bans... (Only used for shadekin)
			if(job.is_species_banned(client.prefs.species, client.prefs.organ_data["brain"]))
				continue
			//CHOMPEdit End
			// Checks for jobs set to "Never" in preferences	//TODO: Figure out a better way to check for this
			if(!(client.prefs.GetJobDepartment(job, 1) & job.flag))
				if(!(client.prefs.GetJobDepartment(job, 2) & job.flag))
					if(!(client.prefs.GetJobDepartment(job, 3) & job.flag))
						if(!show_hidden_jobs && job.title != "Assistant")	// Assistant is always an option
							continue
			var/active = 0
			// Only players with the job assigned and AFK for less than 10 minutes count as active
			for(var/mob/M in player_list) if(M.mind && M.client && M.mind.assigned_role == job.title && M.client.inactivity <= 10 MINUTES)
				active++

			var/string = "<a href='byond://?src=\ref[src];SelectedJob=[job.title]'>[job.title] ([job.current_positions]) (Active: [active])</a><br>"

			if(job.offmap_spawn) //At the bottom
				deferred += string
			else
				dat += string

	dat += deferred

	dat += "</center>"
	src << browse(dat, "window=latechoices;size=300x640;can_close=1")


/mob/new_player/proc/create_character(var/turf/T)
	spawning = 1
	close_spawn_windows()

	var/mob/living/carbon/human/new_character

	var/use_species_name
	var/datum/species/chosen_species
	if(client.prefs.species)
		chosen_species = GLOB.all_species[client.prefs.species]
		use_species_name = chosen_species.get_station_variant() //Only used by pariahs atm.

	if(chosen_species && use_species_name)
		// Have to recheck admin due to no usr at roundstart. Latejoins are fine though.
		if(is_alien_whitelisted(chosen_species))
			new_character = new(T, use_species_name)

	if(!new_character)
		new_character = new(T)

	if(ticker.random_players)
		new_character.gender = pick(MALE, FEMALE)
		client.prefs.real_name = random_name(new_character.gender)
		client.prefs.randomize_appearance_and_body_for(new_character)
	else
		client.prefs.copy_to(new_character, icon_updates = TRUE)

	if(client && client.media)
		client.media.stop_music() // MAD JAMS cant last forever yo

	if(mind)
		mind.active = 0					//we wish to transfer the key manually
		// VOREStation edit to disable the destructive forced renaming for our responsible whitelist clowns.
		//if(mind.assigned_role == "Clown")				//give them a clownname if they are a clown
		//	new_character.real_name = pick(clown_names)	//I hate this being here of all places but unfortunately dna is based on real_name!
		//	new_character.rename_self("clown")
		mind.original = new_character
		// VOREStation
		mind.loaded_from_ckey = client.ckey
		mind.loaded_from_slot = client.prefs.default_slot
		// VOREStation
		//mind.traits = client.prefs.traits.Copy() // VOREStation conflict
		mind.transfer_to(new_character)					//won't transfer key since the mind is not active

	new_character.name = real_name
	client.init_verbs()
	new_character.dna.ready_dna(new_character)
	new_character.dna.b_type = client.prefs.b_type
	new_character.sync_organ_dna()
	if(client.prefs.disabilities)
		// Set defer to 1 if you add more crap here so it only recalculates struc_enzymes once. - N3X
		new_character.dna.SetSEState(GLASSESBLOCK,1,0)
		new_character.disabilities |= NEARSIGHTED

	for(var/lang in client.prefs.alternate_languages)
		var/datum/language/chosen_language = GLOB.all_languages[lang]
		if(chosen_language)
			if(is_lang_whitelisted(src,chosen_language) || (new_character.species && (chosen_language.name in new_character.species.secondary_langs)))
				new_character.add_language(lang)
	for(var/key in client.prefs.language_custom_keys)
		if(client.prefs.language_custom_keys[key])
			var/datum/language/keylang = GLOB.all_languages[client.prefs.language_custom_keys[key]]
			if(keylang)
				new_character.language_keys[key] = keylang
	// VOREStation Add: Preferred Language Setting;
	if(client.prefs.preferred_language) // Do we have a preferred language?
		var/datum/language/def_lang = GLOB.all_languages[client.prefs.preferred_language]
		if(def_lang)
			new_character.default_language = def_lang
	// VOREStation Add End
	// And uncomment this, too.
	//new_character.dna.UpdateSE()

	// Do the initial caching of the player's body icons.
	new_character.force_update_limbs()
	new_character.update_icons_body()
	new_character.update_transform() //VOREStation Edit

	new_character.key = key		//Manually transfer the key to log them in

	return new_character

/mob/new_player/proc/ViewManifest()
	var/dat = "<div align='center'>"
	dat += data_core.get_manifest(OOC = 1)

	//src << browse(dat, "window=manifest;size=370x420;can_close=1")
	var/datum/browser/popup = new(src, "Crew Manifest", "Crew Manifest", 370, 420, src)
	popup.set_content(dat)
	popup.open()

/mob/new_player/Move()
	return 0

/mob/new_player/proc/close_spawn_windows()

	src << browse(null, "window=latechoices") //closes late choices window
	src << browse(null, "window=preferences_window") //VOREStation Edit?
	src << browse(null, "window=News") //closes news window
	//src << browse(null, "window=playersetup") //closes the player setup window
	panel.close()

/mob/new_player/proc/has_admin_rights()
	return check_rights(R_ADMIN, 0, src)

/mob/new_player/get_species()
	var/datum/species/chosen_species
	if(client.prefs.species)
		chosen_species = GLOB.all_species[client.prefs.species]

	if(!chosen_species)
		return SPECIES_HUMAN

	if(is_alien_whitelisted(chosen_species))
		return chosen_species.name

	return SPECIES_HUMAN

/mob/new_player/get_gender()
	if(!client || !client.prefs) ..()
	return client.prefs.biological_gender

/mob/new_player/is_ready()
	return ready && ..()

// Prevents lobby players from seeing say, even with ghostears
/mob/new_player/hear_say(var/list/message_pieces, var/verb = "says", var/italics = 0, var/mob/speaker = null)
	return

/mob/new_player/hear_holopad_talk(list/message_pieces, var/verb = "says", var/mob/speaker = null)
	return

/mob/new_player/hear_holopad_talk(list/message_pieces, var/verb = "says", var/mob/speaker = null)
	return

// Prevents lobby players from seeing emotes, even with ghosteyes
/mob/new_player/show_message(msg, type, alt, alt_type)
	return

/mob/new_player/hear_radio()
	return

/mob/new_player/MayRespawn()
	return 1
