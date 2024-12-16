/*
*	Here is where any supply packs
*	related to medical tasks live.
*/


/datum/supply_pack/med
	group = "Medical"

/datum/supply_pack/med/medical
	name = "Basic Medical Supplies"
	desc = "A selection of basic medical supplies, used for treating most simple maladies."
	contains = list(
			/obj/item/weapon/storage/firstaid/regular,
			/obj/item/weapon/storage/firstaid/fire,
			/obj/item/weapon/storage/firstaid/toxin,
			/obj/item/weapon/storage/firstaid/o2,
			/obj/item/weapon/storage/firstaid/adv,
			/obj/item/weapon/reagent_containers/glass/bottle/antitoxin,
			/obj/item/weapon/reagent_containers/glass/bottle/inaprovaline,
			/obj/item/weapon/reagent_containers/glass/bottle/stoxin,
			/obj/item/weapon/storage/box/syringes,
			/obj/item/weapon/storage/box/autoinjectors
			)
	cost = 15
	containertype = /obj/structure/closet/crate/zenghu
	containername = "Medical crate"

/datum/supply_pack/med/bloodpack
	name = "BloodPack crate"
<<<<<<< HEAD
	contains = list(/obj/item/weapon/storage/box/bloodpacks = 3)
=======
	desc = "Three boxes of bloodbags."
	contains = list(/obj/item/storage/box/bloodpacks = 3)
