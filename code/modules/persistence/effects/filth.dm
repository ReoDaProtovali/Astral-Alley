/datum/persistent/filth
	name = "filth"
	entries_expire_at = 4 // 4 rounds, 24 hours.
	var/saves_dirt = TRUE //VOREStation edit

/datum/persistent/filth/IsValidEntry(var/atom/entry)
	. = ..() && entry.invisibility == 0

/datum/persistent/filth/CheckTokenSanity(var/list/token)
	// byond's json implementation is "questionable", and uses types as keys and values without quotes sometimes even though they aren't valid json
	token["path"] = istext(token["path"]) ? text2path(token["path"]) : token["path"]
	return ..() && ispath(token["path"])

/datum/persistent/filth/CheckTurfContents(var/turf/T, var/list/token)
	var/_path = token["path"]
	return (locate(_path) in T) ? FALSE : TRUE

/datum/persistent/filth/CreateEntryInstance(var/turf/creating, var/list/token)
	var/_path = token["path"]
<<<<<<< HEAD
	new _path(creating, token["age"]+1)
=======
	if (isspace(creating) || iswall(creating) ||isopenspace(creating))
		return
	// CHOMPEdit Start
	// new _path(creating, token["age"]+1)
	var/atom/inst
	if(ispath(_path, /obj/effect/decal/cleanable/crayon))
		if(!findtext(token["art_color"], GLOB.is_color) || !findtext(token["art_shade"], GLOB.is_color) || !istext(token["art_type"]))
			return
		inst = new _path(creating, token["art_color"], token["art_shade"], token["art_type"], token["age"]+1)
	else
		if (saves_dirt)
			new _path(creating, token["age"]+1, token["dirt"])
		else
			new _path(creating, token["age"]+1)
	if(inst)
		if(token["pixel_x"])
			inst.pixel_x = token["pixel_x"]
		if(token["pixel_y"])
			inst.pixel_y = token["pixel_y"]
	// CHOMPEdit End
>>>>>>> 2d753d59fc (color check that (#9150))

/datum/persistent/filth/GetEntryAge(var/atom/entry)
	var/obj/effect/decal/cleanable/filth = entry
	return filth.age

/datum/persistent/filth/proc/GetEntryPath(var/atom/entry)
	var/obj/effect/decal/cleanable/filth = entry
	return filth.generic_filth ? /obj/effect/decal/cleanable/filth : filth.type

/datum/persistent/filth/CompileEntry(var/atom/entry)
	. = ..()
	LAZYADDASSOC(., "path", "[GetEntryPath(entry)]")