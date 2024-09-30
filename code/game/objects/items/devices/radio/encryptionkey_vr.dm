/obj/item/encryptionkey/heads/hop
	name = "head of personnel's encryption key"
	icon_state = "hop_cypherkey"
	channels = list("Supply" = 1, "Service" = 1, "Command" = 1, "Security" = 1) //YW Edit: removes Explorer channel access, not in line with our chain of command. CHOMP: We accept this

/obj/item/encryptionkey/heads/ai_integrated
	name = "ai integrated encryption key"
	desc = "Integrated encryption key"
	icon_state = "cap_cypherkey"
	channels = list("Command" = 1, "Security" = 1, "Engineering" = 1, "Science" = 1, "Medical" = 1, "Supply" = 1, "Service" = 1, "AI Private" = 1, "Explorer" = 1) //CHOMP explo keep

/obj/item/encryptionkey/heads/captain
	name = "site manager's encryption key"
	icon_state = "cap_cypherkey"
	channels = list("Command" = 1, "Security" = 1, "Engineering" = 1, "Science" = 1, "Medical" = 1, "Supply" = 1, "Service" = 1, "Explorer" = 1) //CHOMP explo keep

/obj/item/encryptionkey/heads/rd
	name = "research director's encryption key"
	icon_state = "rd_cypherkey"
	channels = list("Command" = 1, "Science" = 1, "Explorer" = 1) //YW Edit: adds Explorer channel access, to come in line with our chain of command. CHOMP: We accept this

<<<<<<< HEAD
/obj/item/device/encryptionkey/ert
	channels = list("Response Team" = 1, "Science" = 1, "Command" = 1, "Medical" = 1, "Engineering" = 1, "Security" = 1, "Supply" = 1, "Service" = 1, "Explorer" = 1) //CHOMP explo keep

/obj/item/device/encryptionkey/omni		//Literally only for the admin intercoms
	channels = list("Mercenary" = 1, "Raider" = 1, "Response Team" = 1, "Science" = 1, "Command" = 1, "Medical" = 1, "Engineering" = 1, "Security" = 1, "Supply" = 1, "Service" = 1, "Explorer" = 1) //CHOMP explo keep
=======
/obj/item/encryptionkey/ert
	channels = list(CHANNEL_RESPONSE_TEAM = 1, CHANNEL_SCIENCE = 1, CHANNEL_COMMAND = 1, CHANNEL_MEDICAL = 1, CHANNEL_ENGINEERING = 1, CHANNEL_SECURITY = 1, CHANNEL_SUPPLY = 1, CHANNEL_SERVICE = 1, CHANNEL_EXPLORATION = 1)

/obj/item/encryptionkey/omni		//Literally only for the admin intercoms
	channels = list(CHANNEL_MERCENARY = 1, CHANNEL_RAIDER = 1, CHANNEL_RESPONSE_TEAM = 1, CHANNEL_SCIENCE = 1, CHANNEL_COMMAND = 1, CHANNEL_MEDICAL = 1, CHANNEL_ENGINEERING = 1, CHANNEL_SECURITY = 1, CHANNEL_SUPPLY = 1, CHANNEL_SERVICE = 1, CHANNEL_EXPLORATION = 1)
>>>>>>> 5ea698a0ef ([MIRROR] Removes /obj/item/weapon and /obj/item/device [MDB IGNORE] (#9084))

/obj/item/encryptionkey/pathfinder
	name = "pathfinder's encryption key"
	icon_state = "com_cypherkey"
	channels = list("Explorer" = 1) //YW Edit: removes command channel access, not in line with our chain of command. CHOMP: We accept this

/obj/item/encryptionkey/qm
	name = "quartermaster's encryption key"
	icon_state = "qm_cypherkey"
	channels = list("Supply" = 1) //YW Edit: removes command channel access, not in line with our chain of command. CHOMP: We accept this

/obj/item/encryptionkey/pilot
	name = "pilot's encryption key"
	icon_state = "cypherkey"
	channels = list("Explorer" = 1) //CHOMP explo keep

/obj/item/encryptionkey/explorer
	name = "explorer's encryption key" //CHOMP explo keep
	icon_state = "rob_cypherkey"
	channels = list("Explorer" = 1) //CHOMP explo keep

/obj/item/encryptionkey/sar
	name = "fm's encryption key"
	icon_state = "med_cypherkey"
	channels = list("Medical" = 1, "Explorer" = 1) //CHOMP explo keep

<<<<<<< HEAD
/obj/item/device/encryptionkey/talon
	channels = list("Talon" = 1)
=======
/obj/item/encryptionkey/talon
	channels = list(CHANNEL_TALON = 1)
>>>>>>> 5ea698a0ef ([MIRROR] Removes /obj/item/weapon and /obj/item/device [MDB IGNORE] (#9084))
