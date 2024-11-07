//Original Source: Southern Cross

/obj/item/device/radio/headset/pilot
	desc = "A headset used by pilots, has access to the explorer channel."

<<<<<<< HEAD
/obj/item/device/radio/headset/pilot/alt
=======
/obj/item/radio/headset/alt/pilot
>>>>>>> 61a5f758ac ([MIRROR] Headset Refactor and Selection (#9438))
	desc = "A bowman headset used by pilots, has access to the explorer channel."

/obj/item/device/radio/headset/explorer
	desc = "Headset used by explorers for exploring. Access to explorer and science channels."

<<<<<<< HEAD
/obj/item/device/radio/headset/explorer/alt
=======
/obj/item/radio/headset/alt/explorer
>>>>>>> 61a5f758ac ([MIRROR] Headset Refactor and Selection (#9438))
	desc = "Bowman headset used by explorers for exploring. Access to explorer and science channels."

/obj/item/device/radio/headset/sar
	name = "fm radio headset"
	desc = "A headset for field medics."

<<<<<<< HEAD
/obj/item/device/radio/headset/sar/alt
=======
/obj/item/radio/headset/alt/sar
>>>>>>> 61a5f758ac ([MIRROR] Headset Refactor and Selection (#9438))
	name = "fm radio bowman headset"
	desc = "A bowman headset for field medics."

/obj/item/device/radio/headset/volunteer
	name = "volunteer's headset"
	desc = "A headset used by volunteers to expedition teams, has access to the exploration channel."
	icon_state = "pilot_headset"
	adhoc_fallback = TRUE
	ks2type = /obj/item/device/encryptionkey/pilot