>>>>>>> bd0bae7b43 ([MIRROR] Supply Pack Details/Descriptions (#9644))
	cost = 10
	containertype = /obj/structure/closet/crate/medical/blood
	containername = "BloodPack crate"

/datum/supply_pack/med/synthplas
	name = "BloodPack (Synthplas) crate"
<<<<<<< HEAD
	contains = list(/obj/item/weapon/reagent_containers/blood/synthplas = 6)
=======
	desc = "Six containers of synthetic blood replacement."
	contains = list(/obj/item/reagent_containers/blood/synthplas = 6)
>>>>>>> bd0bae7b43 ([MIRROR] Supply Pack Details/Descriptions (#9644))
	cost = 80
	containertype = /obj/structure/closet/crate/nanomed
	containername = "SynthPlas crate"

/datum/supply_pack/med/bodybag
	name = "Body bag crate"
<<<<<<< HEAD
	contains = list(/obj/item/weapon/storage/box/bodybags = 3)
=======
	desc = "Five boxes of body bags."
	contains = list(/obj/item/storage/box/bodybags = 3)
>>>>>>> bd0bae7b43 ([MIRROR] Supply Pack Details/Descriptions (#9644))
	cost = 10
	containertype = /obj/structure/closet/crate/nanomed
	containername = "Body bag crate"

/datum/supply_pack/med/cryobag
	name = "Stasis bag crate"
	desc = "Three stasis bags."
	contains = list(/obj/item/bodybag/cryobag = 3)
	cost = 40
	containertype = /obj/structure/closet/crate/nanomed
	containername = "Stasis bag crate"

/datum/supply_pack/med/surgery
	name = "Surgery crate"
	desc = "A set of replacement surgical equipment. Requires Medical access."
	contains = list(
			/obj/item/weapon/surgical/cautery,
			/obj/item/weapon/surgical/surgicaldrill,
			/obj/item/clothing/mask/breath/medical,
			/obj/item/weapon/tank/anesthetic,
			/obj/item/weapon/surgical/FixOVein,
			/obj/item/weapon/surgical/hemostat,
			/obj/item/weapon/surgical/scalpel,
			/obj/item/weapon/surgical/bonegel,
			/obj/item/weapon/surgical/retractor,
			/obj/item/weapon/surgical/bonesetter,
			/obj/item/weapon/surgical/circular_saw
			)
	cost = 25
	containertype = /obj/structure/closet/crate/secure/veymed
	containername = "Surgery crate"
	access = access_medical

/datum/supply_pack/med/deathalarm
	name = "Death Alarm crate"
	desc = "Death alarms, a now somewhat-antiquated means of tracking the status of vital personnel. Requires Medical access."
	contains = list(
			/obj/item/weapon/storage/box/cdeathalarm_kit,
			/obj/item/weapon/storage/box/cdeathalarm_kit
			)
	cost = 40
	containertype = /obj/structure/closet/crate/secure/ward
	containername = "Death Alarm crate"
	access = access_medical

/datum/supply_pack/med/clotting
	name = "Clotting Medicine crate"
	desc = "Zeng Hu-branded \'clotting\' nanomedicine, used to treat internal bleeding without resorting to invasive surgeries. Requires Medical access."
	contains = list(
			/obj/item/weapon/storage/firstaid/clotting
			)
	cost = 100
	containertype = /obj/structure/closet/crate/secure/zenghu
	containername = "Clotting Medicine crate"
	access = access_medical

/datum/supply_pack/med/sterile
	name = "Sterile equipment crate"
	desc = "A pack of standard sterile equipment and medical scrubs."
	contains = list(
			/obj/item/clothing/under/rank/medical/scrubs/green = 2,
			/obj/item/clothing/head/surgery/green = 2,
			/obj/item/weapon/storage/box/masks,
			/obj/item/weapon/storage/box/gloves,
			/obj/item/weapon/storage/belt/medical = 3
			)
	cost = 10
	containertype = /obj/structure/closet/crate/veymed
	containername = "Sterile equipment crate"

/datum/supply_pack/med/extragear
	name = "Medical surplus equipment"
	desc = "Assorted surplus medical equipment. Requires Medical access."
	contains = list(
			/obj/item/weapon/storage/belt/medical = 3,
			/obj/item/clothing/glasses/hud/health = 3,
			/obj/item/device/radio/headset/headset_med/alt = 3,
			/obj/item/clothing/suit/storage/hooded/wintercoat/medical = 3
			)
	cost = 10
	containertype = /obj/structure/closet/crate/secure/nanomed
	containername = "Medical surplus equipment"
	access = access_medical

/datum/supply_pack/med/cmogear
	name = "Chief Medical Officer equipment"
	desc = "Standard equipment for the Chief Medical Officer. Requires CMO access."
	contains = list(
			/obj/item/weapon/storage/belt/medical,
			/obj/item/device/radio/headset/heads/cmo,
			/obj/item/clothing/under/rank/chief_medical_officer,
			/obj/item/weapon/reagent_containers/hypospray/vial,
			/obj/item/clothing/accessory/stethoscope,
			/obj/item/clothing/glasses/hud/health,
			/obj/item/clothing/suit/storage/toggle/labcoat/cmo,
			/obj/item/clothing/suit/storage/toggle/labcoat/cmoalt,
			/obj/item/clothing/mask/surgical,
			/obj/item/clothing/shoes/white,
			/obj/item/weapon/cartridge/cmo,
			/obj/item/clothing/gloves/sterile/latex,
			/obj/item/device/healthanalyzer,
			/obj/item/device/flashlight/pen,
			/obj/item/weapon/reagent_containers/syringe
			)
	cost = 50
	containertype = /obj/structure/closet/crate/secure/nanomed
	containername = "Chief medical officer equipment"
	access = access_cmo

/datum/supply_pack/med/doctorgear
<<<<<<< HEAD
	name = "Medical Doctor equipment"
=======
	name = JOB_MEDICAL_DOCTOR + " equipment"
	desc = "Standard equipment for basic Medical personnel. Requires Medical access."
>>>>>>> bd0bae7b43 ([MIRROR] Supply Pack Details/Descriptions (#9644))
	contains = list(
			/obj/item/weapon/storage/belt/medical,
			/obj/item/device/radio/headset/headset_med,
			/obj/item/clothing/under/rank/medical,
			/obj/item/clothing/accessory/stethoscope,
			/obj/item/clothing/glasses/hud/health,
			/obj/item/clothing/suit/storage/toggle/labcoat,
			/obj/item/clothing/mask/surgical,
			/obj/item/weapon/storage/firstaid/adv,
			/obj/item/clothing/shoes/white,
			/obj/item/weapon/cartridge/medical,
			/obj/item/clothing/gloves/sterile/latex,
			/obj/item/device/healthanalyzer,
			/obj/item/device/flashlight/pen,
			/obj/item/weapon/reagent_containers/syringe
			)
	cost = 20
	containertype = /obj/structure/closet/crate/secure/nanomed
	containername = "Medical Doctor equipment"
	access = access_medical_equip

/datum/supply_pack/med/chemistgear
<<<<<<< HEAD
	name = "Chemist equipment"
=======
	name = JOB_CHEMIST + " equipment"
	desc = "Standard equipment for Chemists. Requires Chemistry access."
>>>>>>> bd0bae7b43 ([MIRROR] Supply Pack Details/Descriptions (#9644))
	contains = list(
			/obj/item/weapon/storage/box/beakers,
			/obj/item/device/radio/headset/headset_med,
			/obj/item/weapon/storage/box/autoinjectors,
			/obj/item/clothing/under/rank/chemist,
			/obj/item/clothing/glasses/science,
			/obj/item/clothing/suit/storage/toggle/labcoat/chemist,
			/obj/item/clothing/mask/surgical,
			/obj/item/clothing/shoes/white,
			/obj/item/weapon/cartridge/chemistry,
			/obj/item/clothing/gloves/sterile/latex,
			/obj/item/weapon/reagent_containers/dropper,
			/obj/item/device/healthanalyzer,
			/obj/item/weapon/storage/box/pillbottles,
			/obj/item/weapon/reagent_containers/syringe
			)
	cost = 20
	containertype = /obj/structure/closet/crate/secure/nanomed
	containername = "Chemist equipment"
	access = access_chemistry

/datum/supply_pack/med/paramedicgear
<<<<<<< HEAD
	name = "Paramedic equipment"
=======
	name = JOB_PARAMEDIC + " equipment"
	desc = "Standard equipment for Paramedics and EMTs. Requires Medical Equipment access."
>>>>>>> bd0bae7b43 ([MIRROR] Supply Pack Details/Descriptions (#9644))
	contains = list(
			/obj/item/weapon/storage/belt/medical/emt,
			/obj/item/device/radio/headset/headset_med,
			/obj/item/clothing/under/rank/medical/scrubs/black,
			/obj/item/clothing/accessory/armband/medblue,
			/obj/item/clothing/glasses/hud/health,
			/obj/item/clothing/suit/storage/toggle/labcoat/emt,
			/obj/item/clothing/under/rank/medical/paramedic,
			/obj/item/clothing/suit/storage/toggle/fr_jacket,
			/obj/item/clothing/mask/gas,
			/obj/item/clothing/under/rank/medical/paramedic_alt,
			/obj/item/clothing/accessory/stethoscope,
			/obj/item/weapon/storage/firstaid/adv,
			/obj/item/clothing/shoes/boots/jackboots,
			/obj/item/clothing/gloves/sterile/latex,
			/obj/item/device/healthanalyzer,
			/obj/item/weapon/cartridge/medical,
			/obj/item/device/flashlight/pen,
			/obj/item/weapon/reagent_containers/syringe,
			/obj/item/clothing/accessory/storage/white_vest
			)
	cost = 20
	containertype = /obj/structure/closet/crate/secure/nanomed
	containername = "Paramedic equipment"
	access = access_medical_equip

/datum/supply_pack/med/psychiatristgear
<<<<<<< HEAD
	name = "Psychiatrist equipment"
=======
	name = JOB_PSYCHIATRIST + " equipment"
	desc = "Standard equipment for Psychiatrists. Requires Psychiatry access."
>>>>>>> bd0bae7b43 ([MIRROR] Supply Pack Details/Descriptions (#9644))
	contains = list(
			/obj/item/clothing/under/rank/psych,
			/obj/item/device/radio/headset/headset_med,
			/obj/item/clothing/under/rank/psych/turtleneck,
			/obj/item/clothing/shoes/laceup,
			/obj/item/clothing/suit/storage/toggle/labcoat,
			/obj/item/clothing/shoes/white,
			/obj/item/weapon/clipboard,
			/obj/item/weapon/folder/white,
			/obj/item/weapon/pen,
			/obj/item/weapon/cartridge/medical
			)
	cost = 20
	containertype = /obj/structure/closet/crate/secure/nanomed
	containername = "Psychiatrist equipment"
	access = access_psychiatrist

/datum/supply_pack/med/medicalscrubs
	name = "Medical scrubs"
	desc = "Plenty of extra surgical scrubs. Requires Medical Equipment access."
	contains = list(
			/obj/item/clothing/shoes/white = 3,
			/obj/item/clothing/under/rank/medical/scrubs = 3,
			/obj/item/clothing/under/rank/medical/scrubs/green = 3,
			/obj/item/clothing/under/rank/medical/scrubs/purple = 3,
			/obj/item/clothing/under/rank/medical/scrubs/black = 3,
			/obj/item/clothing/head/surgery = 3,
			/obj/item/clothing/head/surgery/purple = 3,
			/obj/item/clothing/head/surgery/blue = 3,
			/obj/item/clothing/head/surgery/green = 3,
			/obj/item/clothing/head/surgery/black = 3,
			/obj/item/weapon/storage/box/masks,
			/obj/item/weapon/storage/box/gloves
			)
	cost = 10
	containertype = /obj/structure/closet/crate/secure/nanomed
	containername = "Medical scrubs crate"
	access = access_medical_equip

/datum/supply_pack/med/autopsy
	name = "Autopsy equipment"
	desc = "Supplies for conducting thorough autopsies. Requires Morgue access."
	contains = list(
			/obj/item/weapon/folder/white,
			/obj/item/device/camera,
			/obj/item/device/camera_film = 2,
			/obj/item/weapon/autopsy_scanner,
			/obj/item/weapon/surgical/scalpel,
			/obj/item/weapon/storage/box/masks,
			/obj/item/weapon/storage/box/gloves,
			/obj/item/weapon/pen
			)
	cost = 20
	containertype = /obj/structure/closet/crate/secure/veymed
	containername = "Autopsy equipment crate"
	access = access_morgue

/datum/supply_pack/med/medicaluniforms
	name = "Medical uniforms"
	desc = "A set of standard Medical uniforms. Requires Medical Equipment access."
	contains = list(
			/obj/item/clothing/shoes/white = 3,
			/obj/item/clothing/under/rank/chief_medical_officer,
			/obj/item/clothing/under/rank/geneticist,
			/obj/item/clothing/under/rank/virologist,
			/obj/item/clothing/under/rank/nursesuit,
			/obj/item/clothing/under/rank/nurse,
			/obj/item/clothing/under/rank/orderly,
			/obj/item/clothing/under/rank/medical = 3,
			/obj/item/clothing/under/rank/medical/paramedic = 3,
			/obj/item/clothing/suit/storage/toggle/labcoat = 3,
			/obj/item/clothing/suit/storage/toggle/labcoat/cmo,
			/obj/item/clothing/suit/storage/toggle/labcoat/emt,
			/obj/item/clothing/suit/storage/toggle/labcoat/cmoalt,
			/obj/item/clothing/suit/storage/toggle/labcoat/genetics,
			/obj/item/clothing/suit/storage/toggle/labcoat/virologist,
			/obj/item/clothing/suit/storage/toggle/labcoat/chemist,
			/obj/item/weapon/storage/box/masks,
			/obj/item/weapon/storage/box/gloves
			)
	cost = 10
	containertype = /obj/structure/closet/crate/secure/nanomed
	containername = "Medical uniform crate"
	access = access_medical_equip

/datum/supply_pack/med/medicalbiosuits
	name = "Medical biohazard gear"
	desc = "Several sets of Medical Biohazard suits. Requires Medical Equipment access."
	contains = list(
			/obj/item/clothing/head/bio_hood/scientist = 3,
			/obj/item/clothing/suit/bio_suit/scientist = 3,
			/obj/item/clothing/suit/bio_suit/cmo,
			/obj/item/clothing/head/bio_hood/cmo,
<<<<<<< HEAD
			/obj/item/clothing/mask/gas/clear = 5, //ChompEdit: Proper implementation of clear gas masks
			/obj/item/weapon/tank/oxygen = 5,
			/obj/item/weapon/storage/box/masks,
			/obj/item/weapon/storage/box/gloves
=======
			/obj/item/clothing/shoes/white = 4,
			/obj/item/clothing/mask/gas/clear = 4, //ChompEdit: Proper implementation of clear gas masks
			/obj/item/tank/oxygen = 4,
			/obj/item/storage/box/masks,
			/obj/item/storage/box/gloves
>>>>>>> bd0bae7b43 ([MIRROR] Supply Pack Details/Descriptions (#9644))
			)
	cost = 50
	containertype = /obj/structure/closet/crate/secure/nanomed
	containername = "Medical biohazard equipment"
	access = access_medical_equip

/datum/supply_pack/med/portablefreezers
	name = "Portable freezers crate"
<<<<<<< HEAD
	contains = list(/obj/item/weapon/storage/box/freezer = 7)
=======
	desc = "Several portable freezers, for safely transporting organs and other temperature-sensitive objects. Requires Medical Equipment access."
	contains = list(/obj/item/storage/box/freezer = 7)
>>>>>>> bd0bae7b43 ([MIRROR] Supply Pack Details/Descriptions (#9644))
	cost = 25
	containertype = /obj/structure/closet/crate/secure/veymed
	containername = "Portable freezers"
	access = access_medical_equip

/datum/supply_pack/med/virus
<<<<<<< HEAD
	name = "Virus sample crate"
	contains = list(/obj/item/weapon/virusdish/random = 4)
=======
	name = "Virus culture crate"
	desc = "Glass bottles with viral cultures. HANDLE WITH CARE. Requires Chief Medical Officer access."
	contains = list(/obj/item/reagent_containers/glass/bottle/culture/cold = 1, /obj/item/reagent_containers/glass/bottle/culture/flu = 1)
>>>>>>> bd0bae7b43 ([MIRROR] Supply Pack Details/Descriptions (#9644))
	cost = 25
	containertype = /obj/structure/closet/crate/secure/zenghu
	containername = "Virus sample crate"
	access = access_cmo

/datum/supply_pack/med/defib
	name = "Defibrillator crate"
<<<<<<< HEAD
	contains = list(/obj/item/device/defib_kit = 2)
=======
	desc = "A pair of defibrillators."
	contains = list(/obj/item/defib_kit = 2)
>>>>>>> bd0bae7b43 ([MIRROR] Supply Pack Details/Descriptions (#9644))
	cost = 30
	containertype = /obj/structure/closet/crate/veymed
	containername = "Defibrillator crate"

/datum/supply_pack/med/distillery
	name = "Chemical distiller crate"
	desc = "A portable reagent distillery, for advanced chemistry. Standalone model."
	contains = list(/obj/machinery/portable_atmospherics/powered/reagent_distillery = 1)
	cost = 50
	containertype = /obj/structure/closet/crate/large/nanotrasen
	containername = "Chemical distiller crate"

/datum/supply_pack/med/advdistillery
	name = "Industrial Chemical distiller crate"
	desc = "A portable industrial reagent distillery, for advanced chemistry. Requires atmospherics experience and equipment to set up."
	contains = list(/obj/machinery/portable_atmospherics/powered/reagent_distillery/industrial = 1)
	cost = 150
	containertype = /obj/structure/closet/crate/large/xion
	containername = "Industrial Chemical distiller crate"

/datum/supply_pack/med/oxypump
	name = "Oxygen pump crate"
	desc = "A mobile oxygen pump."
	contains = list(/obj/machinery/oxygen_pump/mobile = 1)
	cost = 125
	containertype = /obj/structure/closet/crate/large/xion
	containername = "Oxygen pump crate"

/datum/supply_pack/med/anestheticpump
	name = "Anesthetic pump crate"
	desc = "A mobile anaesthetic pump."
	contains = list(/obj/machinery/oxygen_pump/mobile/anesthetic = 1)
	cost = 130
	containertype = /obj/structure/closet/crate/large/nanotrasen
	containername = "Anesthetic pump crate"

/datum/supply_pack/med/stablepump
	name = "Portable stabilizer crate"
	desc = "A portable stabilizer, for conducting sensitive operations such as heart transplants."
	contains = list(/obj/machinery/oxygen_pump/mobile/stabilizer = 1)
	cost = 175
	containertype = /obj/structure/closet/crate/large/nanotrasen
	containername = "Portable stabilizer crate"

<<<<<<< HEAD
/datum/supply_pack/med/medicalbiosuits
	contains = list(
			/obj/item/clothing/head/bio_hood/scientist = 3,
			/obj/item/clothing/suit/bio_suit/scientist = 3,
			/obj/item/clothing/suit/bio_suit/virology = 3,
			/obj/item/clothing/head/bio_hood/virology = 3,
			/obj/item/clothing/suit/bio_suit/cmo,
			/obj/item/clothing/head/bio_hood/cmo,
			/obj/item/clothing/shoes/white = 7,
			/obj/item/clothing/mask/gas/clear = 7, //ChompEdit: Proper implementation of clear gas masks
			/obj/item/weapon/tank/oxygen = 7,
			/obj/item/weapon/storage/box/masks,
			/obj/item/weapon/storage/box/gloves
			)
	cost = 40

=======
>>>>>>> bd0bae7b43 ([MIRROR] Supply Pack Details/Descriptions (#9644))
/datum/supply_pack/med/virologybiosuits
	name = "Virology biohazard gear"
	desc = "Three virology biohazard suits plus associated equipment. Requires Medical Equipment access."
	contains = list(
			/obj/item/clothing/suit/bio_suit/virology = 3,
			/obj/item/clothing/head/bio_hood/virology = 3,
			/obj/item/clothing/mask/gas/clear = 3, //ChompEdit: Proper implementation of clear gas masks
			/obj/item/weapon/tank/oxygen = 3,
			/obj/item/weapon/storage/box/masks,
			/obj/item/weapon/storage/box/gloves
			)
	cost = 40
	containertype = /obj/structure/closet/crate/secure
	containername = "Virology biohazard equipment"
	access = access_medical_equip

<<<<<<< HEAD
/datum/supply_pack/med/virus
	name = "Virus sample crate"
	contains = list(/obj/item/weapon/virusdish/random = 4)
	cost = 25
	containertype = /obj/structure/closet/crate/secure
	containername = "Virus sample crate"
	access = access_medical_equip


/datum/supply_pack/med/bloodpack
	containertype = /obj/structure/closet/crate/medical/blood

/datum/supply_pack/med/compactdefib
	name = "Compact Defibrillator crate"
	contains = list(/obj/item/device/defib_kit/compact = 1)
=======
/datum/supply_pack/med/compactdefib
	name = "Compact Defibrillator crate"
	desc = "A compact defibrillator. Requires Medical Equipment access."
	contains = list(/obj/item/defib_kit/compact = 1)
>>>>>>> bd0bae7b43 ([MIRROR] Supply Pack Details/Descriptions (#9644))
	cost = 90
	containertype = /obj/structure/closet/crate/secure
	containername = "Compact Defibrillator crate"
	access = access_medical_equip
