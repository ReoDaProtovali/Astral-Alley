// This is a defines file for card sprite stacks. If a new card set comes in, this file can just be disabled and a new one made to match the new sprites.
// Generally, if the icon file is card_xxx.dmi, this filename should be sprite_stacks_xxx.dm
// Please make sure that only the relevant sprite_stacks_xxx.file is included, if more are made.

/obj/item/card
	icon = 'icons/obj/card_new_vr.dmi' // These are redefined here so that changing sprites is as easy as clicking the checkbox.
	base_icon = 'icons/obj/card_new_vr.dmi'

	// New sprite stacks can be defined here. You could theoretically change icon-states as well but right now this file compiles before station_ids.dm so those wouldn't be affected.

//IDs

/obj/item/card/id
	initial_sprite_stack = list("base-stamp", "top-generic", "stamp-n")

/obj/item/card/id/generic
	name = "Generic ID"
	initial_sprite_stack = list("base-stamp", "top-generic", "stamp-silhouette", "clip")

//Central

/obj/item/card/id/centcom
	name = "Central Command ID"
	initial_sprite_stack = list("base-stamp-gold", "top-blue", "stamp-n", "pips-white", "stripe-gold")

/obj/item/card/id/centcom/vip
	name = "VIP ID"
	initial_sprite_stack = list("base-stamp-gold", "top-blue", "stamp-n", "pips-gold", "stripe-gold")

//ERT

/obj/item/card/id/centcom/ERT
	name = "Emergency Responder ID"
	initial_sprite_stack = list("base-stamp-silver", "top-blue", "stamp-n", "pips-red", "stripe-red")

/obj/item/card/id/centcom/ERT/medic
	name = "Emergency Medical Responder ID"
	initial_sprite_stack = list("base-stamp-silver", "top-blue", "stamp-n", "pips-medblu", "stripe-medblu")

/obj/item/card/id/centcom/ERT/commander
	name = "Emergency Response Commander ID"
	initial_sprite_stack = list("base-stamp-silver", "top-blue", "stamp-n", "pips-gold", "stripe-gold")

/obj/item/card/id/centcom/ERT/engineer
	name = "Emergency Engineering Responder ID"
	initial_sprite_stack = list("base-stamp-silver", "top-blue", "stamp-n", "pips-orange", "stripe-orange")

/obj/item/card/id/centcom/ERT/janitor
	name = "Emergency Cleanup Responder ID"
	initial_sprite_stack = list("base-stamp-silver", "top-blue", "stamp-n", "pips-purple", "stripe-purple")

//Silver

/obj/item/card/id/silver
	name = "Silver ID"
	initial_sprite_stack = list("base-stamp-silver", "top-blue", "stamp-n")

/obj/item/card/id/silver/secretary
	name = "Secretary's ID"
	initial_sprite_stack = list("base-stamp", "top-blue", "stamp-n")

<<<<<<< HEAD
/obj/item/weapon/card/id/silver/hop
	name = "Head of Personnel ID"
=======
/obj/item/card/id/silver/hop
	name = JOB_HEAD_OF_PERSONNEL + " ID"
