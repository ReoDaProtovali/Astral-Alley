//ert wardrobe override, because these guys really don't need edgy red lockers with CCO dress uniforms, syndi(!!) turtlenecks, two edgy skull bandanas, or facemasks with no sprite. -Killian
/obj/structure/closet/wardrobe/ert
	closet_appearance = /decl/closet_appearance/tactical/alt	//because ert lockers are red for some dumb reason
	starts_with = list(
		/obj/item/clothing/under/ert,
<<<<<<< HEAD
		/obj/item/device/radio/headset/ert/alt,
=======
		/obj/item/radio/headset/ert,
		/obj/item/radio/headset/alt/ert,
>>>>>>> 61a5f758ac ([MIRROR] Headset Refactor and Selection (#9438))
		/obj/item/clothing/glasses/sunglasses,
		/obj/item/clothing/shoes/boots/swat,
		/obj/item/clothing/gloves/swat,
		/obj/item/clothing/mask/balaclava/tactical,
		/obj/item/clothing/mask/balaclava)

//would you believe mercs have no official locker? well, now they do. basically just a rebranded ERT locker but hey, it's an option. -Killian
/obj/structure/closet/wardrobe/merc
	name = "mercenary equipment"
	closet_appearance = /decl/closet_appearance/tactical

	starts_with = list(
		/obj/item/clothing/under/tactical,
		/obj/item/clothing/under/syndicate/combat,
<<<<<<< HEAD
		/obj/item/device/radio/headset/syndicate/alt,
=======
		/obj/item/radio/headset/syndicate,
		/obj/item/radio/headset/alt/syndicate,
		/obj/item/radio/headset/earbud/syndicate,
>>>>>>> 61a5f758ac ([MIRROR] Headset Refactor and Selection (#9438))
		/obj/item/clothing/glasses/sunglasses,
		/obj/item/clothing/shoes/boots/combat,
		/obj/item/clothing/gloves/combat,
		/obj/item/clothing/mask/balaclava/tactical,
		/obj/item/clothing/mask/balaclava,
		/obj/item/clothing/mask/bandana/skull)