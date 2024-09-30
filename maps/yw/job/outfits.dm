//Job Outfits

/*
SOUTHERN CROSS OUTFITS
Keep outfits simple. Spawn with basic uniforms and minimal gear. Gear instead goes in lockers. Keep this in mind if editing.
*/
/decl/hierarchy/outfit/job/explorer2
	name = OUTFIT_JOB_NAME("Explorer")
	shoes = /obj/item/clothing/shoes/boots/winter/explorer
	uniform = /obj/item/clothing/under/explorer
	l_ear = /obj/item/radio/headset/explorer
	id_slot = slot_wear_id
	pda_slot = slot_l_store
<<<<<<< HEAD
	pda_type = /obj/item/device/pda/explorer //VORESTation Edit - Better Brown
	id_type = /obj/item/weapon/card/id/explorer //VOREStation Edit
	id_pda_assignment = "Explorer"
=======
	pda_type = /obj/item/pda/explorer //VORESTation Edit - Better Brown
	id_type = /obj/item/card/id/explorer //VOREStation Edit
	id_pda_assignment = JOB_EXPLORER
>>>>>>> 5ea698a0ef ([MIRROR] Removes /obj/item/weapon and /obj/item/device [MDB IGNORE] (#9084))
	flags = OUTFIT_HAS_BACKPACK|OUTFIT_COMPREHENSIVE_SURVIVAL
	backpack_contents = list(/obj/item/clothing/accessory/permit/gun/planetside = 1)

/decl/hierarchy/outfit/job/explorer2/post_equip(mob/living/carbon/human/H)
	..()
	for(var/obj/item/clothing/accessory/permit/gun/planetside/permit in H.back.contents)
		permit.set_name(H.real_name)

/decl/hierarchy/outfit/job/explorer2/technician
<<<<<<< HEAD
	name = OUTFIT_JOB_NAME("Explorer Technician")
	belt = /obj/item/weapon/storage/belt/utility/full
=======
	name = OUTFIT_JOB_NAME(JOB_ALT_EXPLORERE_TECHNICIAN)
	belt = /obj/item/storage/belt/utility/full
>>>>>>> 5ea698a0ef ([MIRROR] Removes /obj/item/weapon and /obj/item/device [MDB IGNORE] (#9084))
	pda_slot = slot_l_store
	id_pda_assignment = "Explorer Technician"

/decl/hierarchy/outfit/job/explorer2/medic
<<<<<<< HEAD
	name = OUTFIT_JOB_NAME("Explorer Medic")
	l_hand = /obj/item/weapon/storage/firstaid/regular
=======
	name = OUTFIT_JOB_NAME(JOB_ALT_EXPLORER_MEDIC)
	l_hand = /obj/item/storage/firstaid/regular
>>>>>>> 5ea698a0ef ([MIRROR] Removes /obj/item/weapon and /obj/item/device [MDB IGNORE] (#9084))
	pda_slot = slot_l_store
	id_pda_assignment = "Explorer Medic"

/decl/hierarchy/outfit/job/pilot
	name = OUTFIT_JOB_NAME("Pilot")
	shoes = /obj/item/clothing/shoes/black
	uniform = /obj/item/clothing/under/rank/pilot1
	suit = /obj/item/clothing/suit/storage/toggle/bomber/pilot
	gloves = /obj/item/clothing/gloves/fingerless
	glasses = /obj/item/clothing/glasses/fakesunglasses/aviator
	l_ear = /obj/item/radio/headset/pilot/alt
	id_slot = slot_wear_id
	pda_slot = slot_belt
<<<<<<< HEAD
	pda_type = /obj/item/device/pda //VOREStation Edit - Civilian
	id_pda_assignment = "Pilot"
=======
	pda_type = /obj/item/pda //VOREStation Edit - Civilian
	id_pda_assignment = JOB_PILOT
>>>>>>> 5ea698a0ef ([MIRROR] Removes /obj/item/weapon and /obj/item/device [MDB IGNORE] (#9084))
	flags = OUTFIT_HAS_BACKPACK|OUTFIT_COMPREHENSIVE_SURVIVAL

/decl/hierarchy/outfit/job/medical/sar
	name = OUTFIT_JOB_NAME("Field Medic") //VOREStation Edit
	uniform = /obj/item/clothing/under/utility/blue
	//suit = /obj/item/clothing/suit/storage/hooded/wintercoat/medical/sar //VOREStation Edit
	shoes = /obj/item/clothing/shoes/boots/winter/explorer
	l_ear = /obj/item/radio/headset/sar
	l_hand = /obj/item/storage/firstaid/regular
	belt = /obj/item/storage/belt/medical/emt
	pda_slot = slot_l_store
<<<<<<< HEAD
	pda_type = /obj/item/device/pda/sar //VOREStation Add
	id_pda_assignment = "Field Medic" //VOREStation Edit
=======
	pda_type = /obj/item/pda/sar //VOREStation Add
	id_pda_assignment = JOB_FIELD_MEDIC //VOREStation Edit
>>>>>>> 5ea698a0ef ([MIRROR] Removes /obj/item/weapon and /obj/item/device [MDB IGNORE] (#9084))
	flags = OUTFIT_HAS_BACKPACK|OUTFIT_EXTENDED_SURVIVAL|OUTFIT_COMPREHENSIVE_SURVIVAL


/decl/hierarchy/outfit/job/explorer2
	name = OUTFIT_JOB_NAME("Explorer")
	shoes = /obj/item/clothing/shoes/boots/winter/explorer
	uniform = /obj/item/clothing/under/explorer
	l_ear = /obj/item/radio/headset/explorer
	id_slot = slot_wear_id
	pda_slot = slot_l_store
<<<<<<< HEAD
	pda_type = /obj/item/device/pda/explorer //VORESTation Edit - Better Brown
	id_type = /obj/item/weapon/card/id/explorer/explorer //VOREStation Edit
	id_pda_assignment = "Explorer"
=======
	pda_type = /obj/item/pda/explorer //VORESTation Edit - Better Brown
	id_type = /obj/item/card/id/explorer/explorer //VOREStation Edit
	id_pda_assignment = JOB_EXPLORER
>>>>>>> 5ea698a0ef ([MIRROR] Removes /obj/item/weapon and /obj/item/device [MDB IGNORE] (#9084))
	flags = OUTFIT_HAS_BACKPACK|OUTFIT_COMPREHENSIVE_SURVIVAL
	backpack_contents = list(/obj/item/clothing/accessory/permit/gun/planetside = 1)

/decl/hierarchy/outfit/job/explorer2/post_equip(mob/living/carbon/human/H)
	..()
	for(var/obj/item/clothing/accessory/permit/gun/planetside/permit in H.back.contents)
		permit.set_name(H.real_name)

/decl/hierarchy/outfit/job/explorer2/technician
<<<<<<< HEAD
	name = OUTFIT_JOB_NAME("Explorer Technician")
	belt = /obj/item/weapon/storage/belt/utility/full
=======
	name = OUTFIT_JOB_NAME(JOB_ALT_EXPLORERE_TECHNICIAN)
	belt = /obj/item/storage/belt/utility/full
>>>>>>> 5ea698a0ef ([MIRROR] Removes /obj/item/weapon and /obj/item/device [MDB IGNORE] (#9084))
	pda_slot = slot_l_store
	id_pda_assignment = "Explorer Technician"

/decl/hierarchy/outfit/job/explorer2/medic
<<<<<<< HEAD
	name = OUTFIT_JOB_NAME("Explorer Medic")
	l_hand = /obj/item/weapon/storage/firstaid/regular
=======
	name = OUTFIT_JOB_NAME(JOB_ALT_EXPLORER_MEDIC)
	l_hand = /obj/item/storage/firstaid/regular
>>>>>>> 5ea698a0ef ([MIRROR] Removes /obj/item/weapon and /obj/item/device [MDB IGNORE] (#9084))
	pda_slot = slot_l_store
	id_pda_assignment = "Explorer Medic"

/decl/hierarchy/outfit/job/pilot
	name = OUTFIT_JOB_NAME("Pilot")
	shoes = /obj/item/clothing/shoes/black
	uniform = /obj/item/clothing/under/rank/pilot1
	suit = /obj/item/clothing/suit/storage/toggle/bomber/pilot
	gloves = /obj/item/clothing/gloves/fingerless
	glasses = /obj/item/clothing/glasses/fakesunglasses/aviator
	l_ear = /obj/item/radio/headset/pilot/alt
	id_slot = slot_wear_id
	pda_slot = slot_belt
<<<<<<< HEAD
	pda_type = /obj/item/device/pda //VOREStation Edit - Civilian
	id_type = /obj/item/weapon/card/id/explorer/pilot //VOREStation Edit
	id_pda_assignment = "Pilot"
=======
	pda_type = /obj/item/pda //VOREStation Edit - Civilian
	id_type = /obj/item/card/id/explorer/pilot //VOREStation Edit
	id_pda_assignment = JOB_PILOT
>>>>>>> 5ea698a0ef ([MIRROR] Removes /obj/item/weapon and /obj/item/device [MDB IGNORE] (#9084))
	flags = OUTFIT_HAS_BACKPACK|OUTFIT_COMPREHENSIVE_SURVIVAL

/decl/hierarchy/outfit/job/medical/sar
	name = OUTFIT_JOB_NAME("Field Medic") //VOREStation Edit
	uniform = /obj/item/clothing/under/utility/blue
	//suit = /obj/item/clothing/suit/storage/hooded/wintercoat/medical/sar //VOREStation Edit
	shoes = /obj/item/clothing/shoes/boots/winter/explorer
	l_ear = /obj/item/radio/headset/sar
	l_hand = /obj/item/storage/firstaid/regular
	belt = /obj/item/storage/belt/medical/emt
	pda_slot = slot_l_store
<<<<<<< HEAD
	pda_type = /obj/item/device/pda/sar //VOREStation Add
	id_type = /obj/item/weapon/card/id/medical/sar
	id_pda_assignment = "Field Medic" //VOREStation Edit
=======
	pda_type = /obj/item/pda/sar //VOREStation Add
	id_type = /obj/item/card/id/medical/sar
	id_pda_assignment = JOB_FIELD_MEDIC //VOREStation Edit
>>>>>>> 5ea698a0ef ([MIRROR] Removes /obj/item/weapon and /obj/item/device [MDB IGNORE] (#9084))
	flags = OUTFIT_HAS_BACKPACK|OUTFIT_EXTENDED_SURVIVAL|OUTFIT_COMPREHENSIVE_SURVIVAL


/decl/hierarchy/outfit/job/pathfinder
	name = OUTFIT_JOB_NAME("Pathfinder")
	shoes = /obj/item/clothing/shoes/boots/winter/explorer
	uniform = /obj/item/clothing/under/explorer //TODO: Uniforms.
	l_ear = /obj/item/radio/headset/explorer
	id_slot = slot_wear_id
	pda_slot = slot_l_store
<<<<<<< HEAD
	pda_type = /obj/item/device/pda/pathfinder
	id_type = /obj/item/weapon/card/id/explorer/head/pathfinder
	id_pda_assignment = "Pathfinder"
=======
	pda_type = /obj/item/pda/pathfinder
	id_type = /obj/item/card/id/explorer/head/pathfinder
	id_pda_assignment = JOB_PATHFINDER
>>>>>>> 5ea698a0ef ([MIRROR] Removes /obj/item/weapon and /obj/item/device [MDB IGNORE] (#9084))
	flags = OUTFIT_HAS_BACKPACK|OUTFIT_EXTENDED_SURVIVAL|OUTFIT_COMPREHENSIVE_SURVIVAL
	backpack_contents = list(/obj/item/clothing/accessory/permit/gun/planetside = 1)

/decl/hierarchy/outfit/job/pathfinder/post_equip(mob/living/carbon/human/H)
	..()
	for(var/obj/item/clothing/accessory/permit/gun/planetside/permit in H.back.contents)
		permit.set_name(H.real_name)

/decl/hierarchy/outfit/job/assistant/explorer
	id_type = /obj/item/card/id/explorer
	flags = OUTFIT_HAS_BACKPACK|OUTFIT_COMPREHENSIVE_SURVIVAL
