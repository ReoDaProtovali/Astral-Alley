/decl/hierarchy/outfit/job/cargo
<<<<<<< HEAD
	l_ear = /obj/item/device/radio/headset/headset_cargo
=======
>>>>>>> 61a5f758ac ([MIRROR] Headset Refactor and Selection (#9438))
	hierarchy_type = /decl/hierarchy/outfit/job/cargo

	headset = /obj/item/radio/headset/cargo
	headset_alt = /obj/item/radio/headset/alt/cargo
	headset_earbud = /obj/item/radio/headset/earbud/cargo

/decl/hierarchy/outfit/job/cargo/qm
	name = OUTFIT_JOB_NAME("Cargo")
	uniform = /obj/item/clothing/under/rank/cargo
<<<<<<< HEAD
	l_ear = /obj/item/device/radio/headset/headset_qm //VOREStation Add
=======
>>>>>>> 61a5f758ac ([MIRROR] Headset Refactor and Selection (#9438))
	shoes = /obj/item/clothing/shoes/brown
	glasses = /obj/item/clothing/glasses/sunglasses
	l_hand = /obj/item/weapon/clipboard
	id_type = /obj/item/weapon/card/id/cargo/head
	pda_type = /obj/item/device/pda/quartermaster

	headset = /obj/item/radio/headset/qm
	headset_alt = /obj/item/radio/headset/alt/qm
	headset_earbud = /obj/item/radio/headset/earbud/qm

/decl/hierarchy/outfit/job/cargo/cargo_tech
	name = OUTFIT_JOB_NAME("Cargo technician")
	uniform = /obj/item/clothing/under/rank/cargotech
	id_type = /obj/item/weapon/card/id/cargo
	pda_type = /obj/item/device/pda/cargo

/decl/hierarchy/outfit/job/cargo/mining
	name = OUTFIT_JOB_NAME("Shaft miner")
	uniform = /obj/item/clothing/under/rank/miner
<<<<<<< HEAD
	l_ear = /obj/item/device/radio/headset/headset_mine
	backpack = /obj/item/weapon/storage/backpack/industrial
	satchel_one  = /obj/item/weapon/storage/backpack/satchel/eng
	id_type = /obj/item/weapon/card/id/cargo/miner
	pda_type = /obj/item/device/pda/shaftminer
	backpack_contents = list(/obj/item/weapon/tool/crowbar = 1, /obj/item/weapon/storage/bag/ore = 1)
=======
	backpack = /obj/item/storage/backpack/industrial
	satchel_one  = /obj/item/storage/backpack/satchel/eng
	id_type = /obj/item/card/id/cargo/miner
	pda_type = /obj/item/pda/shaftminer
	backpack_contents = list(/obj/item/tool/crowbar = 1, /obj/item/storage/bag/ore = 1)
>>>>>>> 61a5f758ac ([MIRROR] Headset Refactor and Selection (#9438))
	flags = OUTFIT_HAS_BACKPACK|OUTFIT_EXTENDED_SURVIVAL

	headset = /obj/item/radio/headset/miner
	headset_alt = /obj/item/radio/headset/miner
	headset_earbud = /obj/item/radio/headset/miner