>>>>>>> 5ea698a0ef ([MIRROR] Removes /obj/item/weapon and /obj/item/device [MDB IGNORE] (#9084))
	initial_sprite_stack = list("base-stamp-silver", "top-blue", "stamp-n", "pips-gold")

//Gold

/obj/item/card/id/gold
	name = "Gold ID"
	initial_sprite_stack = list("base-stamp-gold", "top-blue", "stamp-n")

/obj/item/card/id/gold/captain
	name = "Captain's ID"
	initial_sprite_stack = list("base-stamp-gold", "top-blue", "stamp-n", "pips-gold")

/obj/item/card/id/gold/captain/spare
	name = "Spare ID"
	initial_sprite_stack = list("base-stamp-gold", "top-gold", "stamp-n")

//Medical

/obj/item/card/id/medical
	name = "Medical ID"
	initial_sprite_stack = list("base-stamp", "top-medblu", "stamp-n")

<<<<<<< HEAD
/obj/item/weapon/card/id/medical/chemist
	name = "Chemist's ID"
=======
/obj/item/card/id/medical/chemist
	name = JOB_CHEMIST + "'s ID"
>>>>>>> 5ea698a0ef ([MIRROR] Removes /obj/item/weapon and /obj/item/device [MDB IGNORE] (#9084))
	initial_sprite_stack = list("base-stamp", "top-medblu", "stamp-n", "stripe-orange")

<<<<<<< HEAD
/obj/item/weapon/card/id/medical/geneticist
	name = "Geneticist's ID"
=======
/obj/item/card/id/medical/geneticist
	name = JOB_GENETICIST + "'s ID"
>>>>>>> 5ea698a0ef ([MIRROR] Removes /obj/item/weapon and /obj/item/device [MDB IGNORE] (#9084))
	initial_sprite_stack = list("base-stamp", "top-medblu", "stamp-n", "stripe-purple")

<<<<<<< HEAD
/obj/item/weapon/card/id/medical/psych
	name = "Psychologist's ID"
=======
/obj/item/card/id/medical/psych
	name = JOB_ALT_PSYCHOLOGIST + "'s ID"
>>>>>>> 5ea698a0ef ([MIRROR] Removes /obj/item/weapon and /obj/item/device [MDB IGNORE] (#9084))
	initial_sprite_stack = list("base-stamp", "top-medblu", "stamp-n", "stripe-brown")

<<<<<<< HEAD
/obj/item/weapon/card/id/medical/virologist
	name = "Virologist's ID"
=======
/obj/item/card/id/medical/virologist
	name = JOB_ALT_VIROLOGIST + "'s ID"
>>>>>>> 5ea698a0ef ([MIRROR] Removes /obj/item/weapon and /obj/item/device [MDB IGNORE] (#9084))
	initial_sprite_stack = list("base-stamp", "top-medblu", "stamp-n", "stripe-green")

<<<<<<< HEAD
/obj/item/weapon/card/id/medical/emt
	name = "Emergency Medical Technician's ID"
=======
/obj/item/card/id/medical/emt
	name = JOB_ALT_EMERGENCY_MEDICAL_TECHNICIAN + "'s ID"
>>>>>>> 5ea698a0ef ([MIRROR] Removes /obj/item/weapon and /obj/item/device [MDB IGNORE] (#9084))
	initial_sprite_stack = list("base-stamp", "top-medblu", "stamp-n", "stripe-blue")

<<<<<<< HEAD
/obj/item/weapon/card/id/medical/head
	name = "Chief Medical Officer's ID"
=======
/obj/item/card/id/medical/head
	name = JOB_CHIEF_MEDICAL_OFFICER + "'s ID"
>>>>>>> 5ea698a0ef ([MIRROR] Removes /obj/item/weapon and /obj/item/device [MDB IGNORE] (#9084))
	initial_sprite_stack = list("base-stamp-silver", "top-medblu", "stamp-n", "pips-gold")

//Security

/obj/item/card/id/security
	name = "Security ID"
	initial_sprite_stack = list("base-stamp", "top-red", "stamp-n")

<<<<<<< HEAD
/obj/item/weapon/card/id/security/detective
	name = "Detective's ID"
=======
/obj/item/card/id/security/detective
	name = JOB_DETECTIVE + "'s ID"
>>>>>>> 5ea698a0ef ([MIRROR] Removes /obj/item/weapon and /obj/item/device [MDB IGNORE] (#9084))
	initial_sprite_stack = list("base-stamp", "top-red", "stamp-n", "stripe-brown")

<<<<<<< HEAD
/obj/item/weapon/card/id/security/warden
	name = "Warden's ID"
=======
/obj/item/card/id/security/warden
	name = JOB_WARDEN + "'s ID"
>>>>>>> 5ea698a0ef ([MIRROR] Removes /obj/item/weapon and /obj/item/device [MDB IGNORE] (#9084))
	initial_sprite_stack = list("base-stamp", "top-red", "stamp-n", "stripe-white")

<<<<<<< HEAD
/obj/item/weapon/card/id/security/head
	name = "Head of Security's ID"
=======
/obj/item/card/id/security/head
	name = JOB_HEAD_OF_SECURITY + "'s ID"
>>>>>>> 5ea698a0ef ([MIRROR] Removes /obj/item/weapon and /obj/item/device [MDB IGNORE] (#9084))
	initial_sprite_stack = list("base-stamp-silver", "top-red", "stamp-n", "pips-gold")

//Engineering

/obj/item/card/id/engineering
	name = "Engineering ID"
	initial_sprite_stack = list("base-stamp", "top-orange", "stamp-n")

/obj/item/card/id/engineering/atmos
	name = "Atmospherics ID"
	initial_sprite_stack = list("base-stamp", "top-orange", "stripe-medblu", "stamp-n")

<<<<<<< HEAD
/obj/item/weapon/card/id/engineering/head
	name = "Chief Engineer's ID"
=======
/obj/item/card/id/engineering/head
	name = JOB_CHIEF_ENGINEER + "'s ID"
>>>>>>> 5ea698a0ef ([MIRROR] Removes /obj/item/weapon and /obj/item/device [MDB IGNORE] (#9084))
	initial_sprite_stack = list("base-stamp-silver", "top-orange", "stamp-n", "pips-gold")

//Science

/obj/item/card/id/science
	name = "Science ID"
	initial_sprite_stack = list("base-stamp", "top-purple", "stamp-n")

<<<<<<< HEAD
/obj/item/weapon/card/id/science/roboticist
	name = "Roboticist's ID"
=======
/obj/item/card/id/science/roboticist
	name = JOB_ROBOTICIST + "'s ID"
>>>>>>> 5ea698a0ef ([MIRROR] Removes /obj/item/weapon and /obj/item/device [MDB IGNORE] (#9084))
	initial_sprite_stack = list("base-stamp", "top-purple", "stamp-n", "stripe-brown")

<<<<<<< HEAD
/obj/item/weapon/card/id/science/xenobiologist
	name = "Xenobiologist's ID"
=======
/obj/item/card/id/science/xenobiologist
	name = JOB_XENOBIOLOGIST + "'s ID"
>>>>>>> 5ea698a0ef ([MIRROR] Removes /obj/item/weapon and /obj/item/device [MDB IGNORE] (#9084))
	initial_sprite_stack = list("base-stamp", "top-purple", "stamp-n", "stripe-orange")

<<<<<<< HEAD
/obj/item/weapon/card/id/science/xenobotanist
	name = "Xenobotanist's ID"
=======
/obj/item/card/id/science/xenobotanist
	name = JOB_XENOBOTANIST + "'s ID"
>>>>>>> 5ea698a0ef ([MIRROR] Removes /obj/item/weapon and /obj/item/device [MDB IGNORE] (#9084))
	initial_sprite_stack = list("base-stamp", "top-purple", "stamp-n", "stripe-green")

<<<<<<< HEAD
/obj/item/weapon/card/id/science/head
	name = "Research Director's ID"
=======
/obj/item/card/id/science/head
	name = JOB_RESEARCH_DIRECTOR + "'s ID"
>>>>>>> 5ea698a0ef ([MIRROR] Removes /obj/item/weapon and /obj/item/device [MDB IGNORE] (#9084))
	initial_sprite_stack = list("base-stamp-silver", "top-purple", "stamp-n", "pips-gold")

//Cargo

/obj/item/card/id/cargo
	name = "Cargo ID"
	initial_sprite_stack = list("base-stamp", "top-brown", "stamp-n")

/obj/item/card/id/cargo/miner
	name = "Miner's ID"
	initial_sprite_stack = list("base-stamp", "top-brown", "stamp-n", "stripe-purple")

<<<<<<< HEAD
/obj/item/weapon/card/id/cargo/head
	name = "Quartermaster's ID"
=======
/obj/item/card/id/cargo/head
	name = JOB_QUARTERMASTER + "'s ID"
>>>>>>> 5ea698a0ef ([MIRROR] Removes /obj/item/weapon and /obj/item/device [MDB IGNORE] (#9084))
	initial_sprite_stack = list("base-stamp-silver", "top-brown", "stamp-n", "pips-white")

//Civilian

/obj/item/card/id/civilian
	name = "Civilian ID"
	initial_sprite_stack = list("base-stamp", "top-generic", "stamp-n")

<<<<<<< HEAD
/obj/item/weapon/card/id/civilian/chaplain
	name = "Chaplain's ID"
=======
/obj/item/card/id/civilian/chaplain
	name = JOB_CHAPLAIN + "'s ID"
>>>>>>> 5ea698a0ef ([MIRROR] Removes /obj/item/weapon and /obj/item/device [MDB IGNORE] (#9084))
	initial_sprite_stack = list("base-stamp-dark", "top-dark", "stamp-cross", "stripe-white")

<<<<<<< HEAD
/obj/item/weapon/card/id/civilian/journalist
	name = "Journalist's ID"
=======
/obj/item/card/id/civilian/journalist
	name = JOB_ALT_JOURNALIST + "'s ID"
>>>>>>> 5ea698a0ef ([MIRROR] Removes /obj/item/weapon and /obj/item/device [MDB IGNORE] (#9084))
	initial_sprite_stack = list("base-stamp", "top-generic", "stamp-n", "stripe-red")

<<<<<<< HEAD
/obj/item/weapon/card/id/civilian/pilot
	name = "Pilot's ID"
=======
/obj/item/card/id/civilian/pilot
	name = JOB_PILOT + "'s ID"
>>>>>>> 5ea698a0ef ([MIRROR] Removes /obj/item/weapon and /obj/item/device [MDB IGNORE] (#9084))
	initial_sprite_stack = list("base-stamp", "top-generic", "stamp-n", "stripe-olive")

<<<<<<< HEAD
/obj/item/weapon/card/id/civilian/entertainer
	name = "Entertainer's ID"
=======
/obj/item/card/id/civilian/entertainer
	name = JOB_ENTERTAINER + "'s ID"
>>>>>>> 5ea698a0ef ([MIRROR] Removes /obj/item/weapon and /obj/item/device [MDB IGNORE] (#9084))
	initial_sprite_stack = list("base-stamp", "top-generic", "stamp-n", "stripe-brown")

<<<<<<< HEAD
/obj/item/weapon/card/id/civilian/entrepreneur
	name = "Entrepreneur's ID"
=======
/obj/item/card/id/civilian/entrepreneur
	name = JOB_ENTREPRENEUR + "'s ID"
>>>>>>> 5ea698a0ef ([MIRROR] Removes /obj/item/weapon and /obj/item/device [MDB IGNORE] (#9084))
	initial_sprite_stack = list("base-stamp", "top-generic", "stamp-n", "stripe-gold")

<<<<<<< HEAD
/obj/item/weapon/card/id/civilian/clown
	name = "Clown's ID"
=======
/obj/item/card/id/civilian/clown
	name = JOB_CLOWN + "'s ID"
>>>>>>> 5ea698a0ef ([MIRROR] Removes /obj/item/weapon and /obj/item/device [MDB IGNORE] (#9084))
	initial_sprite_stack = list("base-stamp", "top-rainbow", "stamp-n")

<<<<<<< HEAD
/obj/item/weapon/card/id/civilian/mime
	name = "Mime's ID"
=======
/obj/item/card/id/civilian/mime
	name = JOB_MIME + "'s ID"
>>>>>>> 5ea698a0ef ([MIRROR] Removes /obj/item/weapon and /obj/item/device [MDB IGNORE] (#9084))
	initial_sprite_stack = list("base-stamp", "top-white", "stamp-n", "stripe-black")

/obj/item/card/id/civilian/internal_affairs
	name = "Internal Affairs ID"
	initial_sprite_stack = list("base-stamp", "top-blue", "stamp-n", "stripe-black")

//Service

/obj/item/card/id/civilian/service
	name = "Service ID"
	initial_sprite_stack = list("base-stamp", "top-green", "stamp-n")

<<<<<<< HEAD
/obj/item/weapon/card/id/civilian/service/botanist
	name = "Botanist's ID"
=======
/obj/item/card/id/civilian/service/botanist
	name = JOB_BOTANIST + "'s ID"
>>>>>>> 5ea698a0ef ([MIRROR] Removes /obj/item/weapon and /obj/item/device [MDB IGNORE] (#9084))
	initial_sprite_stack = list("base-stamp", "top-green", "stamp-n", "stripe-darkgreen")

<<<<<<< HEAD
/obj/item/weapon/card/id/civilian/service/bartender
	name = "Bartender's ID"
=======
/obj/item/card/id/civilian/service/bartender
	name = JOB_BARTENDER + "'s ID"
>>>>>>> 5ea698a0ef ([MIRROR] Removes /obj/item/weapon and /obj/item/device [MDB IGNORE] (#9084))
	initial_sprite_stack = list("base-stamp", "top-green", "stamp-n", "stripe-black")

<<<<<<< HEAD
/obj/item/weapon/card/id/civilian/service/chef
	name = "Chef's ID"
=======
/obj/item/card/id/civilian/service/chef
	name = JOB_CHEF + "'s ID"
>>>>>>> 5ea698a0ef ([MIRROR] Removes /obj/item/weapon and /obj/item/device [MDB IGNORE] (#9084))
	initial_sprite_stack = list("base-stamp", "top-green", "stamp-n", "stripe-white")

<<<<<<< HEAD
/obj/item/weapon/card/id/civilian/service/janitor
	name = "Janitor's ID"
=======
/obj/item/card/id/civilian/service/janitor
	name = JOB_JANITOR + "'s ID"
>>>>>>> 5ea698a0ef ([MIRROR] Removes /obj/item/weapon and /obj/item/device [MDB IGNORE] (#9084))
	initial_sprite_stack = list("base-stamp", "top-green", "stamp-n", "stripe-purple")

//Exploration

/obj/item/card/id/exploration
	name = "Exploration ID"
	initial_sprite_stack = list("base-stamp", "top-olive", "stamp-n")

<<<<<<< HEAD
/obj/item/weapon/card/id/exploration/fm
	name = "Field Medic's ID"
=======
/obj/item/card/id/exploration/fm
	name = JOB_FIELD_MEDIC + "'s ID"
>>>>>>> 5ea698a0ef ([MIRROR] Removes /obj/item/weapon and /obj/item/device [MDB IGNORE] (#9084))
	initial_sprite_stack = list("base-stamp", "top-olive", "stamp-n", "stripe-medblu")

<<<<<<< HEAD
/obj/item/weapon/card/id/exploration/head
	name = "Pathfinder's ID"
=======
/obj/item/card/id/exploration/head
	name = JOB_PATHFINDER + "'s ID"
>>>>>>> 5ea698a0ef ([MIRROR] Removes /obj/item/weapon and /obj/item/device [MDB IGNORE] (#9084))
	initial_sprite_stack = list("base-stamp-silver", "top-olive", "stamp-n", "pips-white")

//Talon

/obj/item/card/id/talon
	name = "Talon ID"
	initial_sprite_stack = list("base-stamp-dark", "top-dark", "stamp-silhouette")

/obj/item/card/id/talon/doctor
	name = "Talon Medical ID"
	initial_sprite_stack = list("base-stamp-dark", "top-dark", "stamp-silhouette", "pips-medblu", "stripe-medblu")

/obj/item/card/id/talon/engineer
	name = "Talon Engineering ID"
	initial_sprite_stack = list("base-stamp-dark", "top-dark", "stamp-silhouette", "pips-orange", "stripe-orange")

/obj/item/card/id/talon/officer
	name = "Talon Security ID"
	initial_sprite_stack = list("base-stamp-dark", "top-dark", "stamp-silhouette", "pips-red", "stripe-red")

<<<<<<< HEAD
/obj/item/weapon/card/id/talon/pilot
	name = "Talon Pilot ID"
=======
/obj/item/card/id/talon/pilot
	name = JOB_TALON_PILOT + " ID"
>>>>>>> 5ea698a0ef ([MIRROR] Removes /obj/item/weapon and /obj/item/device [MDB IGNORE] (#9084))
	initial_sprite_stack = list("base-stamp-dark", "top-dark", "stamp-silhouette", "pips-purple", "stripe-purple")

/obj/item/card/id/talon/miner
	name = "Talon Mining ID"
	initial_sprite_stack = list("base-stamp-dark", "top-dark", "stamp-silhouette", "pips-brown", "stripe-brown")

<<<<<<< HEAD
/obj/item/weapon/card/id/talon/captain
	name = "Talon Captain ID"
=======
/obj/item/card/id/talon/captain
	name = JOB_TALON_CAPTAIN + " ID"
>>>>>>> 5ea698a0ef ([MIRROR] Removes /obj/item/weapon and /obj/item/device [MDB IGNORE] (#9084))
	initial_sprite_stack = list("base-stamp-dark", "top-dark", "stamp-silhouette", "pips-gold", "stripe-gold")

//Antags

/obj/item/card/id/syndicate
	name = "Syndicate ID"
	initial_sprite_stack = list("base-stamp-dark", "top-syndicate", "stamp-s")

/obj/item/card/id/syndicate/officer
	name = "Syndicate Officer ID"
	initial_sprite_stack = list("base-stamp-dark", "top-syndicate", "stamp-s", "pips-gold", "stripe-gold")
