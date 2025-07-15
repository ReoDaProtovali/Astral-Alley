/decl/webhook/roundstart
	id = WEBHOOK_ROUNDSTART

// Data expects a "url" field pointing to the current hosted server and port to connect on.
/decl/webhook/roundstart/get_message(var/list/data)
	. = ..()
<<<<<<< HEAD
	var/desc = "Gamemode: **[global.master_mode]**\n"
	desc += "Players: **[global.player_list.len]**"
=======
	var/desc = "Gamemode: **[GLOB.master_mode]**\n"
	desc += "Players: **[GLOB.player_list.len]**"
>>>>>>> 2c9453b5c3 ([MIRROR] var/global/list -> GLOB. conversion (#11193))
	if(data && data["url"])
		desc += "\nAddress: <[data["url"]]>"

	.["embeds"] = list(list(
		"title" = "Round has started.",
		"description" = desc,
		"color" = COLOR_WEBHOOK_DEFAULT
	))