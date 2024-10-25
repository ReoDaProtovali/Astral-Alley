<<<<<<< HEAD
/obj/item/device/encryptionkey/pilot
	name = "pilot's encryption key"
	icon_state = "com_cypherkey"
	channels = list("Supply" = 1, "Explorer" = 1)

/obj/item/device/encryptionkey/explorer
	name = "explorer radio encryption key"
	icon_state = "com_cypherkey"
	channels = list("Explorer" = 1)

/obj/item/device/encryptionkey/sar
	name = "sar's encryption key"
	icon_state = "med_cypherkey"
	channels = list("Medical" = 1, "Explorer" = 1)

/obj/item/device/encryptionkey/heads/hop
	name = "head of personnel's encryption key"
	icon_state = "hop_cypherkey"
	channels = list("Supply" = 1, "Service" = 1, "Command" = 1, "Security" = 1, "Explorer" = 1)

/obj/item/device/encryptionkey/heads/ai_integrated
	name = "ai integrated encryption key"
	desc = "Integrated encryption key"
	icon_state = "cap_cypherkey"
	channels = list("Command" = 1, "Security" = 1, "Engineering" = 1, "Science" = 1, "Medical" = 1, "Supply" = 1, "Service" = 1, "AI Private" = 1, "Explorer" = 1)

/obj/item/device/encryptionkey/heads/captain
	name = "site manager's encryption key"
	icon_state = "cap_cypherkey"
	channels = list("Command" = 1, "Security" = 1, "Engineering" = 1, "Science" = 1, "Medical" = 1, "Supply" = 1, "Service" = 1, "Explorer" = 1)
=======
/obj/item/encryptionkey/pilot
	name = "pilot's encryption key"
	icon_state = "com_cypherkey"
	channels = list(CHANNEL_SUPPLY = 1, CHANNEL_EXPLORATION = 1)

/obj/item/encryptionkey/explorer
	name = "explorer radio encryption key"
	icon_state = "com_cypherkey"
	channels = list(CHANNEL_EXPLORATION = 1, CHANNEL_SCIENCE = 1)

/obj/item/encryptionkey/sar
	name = "sar's encryption key"
	icon_state = "med_cypherkey"
	channels = list(CHANNEL_MEDICAL = 1, CHANNEL_EXPLORATION = 1)

/obj/item/encryptionkey/heads/hop
	name = "head of personnel's encryption key"
	icon_state = "hop_cypherkey"
	channels = list(CHANNEL_SUPPLY = 1, CHANNEL_SERVICE = 1, CHANNEL_COMMAND = 1, CHANNEL_SECURITY = 1, CHANNEL_EXPLORATION = 1)

/obj/item/encryptionkey/heads/ai_integrated
	name = "ai integrated encryption key"
	desc = "Integrated encryption key"
	icon_state = "cap_cypherkey"
	channels = list(CHANNEL_COMMAND = 1, CHANNEL_SECURITY = 1, CHANNEL_ENGINEERING = 1, CHANNEL_SCIENCE = 1, CHANNEL_MEDICAL = 1, CHANNEL_SUPPLY = 1, CHANNEL_SERVICE = 1, CHANNEL_AI_PRIVATE = 1, CHANNEL_EXPLORATION = 1)

/obj/item/encryptionkey/heads/captain
	name = "site manager's encryption key"
	icon_state = "cap_cypherkey"
	channels = list(CHANNEL_COMMAND = 1, CHANNEL_SECURITY = 1, CHANNEL_ENGINEERING = 1, CHANNEL_SCIENCE = 1, CHANNEL_MEDICAL = 1, CHANNEL_SUPPLY = 1, CHANNEL_SERVICE = 1, CHANNEL_EXPLORATION = 1)
>>>>>>> 026253a175 (upstream-merge-16484 [MDB IGNORE] (#9289))
