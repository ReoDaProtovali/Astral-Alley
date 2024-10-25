/*
 * SC Engineering
 */


/obj/structure/closet/secure_closet/engineering_chief_wardrobe
	name = "chief engineer's wardrobe"
	req_access = list(access_ce)
	closet_appearance = /decl/closet_appearance/secure_closet/engineering/ce

	starts_with = list(
		/obj/item/clothing/under/rank/chief_engineer,
		/obj/item/clothing/under/rank/chief_engineer/skirt,
		/obj/item/clothing/head/hardhat/white,
		/obj/item/clothing/shoes/brown,
<<<<<<< HEAD
		/obj/item/weapon/cartridge/ce,
		/obj/item/device/radio/headset/heads/ce,
		/obj/item/device/radio/headset/heads/ce/alt,
		/obj/item/clothing/suit/storage/hazardvest,
		/obj/item/clothing/mask/gas,
		/obj/item/weapon/tank/emergency/oxygen/engi,
=======
		/obj/item/cartridge/ce,
		/obj/item/radio/headset/heads/ce,
		/obj/item/radio/headset/heads/ce/alt,
		/obj/item/clothing/suit/storage/hazardvest,
		/obj/item/clothing/mask/gas,
		/obj/item/tank/emergency/oxygen/engi,
>>>>>>> 026253a175 (upstream-merge-16484 [MDB IGNORE] (#9289))
		/obj/item/taperoll/engineering,
		/obj/item/clothing/suit/storage/hooded/wintercoat/engineering)

/obj/structure/closet/secure_closet/engineering_chief_wardrobe/Initialize()
	if(prob(50))
<<<<<<< HEAD
		starts_with += /obj/item/weapon/storage/backpack/industrial
	else
		starts_with += /obj/item/weapon/storage/backpack/satchel/eng
	if(prob(50))
		starts_with += /obj/item/weapon/storage/backpack/dufflebag/eng
=======
		starts_with += /obj/item/storage/backpack/industrial
	else
		starts_with += /obj/item/storage/backpack/satchel/eng
	if(prob(50))
		starts_with += /obj/item/storage/backpack/dufflebag/eng
>>>>>>> 026253a175 (upstream-merge-16484 [MDB IGNORE] (#9289))
	return ..()
