#define SAVEFILE_VERSION_MIN	8
<<<<<<< HEAD
#define SAVEFILE_VERSION_MAX	11
=======
#define SAVEFILE_VERSION_MAX	16
>>>>>>> 039ee85382 ([MIRROR] Convert preferences to /tg/ preferences (#9797))

//handles converting savefiles to new formats
//MAKE SURE YOU KEEP THIS UP TO DATE!
//If the sanity checks are capable of handling any issues. Only increase SAVEFILE_VERSION_MAX,
//this will mean that savefile_version will still be over SAVEFILE_VERSION_MIN, meaning
//this savefile update doesn't run everytime we load from the savefile.
//This is mainly for format changes, such as the bitflags in toggles changing order or something.
//if a file can't be updated, return 0 to delete it and start again
//if a file was updated, return 1
/datum/preferences/proc/savefile_update()
	if(savefile_version < 8)	//lazily delete everything + additional files so they can be saved in the new format
		for(var/ckey in preferences_datums)
			var/datum/preferences/D = preferences_datums[ckey]
			if(D == src)
				var/delpath = "data/player_saves/[copytext(ckey,1,2)]/[ckey]/"
				if(delpath && fexists(delpath))
					fdel(delpath)
				break
		return 0

	if(savefile_version == SAVEFILE_VERSION_MAX)	//update successful.
		save_preferences()
		save_character()
		return 1
	return 0

<<<<<<< HEAD
/datum/preferences/proc/load_path(ckey,filename="preferences.sav")
	if(!ckey)	return
=======
	if its version is below SAVEFILE_VERSION_MAX but above the minimum, it will load data but later call the
	respective update_preferences() or update_character() proc.
	Those procs allow coders to specify format changes so users do not lose their setups and have to redo them again.

	Failing all that, the standard sanity checks are performed. They simply check the data is suitable, reverting to
	initial() values if necessary.
*/
/datum/preferences/proc/save_data_needs_update(list/save_data)
	if(!save_data) // empty list, either savefile isnt loaded or its a new char
		return -1
	if(!save_data["version"]) // special case: if there is no version key, such as in character slots before v12
		return -3
	if(save_data["version"] < SAVEFILE_VERSION_MIN)
		return -2
	if(save_data["version"] < SAVEFILE_VERSION_MAX)
		return save_data["version"]
	return -1

//should these procs get fairly long
//just increase SAVEFILE_VERSION_MIN so it's not as far behind
//SAVEFILE_VERSION_MAX and then delete any obsolete if clauses
//from these procs.
//This only really meant to avoid annoying frequent players
//if your savefile is 3 months out of date, then 'tough shit'.

/datum/preferences/proc/update_preferences(current_version, datum/json_savefile/S)
	// Migration from BYOND savefiles to JSON: Important milemark.
	// if(current_version < 11)

	// Migration for client preferences
	if(current_version < 13)
		log_debug("[client_ckey] preferences migrating from [current_version] to v13....")
		to_chat(client, span_danger("Migrating savefile from version [current_version] to v13..."))

		migration_13_preferences(S)

		log_debug("[client_ckey] preferences successfully migrated from [current_version] to v13.")
		to_chat(client, span_danger("v13 savefile migration complete."))

	// Migration for nifs
	if(current_version < 14)
		log_debug("[client_ckey] preferences migrating from [current_version] to v14....")
		to_chat(client, span_danger("Migrating savefile from version [current_version] to v14..."))

		migration_14_nifs(S)

		log_debug("[client_ckey] preferences successfully migrated from [current_version] to v14.")
		to_chat(client, span_danger("v14 savefile migration complete."))

	// Migration for nifs, again, to get rid of the /device path
	if(current_version < 15)
		log_debug("[client_ckey] preferences migrating from [current_version] to v15....")
		to_chat(client, span_danger("Migrating savefile from version [current_version] to v15..."))

		migration_15_nif_path(S)

		log_debug("[client_ckey] preferences successfully migrated from [current_version] to v15.")
		to_chat(client, span_danger("v15 savefile migration complete."))

	// Migration for colors
	if(current_version < 16)
		log_debug("[client_ckey] preferences migrating from [current_version] to v16....")
		to_chat(client, span_danger("Migrating savefile from version [current_version] to v16..."))

		migration_16_colors(S)

		log_debug("[client_ckey] preferences successfully migrated from [current_version] to v16.")
		to_chat(client, span_danger("v16 savefile migration complete."))


/datum/preferences/proc/update_character(current_version, list/save_data)
	// Migration from BYOND savefiles to JSON: Important milemark.
	if(current_version == -3)
		// Add a version field inside each character
		save_data["version"] = SAVEFILE_VERSION_MAX

/// Migrates from byond savefile to json savefile
/datum/preferences/proc/try_savefile_type_migration()
	log_debug("[client_ckey] preferences migrating from savefile to JSON...")
	to_chat(client, span_danger("Savefile migration to JSON in progress..."))

	load_path(client.ckey, "preferences.sav") // old save file
	var/old_path = path
	load_path(client.ckey)
	if(!fexists(old_path))
		return
	var/datum/json_savefile/json_savefile = new(path)
	json_savefile.import_byond_savefile(new /savefile(old_path))
	json_savefile.save()

	log_debug("[client_ckey] preferences successfully migrated from savefile to JSON.")
	to_chat(client, span_danger("Savefile migration to JSON is complete."))

	return TRUE

/datum/preferences/proc/load_path(ckey, filename = "preferences.json")
	if(!ckey || !load_and_save)
		return
>>>>>>> 039ee85382 ([MIRROR] Convert preferences to /tg/ preferences (#9797))
	path = "data/player_saves/[copytext(ckey,1,2)]/[ckey]/[filename]"
	savefile_version = SAVEFILE_VERSION_MAX

// General preferences, have to be preloaded
/datum/preferences/proc/load_early_prefs()
	lastchangelog	= savefile.get_entry("lastchangelog", lastchangelog) // CHOMPAdd
	default_slot	= savefile.get_entry("default_slot", default_slot)
	lastnews		= savefile.get_entry("lastnews", lastnews)
	lastlorenews	= savefile.get_entry("lastlorenews", lastlorenews)

/datum/preferences/proc/sanitize_early_prefs()
	lastchangelog	= sanitize_text(lastchangelog, initial(lastchangelog)) // CHOMPAdd
	default_slot 	= sanitize_integer(default_slot, 1, CONFIG_GET(number/character_slots), initial(default_slot))
	lastnews		= sanitize_text(lastnews, initial(lastnews))
	lastlorenews	= sanitize_text(lastlorenews, initial(lastlorenews))

/datum/preferences/proc/save_early_prefs()
	savefile.set_entry("lastchangelog",	lastchangelog) // CHOMPAdd
	savefile.set_entry("default_slot",	default_slot)
	savefile.set_entry("lastnews",		lastnews)
	savefile.set_entry("lastlorenews",	lastlorenews)

/datum/preferences/proc/load_preferences()
	if(!path)				return 0
	if(!fexists(path))		return 0
	var/savefile/S = new /savefile(path)
	if(!S)					return 0
	S.cd = "/"

	S["version"] >> savefile_version
	//Conversion
	if(!savefile_version || !isnum(savefile_version) || savefile_version < SAVEFILE_VERSION_MIN || savefile_version > SAVEFILE_VERSION_MAX)
		if(!savefile_update())  //handles updates
			savefile_version = SAVEFILE_VERSION_MAX
			save_preferences()
			save_character()
			return 0

<<<<<<< HEAD
	player_setup.load_preferences(S)
	return 1
=======
	apply_all_client_preferences()

	load_early_prefs()
	sanitize_early_prefs()

	//try to fix any outdated data if necessary
	if(needs_update >= 0)
		var/bacpath = "[path].updatebac" //todo: if the savefile version is higher then the server, check the backup, and give the player a prompt to load the backup
		if(fexists(bacpath))
			fdel(bacpath) //only keep 1 version of backup
		fcopy(savefile.path, bacpath) //byond helpfully lets you use a savefile for the first arg.
		update_preferences(needs_update, savefile) //needs_update = savefile_version if we need an update (positive integer)

		// Load general prefs after applying migrations
		player_setup.load_preferences(savefile)

		//save the updated version
		var/old_default_slot = default_slot
		// var/old_max_save_slots = max_save_slots

		for(var/slot in savefile.get_entry()) //but first, update all current character slots.
			if (copytext(slot, 1, 10) != "character")
				continue
			var/slotnum = text2num(copytext(slot, 10))
			if (!slotnum)
				continue
			// max_save_slots = max(max_save_slots, slotnum) //so we can still update byond member slots after they lose memeber status
			default_slot = slotnum
			if(load_character())
				save_character()
		default_slot = old_default_slot
		// max_save_slots = old_max_save_slots
		save_preferences()
	else
		// Load general prefs
		player_setup.load_preferences(savefile)

	return TRUE
>>>>>>> 039ee85382 ([MIRROR] Convert preferences to /tg/ preferences (#9797))

/datum/preferences/proc/save_preferences()
	if(!path)				return 0
	var/savefile/S = new /savefile(path)
	if(!S)					return 0
	S.cd = "/"

<<<<<<< HEAD
	S["version"] << savefile_version
	player_setup.save_preferences(S)
	return 1
=======
	player_setup.save_preferences(savefile)

	for(var/preference_type in GLOB.preference_entries)
		var/datum/preference/preference = GLOB.preference_entries[preference_type]
		if(preference.savefile_identifier != PREFERENCE_PLAYER)
			continue

		if(!(preference.type in recently_updated_keys))
			continue

		recently_updated_keys -= preference.type

		if(preference_type in value_cache)
			write_preference(preference, preference.pref_serialize(value_cache[preference_type]))

	save_early_prefs()
	savefile.save()

	return TRUE

/datum/preferences/proc/reset_slot()
	var/bacpath = "[path].resetbac"
	if(fexists(bacpath))
		fdel(bacpath) //only keep 1 version of backup
	fcopy(savefile.path, bacpath) //byond helpfully lets you use a savefile for the first arg.

	savefile.remove_entry("character[default_slot]")
	default_slot = 1

	clear_character_previews()

	// Load slot 1 character
	load_character()
	// And save them immediately, in case we load an empty slot
	save_character()
	save_preferences()
	return TRUE
>>>>>>> 039ee85382 ([MIRROR] Convert preferences to /tg/ preferences (#9797))

/datum/preferences/proc/load_character(slot)
	if(!path)				return 0
	if(!fexists(path))		return 0
	var/savefile/S = new /savefile(path)
	if(!S)					return 0
	S.cd = "/"
	if(!slot)	slot = default_slot
	if(slot != SAVE_RESET) // SAVE_RESET will reset the slot as though it does not exist, but keep the current slot for saving purposes.
		slot = sanitize_integer(slot, 1, CONFIG_GET(number/character_slots), initial(default_slot)) // CHOMPEdit
		if(slot != default_slot)
			default_slot = slot
			S["default_slot"] << slot
	else
		S["default_slot"] << default_slot

	if(slot != SAVE_RESET)
		S.cd = "/character[slot]"
		player_setup.load_character(S)
	else
		player_setup.load_character(S)
		S.cd = "/character[default_slot]"
		player_setup.save_character(S)

	clear_character_previews() // VOREStation Edit
	return 1

/datum/preferences/proc/save_character()
	if(!path)				return 0
	var/savefile/S = new /savefile(path)
	if(!S)					return 0
	S.cd = "/character[default_slot]"

<<<<<<< HEAD
	player_setup.save_character(S)
	return 1
=======
	var/tree_key = "character[default_slot]"
	var/first_save = FALSE
	if(!(tree_key in savefile.get_entry()))
		savefile.set_entry(tree_key, list())
		first_save = TRUE
	var/save_data = savefile.get_entry(tree_key)

	for(var/datum/preference/preference as anything in get_preferences_in_priority_order())
		if(preference.savefile_identifier != PREFERENCE_CHARACTER && !first_save)
			continue

		if(!(preference.type in recently_updated_keys) && !first_save)
			continue

		recently_updated_keys -= preference.type

		if(preference.type in value_cache)
			write_preference(preference, preference.pref_serialize(value_cache[preference.type]))

	save_data["version"] = SAVEFILE_VERSION_MAX //load_character will sanitize any bad data, so assume up-to-date.
	player_setup.save_character(save_data)

	return TRUE
>>>>>>> 039ee85382 ([MIRROR] Convert preferences to /tg/ preferences (#9797))

/datum/preferences/proc/overwrite_character(slot)
	if(!path)				return 0
	if(!fexists(path))		return 0
	var/savefile/S = new /savefile(path)
	if(!S)					return 0
	if(!slot)	slot = default_slot
	if(slot != SAVE_RESET)
		slot = sanitize_integer(slot, 1, CONFIG_GET(number/character_slots), initial(default_slot)) // CHOMPEdit
		if(slot != default_slot)
			default_slot = slot
			nif_path = nif_durability = nif_savedata = null //VOREStation Add - Don't copy NIF
			S["default_slot"] << slot

	else
		S["default_slot"] << default_slot

	return 1

/datum/preferences/proc/sanitize_preferences()
	player_setup.sanitize_setup()
	return 1

#undef SAVEFILE_VERSION_MAX
#undef SAVEFILE_VERSION_MIN
