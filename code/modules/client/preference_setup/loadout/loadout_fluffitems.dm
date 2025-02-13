/datum/gear/fluff
	path = /obj/item
	sort_category = "Fluff Items"
	display_name = "If this item can be chosen or seen, ping a coder immediately!"
	ckeywhitelist = list("This entry should never be choosable with this variable set.") //If it does, then that means somebody fucked up the whitelist system pretty hard
	character_name = list("This entry should never be choosable with this variable set.")
	cost = 0
/*
/datum/gear/fluff/testhorn
	path = /obj/item/weapon/bikehorn
	display_name = "Airhorn - Example Item"
	description = "An example item that you probably shouldn't see!"
<<<<<<< HEAD
=======
	ckeywhitelist = list("your_ckey_here")
	allowed_roles = list(JOB_ENGINEER)
*/

/datum/gear/fluff/collar //Use this as a base path for collars if you'd like to set tags in loadout. Make sure you don't use apostrophes in the display name or this breaks!
	slot = slot_tie

/datum/gear/fluff/collar/New()
	..()
	gear_tweaks += gear_tweak_collar_tag

/* CHOMPRemove Start Virgo Fluffitems
//  0-9 CKEYS
/datum/gear/fluff/malady_crop
	path = /obj/item/material/twohanded/riding_crop/malady
	display_name = "Malady's Crop"
	ckeywhitelist = list("1r1s")
	character_name = list("Malady Blanche")

//  A CKEYS

/datum/gear/fluff/mira_medal
	path = /obj/item/clothing/accessory/medal/silver/fluff/abc314
	display_name = "Mira's Health Service Achievement medal"
	ckeywhitelist = list("abc314")
	character_name = list("Mira Nesyne")

/datum/gear/fluff/lethe_helmet
	path = /obj/item/clothing/head/helmet/hos/fluff/lethe
	display_name = "Lethe's Helmet"
	slot = slot_head
	ckeywhitelist = list("adk09")
	character_name = list("Lethe")

/datum/gear/fluff/xander_bracer
	path = /obj/item/clothing/accessory/bracer/fluff/xander_sthasha
	display_name = "Xander's Bracer"
	ckeywhitelist = list("aegisoa")
	character_name = list("Xander Bevin")

/datum/gear/fluff/xander_medal
	path = /obj/item/clothing/accessory/medal/conduct
	display_name = "Xander's Conduct Medal"
	ckeywhitelist = list("aegisoa")
	character_name = list("Xander Bevin")

/datum/gear/fluff/xander_medal_2
	path = /obj/item/clothing/accessory/medal/silver/unity
	display_name = "Xander's Unity Medal"
	ckeywhitelist = list("aegisoa")
	character_name = list("Xander Bevin")

/datum/gear/fluff/charlotte_medal
    path = /obj/item/clothing/accessory/medal/silver/security
    display_name = "Charlotte's Robust Security Medal"
    ckeywhitelist = list("alfalah")
    character_name = list("Charlotte Graves")

/datum/gear/fluff/charlotte_medal_2
    path = /obj/item/clothing/accessory/medal/conduct
    display_name = "Charlotte's Medal of Conduct"
    ckeywhitelist = list("alfalah")
    character_name = list("Charlotte Graves")

/datum/gear/fluff/charlotte_cigarettes
	path = /obj/item/storage/fancy/fluff/charlotte
	display_name = "Charlotte's cigarette case"
	ckeywhitelist = list("alfalah")
	character_name = list("Charlotte Graves")

/datum/gear/fluff/fifi_hat
	path = /obj/item/clothing/head/fluff/fifi_hat
	display_name = "Fifi's hat"
	ckeywhitelist = list("allweek")
	character_name = list("Fifi The Magnificent")

/datum/gear/fluff/fifi_jumpsuit
	path = /obj/item/clothing/under/fluff/fifi_jumpsuit
	display_name = "Fifi's jumpsuit"
	ckeywhitelist = list("allweek")
	character_name = list("Fifi The Magnificent")

/datum/gear/fluff/fifi_socks
	path = /obj/item/clothing/shoes/fluff/fifi_socks
	display_name = "Fifi's socks"
	ckeywhitelist = list("allweek")
	character_name = list("Fifi The Magnificent")

/datum/gear/fluff/lynn_penlight
	path = /obj/item/flashlight/pen/fluff/lynn
	display_name = "Lynn's Penlight"
	ckeywhitelist = list("argobargsoup")
	character_name = list("Lynn Shady")

/datum/gear/fluff/felina_witchhat
	path = /obj/item/clothing/head/wizard/marisa/fake
	display_name = "Felina's Witch Hat"
	ckeywhitelist = list("argobargsoup")
	character_name = list("Felina Belliger")

/datum/gear/fluff/aronai_ccmeduniform
	path = /obj/item/clothing/under/solgov/utility/sifguard/officer/medical
	display_name  = "centcom medical uniform"
	description = "A medical uniform straight from Central Command."
	slot = slot_w_uniform
	ckeywhitelist = list("arokha")
	character_name = list("Aronai Sieyes")

/datum/gear/fluff/aronai_ccmedjacket
	path = /obj/item/clothing/suit/storage/solgov/service/sifguard/medical/command
	display_name  = "centcom medical jacket"
	description = "A medical jacket straight from Central Command."
	slot = slot_wear_suit
	ckeywhitelist = list("arokha")
	character_name = list("Aronai Sieyes")

/datum/gear/fluff/astra_ritualknife
	path = /obj/item/material/knife/ritual/fluff/astra
	display_name = "Polished Ritual Knife"
	description = "A well kept strange ritual knife, There is a small tag with the name 'Astra Ether' on it. They are probably looking for this."
	ckeywhitelist = list("astraether")
	character_name = list("Astra Ether")

/datum/gear/fluff/astra_medal
	path = /obj/item/clothing/accessory/medal/conduct
	display_name = "Astra's Conduct Medal"
	ckeywhitelist = list("astraether")
	character_name = list("Astra Ether")

/datum/gear/fluff/astra_medal_2
	path = /obj/item/clothing/accessory/medal/silver/unity
	display_name = "Astra's Unity Medal"
	ckeywhitelist = list("astraether")
	character_name = list("Astra Ether")

/datum/gear/fluff/collar/azura
	path = /obj/item/clothing/accessory/collar/azura
	display_name = "collar, Azura"
	description = "For the kobold's pet."
	ckeywhitelist = list("azurachitin")
	character_name = list("Azura Chitin")

/datum/gear/fluff/aurora
	path = /obj/item/clothing/accessory/solgov/department/security/aurora
	display_name = "Aurora's keepsake"
	description = "An old solcom sec insignia given to Aurora"
	ckeywhitelist = list("storesund97")
	character_name = list("Aurora")

/datum/gear/fluff/ashling
	path = /obj/item/clothing/accessory/storage/ritualharness/fluff/antoinette
	display_name = "Ritual Harness"
	description = "Antoinette's ritual supplies."
	ckeywhitelist = list("ashling")
	character_name = list("Antoinette DeKaultieste")

//  B CKEYS
/datum/gear/fluff/yuuko_kimono
	path = /obj/item/clothing/under/fluff/sakura_hokkaido_kimono
	display_name = "Yuuko's Kimono"
	slot = slot_w_uniform
	ckeywhitelist = list("benemuel")
	character_name = list("Yuuko Shimmerpond")

/datum/gear/fluff/cassandra_box
	path = /obj/item/storage/box/fluff/cassandra
	display_name = "Cassandra's Box"
	ckeywhitelist = list("beyondmylife")
	character_name = list("Cassandra Selone")

/datum/gear/fluff/kilano_dress
	path = /obj/item/clothing/under/dress/fluff/kilano
	display_name = "Kilano's Dress"
	slot = slot_w_uniform
	ckeywhitelist = list("beyondmylife")
	character_name = list("Kilano Soryu")

/datum/gear/fluff/kilano_gloves
	path = /obj/item/clothing/gloves/fluff/kilano
	display_name = "Kilano's Gloves"
	slot = slot_gloves
	ckeywhitelist = list("beyondmylife")
	character_name = list("Kilano Soryu")

/datum/gear/fluff/netra_box
	path = /obj/item/storage/box/fluff/kilano
	display_name = "Ne'tra's Box"
	ckeywhitelist = list("beyondmylife")
	character_name = list("Ne'tra Ky'ram")

/datum/gear/fluff/nolan_medal
	path = /obj/item/clothing/accessory/medal/silver/unity
	display_name = "Nolan's Unity Medal"
	ckeywhitelist = list("blakeryan")
	character_name = list("Nolan Conaway")

/datum/gear/fluff/amber_medal
	path = /obj/item/clothing/accessory/medal/conduct
	display_name = "Amber's Conduct Medal"
	ckeywhitelist = list("bluewolf128")
	character_name = list("Amber Wresspenn")

/datum/gear/fluff/charles_hat
	path = /obj/item/clothing/head/that/fluff/gettler
	display_name = "Charles' Top-Hat"
	ckeywhitelist = list("bobofboblandia")
	character_name = list("Charles Gettler")

/datum/gear/fluff/nettie_tablet
	path = /obj/item/modular_computer/tablet/preset/custom_loadout/nettie
	display_name = "Remodeled Tablet"
	ckeywhitelist = list("bricker98")
	character_name = list("Nettie Stough")

/datum/gear/fluff/xin_sovietuniform
	path = /obj/item/clothing/under/soviet
	display_name = "Xin's Soviet Uniform"
	description = "This soviet uniform has seen considerable use over the years, it's rather worn in some places, frayed in others and the stomach region has signs of being stretched out repeatedly."
	slot = slot_w_uniform
	ckeywhitelist = list("britishrabbit")
	character_name = list("Xin Xiao")

/datum/gear/fluff/tasald_box
	path = /obj/item/storage/box/fluff/tasald
	display_name = "Tasald's Box"
	ckeywhitelist = list("bwoincognito")
	character_name = list("Tasald Corlethian")

/datum/gear/fluff/octavius_box
	path = /obj/item/storage/box/fluff/octavious
	display_name = "Octavious' Box"
	ckeywhitelist = list("bwoincognito")
	character_name = list("Octavious Ward")

/datum/gear/fluff/jayda_meduniform
	path = /obj/item/clothing/under/solgov/utility/sifguard/medical/fluff
	display_name = "Jayda's Uniform"
	slot = slot_w_uniform
	ckeywhitelist = list("burritojustice")
	character_name = list("Jayda Wilson")

/datum/gear/fluff/star_hoodie
	path = /obj/item/clothing/suit/storage/star
	display_name = "Star hoodie"
	slot = slot_wear_suit
	ckeywhitelist = list("bacon12366")
	character_name = list("Elly Brown")

/datum/gear/fluff/alibig_medal
	path = /obj/item/clothing/accessory/medal/conduct
	display_name = "Ali Big's Conduct Medal"
	ckeywhitelist = list("bigbababooey")
	character_name = list("Ali Big")

/datum/gear/fluff/beeholddrbeesphb_plushie
	path = /obj/item/laser_pointer/evelynn_fluff
	display_name = "Evelynn's Laser Pointer"
	ckeywhitelist = list("beeholddrbeesphb")
	character_name = list("Evelynn")

//  C CKEYS
/datum/gear/fluff/cappy_watch
	path = /obj/item/clothing/accessory/watch/custom
	display_name = "Cappy's Pocket Watch"
	ckeywhitelist = list("cappycat")
	character_name = list("Cappy Fuzzlyfeathers")

/datum/gear/fluff/james_disk
	path = /obj/item/disk/body_record
	display_name = "James' Disk"
	ckeywhitelist = list("cockatricexl")
	character_name = list("James Holder")

/datum/gear/fluff/diana_robe
	path = /obj/item/clothing/suit/fluff/purp_robes
	display_name = "Diana's Robes"
	slot = slot_wear_suit
	ckeywhitelist = list("cameron653")
	character_name = list("Diana Kuznetsova")

/datum/gear/fluff/diana_tiara
	path = /obj/item/clothing/head/fluff/pink_tiara
	display_name = "Diana's Tiara"
	slot = slot_head
	ckeywhitelist = list("cameron653")
	character_name = list("Diana Kuznetsova")

/datum/gear/fluff/aika_coat
	path = /obj/item/clothing/suit/fluff/blue_trimmed_coat
	display_name = "Aika's Coat"
	slot = slot_wear_suit
	ckeywhitelist = list("chaoko99")
	character_name = list("Aika Hisakawa")

/datum/gear/fluff/sariU_disk
	path = /obj/item/disk/limb/eggnerdltd
	display_name = "Sari-U's Eggnerd Disk"
	ckeywhitelist = list("crossexonar")
	character_name = list("Sari-U")

/datum/gear/fluff/sariE_disk
	path = /obj/item/disk/limb/eggnerdltd
	display_name = "Sari-E's Eggnerd Disk"
	ckeywhitelist = list("crossexonar")
	character_name = list("Sari-E")

/datum/gear/fluff/alexandria_medal
	path = /obj/item/clothing/accessory/medal/silver/unity
	display_name = "Alexandria's Unity Medal"
	ckeywhitelist = list("cgr")
	character_name = list("Alexandria Kozetto")

/datum/gear/fluff/hisako_medal
	path = /obj/item/clothing/accessory/medal/silver/unity
	display_name = "Hisako's Unity Medal"
	ckeywhitelist = list("chaleur")
	character_name = list("Hisako Arato")

/datum/gear/fluff/perrin_robes
	path = /obj/item/clothing/under/fluff/gildedrobe_perrin
	display_name = "Perrin's Robes"
	ckeywhitelist = list("codeme")
	character_name = list("Perrin Kade")

/datum/gear/fluff/perrin_shoes
	path = /obj/item/clothing/shoes/fluff/gildedshoes_perrin
	display_name = "Perrin's Shoes"
	ckeywhitelist = list("codeme")
	character_name = list("Perrin Kade")

/datum/gear/fluff/jade_stamp
	path = /obj/item/stamp/fluff/jade_horror
	display_name = "Official Council of Mid Horror rubber stamp"
	ckeywhitelist = list("coolcrow420")
	character_name = list("Jade Davis")

/datum/gear/fluff/m4il_hdd
	path = /obj/item/implant/language/fluff/m41l
	display_name = "dusty hard drive"
	slot = "implant"
	ckeywhitelist = list("coolcrow420")
	character_name = list("M41L")

//  D CKEYS
/datum/gear/fluff/Aku_briefcase
	path = /obj/item/storage/secure/briefcase/dealer
	display_name = "Aku's dealer briefcase"
	ckeywhitelist = list("defiintelynotarock")
	character_name = list("Aku Zoles")

/datum/gear/fluff/dhaeleena_medal
	path = /obj/item/clothing/accessory/medal/silver/security/fluff/dhael
	display_name = "Dhaeleena's Medal"
	ckeywhitelist = list("dhaeleena")
	character_name = list("Dhaeleena M'iar")

/datum/gear/fluff/elliot_belt
	path = /obj/item/storage/belt/champion
	display_name = "Elliot's Belt"
	ckeywhitelist = list("dickfreedomjohnson")
	character_name = list("Elliot Richards")

/datum/gear/fluff/donald_medal
	path = /obj/item/clothing/accessory/medal/conduct
	display_name = "Donald's Conduct Medal"
	ckeywhitelist = list("drainquake")
	character_name = list("Donald Weinbeck")

/datum/gear/fluff/donald_medal_2
	path = /obj/item/clothing/accessory/medal/bronze_heart
	display_name = "Donald's Heart Medal"
	ckeywhitelist = list("drainquake")
	character_name = list("Donald Weinbeck")

/datum/gear/fluff/drake_box
	path = /obj/item/storage/box/fluff/drake
	display_name = "Drake's Box"
	ckeywhitelist = list("drakefrostpaw")
	character_name = list("Drake Frostpaw")

/datum/gear/fluff/theseus_coin
	path = /obj/item/coin/diamond
	display_name  = "Theseus' Diamond coin"
	ckeywhitelist = list("draycu")
	character_name = list("Theseus")
	description = "An engraved coin made of diamond. On the side for heads is printed the year 2541, along with the letter T. On the side for tails, the letter Y can be seen."

/datum/gear/fluff/yonra_box
	path = /obj/item/storage/box/fluff/yonra
	display_name = "Yonra's Box"
	ckeywhitelist = list("draycu")
	character_name = list("Schae Yonra")

//  E CKEYS
/datum/gear/fluff/serkii_slippers
	path = /obj/item/clothing/shoes/slippers
	display_name = "Serkii's Slippers"
	slot = slot_shoes
	ckeywhitelist = list("eekasqueak")
	character_name = list("Serkii Miishy")

/datum/gear/fluff/serkii_skirt
	path = /obj/item/clothing/under/skirt/fluff/serkii
	display_name = "Serkii's Skirt"
	slot = slot_w_uniform
	ckeywhitelist = list("eekasqueak")
	character_name = list("Serkii Miishy")

/datum/gear/fluff/jessie_coat
	path = /obj/item/clothing/suit/storage/hooded/wintercoat/jessie
	display_name = "Jessie's Coat"
	slot = slot_wear_suit
	ckeywhitelist = list("epiccharger")
	character_name = list("Jessie Mare")

/datum/gear/fluff/verd_medal
	path = /obj/item/clothing/accessory/medal/bronze_heart
	display_name = "Verd's Medal"
	ckeywhitelist = list("epigraphzero")
	character_name = list("Verd Woodrow")

/datum/gear/fluff/erik_medal
	path = /obj/item/clothing/accessory/medal/silver/unity
	display_name = "Erik's Unity Medal"
	ckeywhitelist = list("erikthedog")
	character_name = list("Erik Ramadwood")

/datum/gear/fluff/salvage_id
	path = /obj/item/card/id/event/polymorphic/itg
	display_name = "Salvage's ITG-ID card"
	ckeywhitelist = list("essbie")
	character_name = list("Savage")

//  F CKEYS
/datum/gear/fluff/yikatihaki_armor
	path = /obj/item/clothing/suit/armor/vox_scrap
	display_name = "Yikatihaki's Armor"
	slot = slot_wear_suit
	ckeywhitelist = list("flaktual")
	character_name = list("Yikatihaki")
	allowed_roles = list(JOB_EXPLORER)

/datum/gear/fluff/suit/storage/flintlock
	path = /obj/item/clothing/suit/storage/flintlock
	display_name = "Flintlock's jacket"
	slot = slot_wear_suit
	ckeywhitelist = list("flintlockdafox")
	character_name = list("Flintlock Sharpsman")

/datum/gear/fluff/zera_weldmask
	path = /obj/item/clothing/head/welding/fluff/zera
	display_name = "Zera's Welding Mask"
	slot = slot_head
	ckeywhitelist = list("fuackwit422")
	character_name = list("Zera Livanne")

/datum/gear/fluff/zera_labcloak
	path = /obj/item/clothing/suit/storage/toggle/labcoat/fluff/zera
	display_name = "Zera's Labcloak"
	slot = slot_wear_suit
	ckeywhitelist = list("fuackwit422")
	character_name = list("Zera Livanne")

/datum/gear/fluff/zera_cloak
	path = /obj/item/clothing/head/fluff/zerahat
	display_name = "Grand Purple Hat"
	slot = slot_head
	ckeywhitelist = list("fuackwit422")
	character_name = list("Zera Livanne")

/datum/gear/fluff/zera_hat
	path = /obj/item/clothing/suit/storage/toggle/labcoat/fluff/zeracloak
	display_name = "Grand Purple Cloak"
	slot = slot_wear_suit
	ckeywhitelist = list("fuackwit422")
	character_name = list("Zera Livanne")


//  G CKEYS

//  H CKEYS

/datum/gear/fluff/lauren_medal
	path = /obj/item/clothing/accessory/medal/conduct
	display_name = "Lauren's Medal"
	ckeywhitelist = list("heroman3003")
	character_name = list("Lauren Zackson")

/datum/gear/fluff/lauren_string
	path = /obj/item/clothing/accessory/collar/fluff/goldenstring
	display_name = "Lauren's String"
	ckeywhitelist = list("heroman3003")
	character_name = list("Lauren Zackson")

/datum/gear/fluff/belle_sizegun
	path = /obj/item/gun/energy/sizegun
	display_name = "Belle's Sizegun"
	ckeywhitelist = list("hottokeeki")
	character_name = list("Belle Day")

/datum/gear/fluff/amaryll_claws
	path = /obj/item/surgical/scalpel/amaryll_claws
	display_name = "Amaryll's Claws"
	ckeywhitelist = list("hunterbirk")
	character_name = list("Amaryll")

/datum/gear/fluff/aria_conduct_medal
	path = /obj/item/clothing/accessory/medal/conduct
	display_name = "Aria's Distinguished Conduct Medal"
	ckeywhitelist = list("hunterbirk")
	character_name = list("Aria Blue")

/datum/gear/fluff/elizabeth_conduct_medal
	path = /obj/item/clothing/accessory/medal/conduct
	display_name = "Elizabeth's Distinguished Conduct Medal"
	ckeywhitelist = list("hunterbirk")
	character_name = list("Elizabeth Bayou")

/datum/gear/fluff/mercury_vopal_ring
	path = /obj/item/clothing/accessory/ring/material/void_opal/fluff/mercury
	display_name = "Mercury's Mate Ring"
	ckeywhitelist = list("haloren")
	character_name = list("Mercury")

//  I CKEYS
/datum/gear/fluff/ruda_badge
	path = /obj/item/clothing/accessory/badge/holo/detective/ruda
	display_name = "Ruda's " + JOB_DETECTIVE + " Badge"
	ckeywhitelist = list("interrolouis")
	character_name = list("Ruda Lizden")

/datum/gear/fluff/kai_modkit
	path = /obj/item/borg/upgrade/modkit/chassis_mod/kai
	display_name = "Kai's Modkit"
	ckeywhitelist = list("interrolouis")
	character_name = list("Kai Highlands")

/datum/gear/fluff/ivy_backpack
	path = /obj/item/storage/backpack/messenger/sec/fluff/ivymoomoo
	display_name = "Ivy's Backpack"
	slot = slot_back
	ckeywhitelist = list("ivymoomoo")
	character_name = list("Ivy Baladeva")

/datum/gear/fluff/farren_medal
	path = /obj/item/clothing/accessory/medal/silver/unity
	display_name = "Farren's Unity Medal"
	ckeywhitelist = list("itsaket")
	character_name = list("Farren Fruit")

/datum/gear/fluff/myse_monk
	path = /obj/item/clothing/suit/imperium_monk
	display_name = "Imperium monk"
	ckeywhitelist = list("itsaket")
	character_name = list("Myse Topazian IV")

//  J CKEYS
/datum/gear/fluff/mor_box
	path = /obj/item/storage/box/fluff/morxaina
	display_name = "Mor's Box"
	ckeywhitelist = list("jacknoir413")
	character_name = list("Mor Xaina")

/datum/gear/fluff/areax_staff
	path = /obj/item/storage/backpack/fluff/stunstaff
	display_name = "Areax's Stun Staff"
	slot = slot_back
	ckeywhitelist = list("jacknoir413")
	character_name = list("Areax Third")
	allowed_roles = list(JOB_SECURITY_OFFICER, JOB_WARDEN, JOB_HEAD_OF_SECURITY)

/datum/gear/fluff/earthen_uniform
	path = /obj/item/clothing/under/fluff/earthenbreath
	display_name = "Earthen's Uniform"
	slot = slot_w_uniform
	ckeywhitelist = list("jacobdragon")
	character_name = list("Earthen Breath")

/datum/gear/fluff/earthen_hairpin
	path = /obj/item/clothing/head/fluff/hairflowerpin
	display_name = "Earthen's Flower Pin"
	slot = slot_head
	ckeywhitelist = list("jacobdragon")
	character_name = list("Earthen Breath")

/datum/gear/fluff/jademanique_freyr_mask
	path = /obj/item/clothing/mask/fluff/freyr_mask
	display_name = "Freyr's Mask"
	slot = slot_head
	ckeywhitelist = list("jademanique")
	character_name = list("Freyr")

/datum/gear/fluff/cirra_box
	path = /obj/item/storage/box/fluff/cirra
	display_name = "Cirra's Box"
	ckeywhitelist = list("jemli")
	character_name = list("Cirra Mayhem")

/datum/gear/fluff/jemli_fedora
	path = /obj/item/clothing/head/fedora/fluff/jemli
	display_name = "Jemli's Fedora"
	slot = slot_head
	ckeywhitelist = list("jemli")
	character_name = list("Jemli")

/datum/gear/fluff/fen_crown
	path = /obj/item/clothing/head/crown
	display_name = "Princess Crown"
	slot = slot_head
	ckeywhitelist = list("jemli")
	character_name = list("Princess Afenia")

/datum/gear/fluff/jeremiah_holster
	path = /obj/item/clothing/accessory/holster/armpit
	display_name = "Ace's Holster"
	ckeywhitelist = list("jertheace")
	character_name = list("Jeremiah Acacius")
	allowed_roles = list(JOB_SITE_MANAGER, JOB_WARDEN, JOB_HEAD_OF_SECURITY)

/datum/gear/fluff/jeremiah_boots
	path = /obj/item/clothing/shoes/boots/combat
	display_name = "Ace's Boots"
	slot = slot_shoes
	ckeywhitelist = list("jertheace")
	character_name = list("Jeremiah Acacius")

/datum/gear/fluff/jeremiah_combatuniform
	path = /obj/item/clothing/under/syndicate/combat
	display_name = "Ace's Combat Uniform"
	slot = slot_w_uniform
	ckeywhitelist = list("jertheace")
	character_name = list("Jeremiah Acacius")

/datum/gear/fluff/joan_backpack
	path = /obj/item/storage/backpack/dufflebag/sec/fluff/joanrisu
	display_name = "Joan's backpack"
	ckeywhitelist = list("joanrisu")
	character_name = list("Joan Risu")


/datum/gear/fluff/katarina_backpack
	path = /obj/item/storage/backpack/dufflebag/sec/fluff/katarina
	display_name = "Katarina's Backpack"
	ckeywhitelist = list("joanrisu")
	character_name = list("Katarina Eine")
	allowed_roles = list(JOB_SITE_MANAGER, JOB_WARDEN, JOB_HEAD_OF_SECURITY)

/datum/gear/fluff/emoticon_box
	path = /obj/item/storage/box/fluff/emoticon
	display_name = "Emoticon's Box"
	ckeywhitelist = list("joey4298")
	character_name = list("Emoticon")

/datum/gear/fluff/emoticon_mimeuniform
	path = /obj/item/clothing/under/sexymime
	display_name = "Emoticon's Mime Uniform"
	slot = slot_w_uniform
	ckeywhitelist = list("joey4298")
	character_name = list("Emoticon")

/datum/gear/fluff/emoticon_mimemask
	path = /obj/item/clothing/mask/gas/sexymime
	display_name = "Emoticon's Mime Mask"
	slot = slot_wear_mask
	ckeywhitelist = list("joey4298")
	character_name = list("Emoticon")

/datum/gear/fluff/harmony_medal
	path = /obj/item/clothing/accessory/medal/gold/heroism
	display_name = "Harmony's Heroism Medal"
	ckeywhitelist = list("john.wayne9392")
	character_name = list("Harmony Pretchl")

/datum/gear/fluff/harmony_modkit
	path = /obj/item/modkit_conversion/fluff/harmonysuit
	display_name = "Harmony's Modkit"
	ckeywhitelist = list("john.wayne9392")
	character_name = list("Harmony Pretchl")

/datum/gear/fluff/harmony_spacemodkit
	path = /obj/item/modkit_conversion/fluff/harmonyspace
	display_name = "Harmony's Modkit 2"
	ckeywhitelist = list("john.wayne9392")
	character_name = list("Harmony Pretchl")

/datum/gear/fluff/vox_dylo_pills
	path = /obj/item/storage/pill_bottle/dylovene
	display_name = "Dylovene pill bottle"
	ckeywhitelist = list("jparker890")
	character_name = list("Krey-Timinine")

/datum/gear/fluff/koyo_box
	path = /obj/item/storage/box/fluff/koyoakimomi
	display_name = "Koyo's Box"
	ckeywhitelist = list("jwguy")
	character_name = list("Koyo Akimomi")

//  K CKEYS
/datum/gear/fluff/smu_medal
	path = /obj/item/clothing/accessory/medal/nobel_science
	display_name = "SMU's Nobel Science Award"
	ckeywhitelist = list("keekenox")
	character_name = list("SMU-453")

/datum/gear/fluff/ketrai_hat
	path = /obj/item/clothing/head/fluff/ketrai
	display_name = "Ketrai's Hat"
	slot = slot_head
	ckeywhitelist = list("ketrai")
	character_name = list("Ketrai")

/datum/gear/fluff/amaya_id
	path = /obj/item/card/id/event/fluff/amaya
	display_name = "Amaya's ID"
	ckeywhitelist = list("kiraalitruss")
	character_name = list("Amaya Rahl")

/datum/gear/fluff/kisuke_glasses
	path = /obj/item/clothing/glasses/omnihud/kamina
	display_name = "Kisuke's Kamina Glasses"
	slot = slot_glasses
	ckeywhitelist = list("kisukegema")
	character_name = list("Kisuke Gema")

/datum/gear/fluff/collar/excess
	path = /obj/item/clothing/accessory/collar/pink/fluff/warning
	display_name = "collar, Excess"
	ckeywhitelist = list("killerdragn")
	character_name = list("Excess")

/datum/gear/fluff/excess_uniform
	path = /obj/item/clothing/under/fluff/excess
	display_name = "Excess's Uniform"
	slot = slot_w_uniform
	ckeywhitelist = list("killerdragn")
	character_name = list("Excess")

/datum/gear/fluff/lassara_sheath
	path = /obj/item/clothing/accessory/storage/knifeharness
	display_name = "Lassara's Knife Harness"
	ckeywhitelist = list("killjaden")
	character_name = list("Lassara Faaira'Nrezi")

/datum/gear/fluff/rana_medal
	path = /obj/item/clothing/accessory/medal/silver/unity
	display_name = "Rana's Unity Medal"
	ckeywhitelist = list("kitchifox")
	character_name = list("Rana Starsong-Uma")

/datum/gear/fluff/taiga_uniform
	path = /obj/item/clothing/under/fluff/taiga
	display_name = "Taifa's Uniform"
	slot = slot_w_uniform
	ckeywhitelist = list("kiwidaninja")
	character_name = list("Chakat Taiga")

/datum/gear/fluff/ashley_medal
	path = /obj/item/clothing/accessory/medal/nobel_science/fluff/ashley
	display_name = "Ashley's Medal"
	ckeywhitelist = list("knightfall5")
	character_name = list("Ashley Kifer")

//  L CKEYS
/datum/gear/fluff/kenzie_medal
	path = /obj/item/clothing/accessory/medal/conduct
	display_name = "Kenzie's Conduct Medal"
	ckeywhitelist = list("lm40")
	character_name = list("Kenzie Houser")

/datum/gear/fluff/kenzie_hypospray
	path = /obj/item/reagent_containers/hypospray/vial/kenzie
	display_name = "Kenzie's Hypospray"
	ckeywhitelist = list("lm40")
	character_name = list("Kenzie Houser")
	allowed_roles = list(JOB_CHIEF_MEDICAL_OFFICER,JOB_MEDICAL_DOCTOR,JOB_CHEMIST,JOB_PSYCHIATRIST,JOB_PARAMEDIC)

/datum/gear/fluff/brianna_backpack
	path = /obj/item/storage/backpack/messenger/black/fluff/briana
	display_name = "Briana's Backpack"
	slot = slot_back
	ckeywhitelist = list("luminescentring")
	character_name = list("Briana Moore")

/datum/gear/fluff/zharritool
	path = /obj/item/tool/transforming/altevian
	display_name = "Zharri's Custom Omni-Tool"
	description = "A Hull Systems Omni-Tool capable of temporarily shrinking to handheld sizes for even the most delicate work."
	ckeywhitelist = list("lewzharri")
	character_name = list ("Kovgam Zharri")
	allowed_roles = list(JOB_ROBOTICIST,JOB_ENGINEER,JOB_SCIENTIST,JOB_XENOBIOLOGIST,JOB_XENOBOTANIST,JOB_RESEARCH_DIRECTOR)

//  M CKEYS
/datum/gear/fluff/phi_box
	path = /obj/item/storage/box/fluff/phi
	display_name = "Phi's Box"
>>>>>>> 7bfffc808d ([MIRROR] Adds Trait Genetics (#10142))
	ckeywhitelist = list("mewchild")
	allowed_roles = list("Station Engineer")
*/
//The above is a direct copy of the core info from the _vr file
