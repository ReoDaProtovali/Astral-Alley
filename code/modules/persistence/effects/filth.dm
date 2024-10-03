/datum/persistent/filth
	name = "filth"
	entries_expire_at = 4 // 4 rounds, 24 hours.
	var/saves_dirt = TRUE //VOREStation edit

/datum/persistent/filth/IsValidEntry(var/atom/entry)
	. = ..() && entry.invisibility == 0

/datum/persistent/filth/CheckTokenSanity(var/list/token)
	// byond's json implementation is "questionable", and uses types as keys and values without quotes sometimes even though they aren't valid json
	token["path"] = istext(token["path"]) ? text2path(token["path"]) : token["path"]
<<<<<<< HEAD
	return ..() && ispath(token["path"])

=======
	// CHOMPAdd - Cooler graffiti
	token["pixel_x"] = istext(token["pixel_x"]) ? text2num(token["pixel_x"]) : token["pixel_x"]
	token["pixel_y"] = istext(token["pixel_y"]) ? text2num(token["pixel_y"]) : token["pixel_y"]
	return ..() && ispath(token["path"]) && (!saves_dirt || isnum(token["dirt"])) && isnum(token["pixel_x"]) && isnum(token["pixel_y"])
	// CHOMPAdd End
>>>>>>> 2e83b6b796 (gives graffiti the right vars (#9127))
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
		inst = new _path(creating, token["art_color"], token["art_shade"], token["art_type"], token["age"]+1)
	else
		if (saves_dirt)
			new _path(creating, token["age"]+1, token["dirt"])
		else
			new _path(creating, token["age"]+1)
	if(token["pixel_x"])
		inst.pixel_x = token["pixel_x"]
	if(token["pixel_y"])
		inst.pixel_y = token["pixel_y"]
	// CHOMPEdit End
>>>>>>> 2e83b6b796 (gives graffiti the right vars (#9127))

/datum/persistent/filth/GetEntryAge(var/atom/entry)
	var/obj/effect/decal/cleanable/filth = entry
	return filth.age

/datum/persistent/filth/proc/GetEntryDirt(var/atom/entry)
	var/turf/simulated/T = get_turf(entry)
	if (istype(T))
		return T.dirt
	return 0

/datum/persistent/filth/proc/GetEntryPath(var/atom/entry)
	var/obj/effect/decal/cleanable/filth = entry
	return filth.generic_filth ? /obj/effect/decal/cleanable/filth : filth.type

/datum/persistent/filth/CompileEntry(var/atom/entry)
	. = ..()
<<<<<<< HEAD
	LAZYADDASSOC(., "path", "[GetEntryPath(entry)]")
=======
	LAZYADDASSOC(., "path", "[GetEntryPath(entry)]")
	if (saves_dirt)
		LAZYADDASSOC(., "dirt", GetEntryDirt(entry))
	// CHOMPAdd Start - Cooler graffiti
	LAZYADDASSOC(., "pixel_x", "[entry.pixel_x]")
	LAZYADDASSOC(., "pixel_y", "[entry.pixel_y]")

	if(istype(entry, /obj/effect/decal/cleanable/crayon))
		var/obj/effect/decal/cleanable/crayon/Inst = entry
		LAZYADDASSOC(., "art_type", "[Inst.art_type]")
		LAZYADDASSOC(., "art_color", "[Inst.art_color]")
		LAZYADDASSOC(., "art_shade", "[Inst.art_shade]")
	// CHOMPAdd End
>>>>>>> 2e83b6b796 (gives graffiti the right vars (#9127))
