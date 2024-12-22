/area/surface/outpost/main/dorms
	name = "\improper Main Outpost Dorms"
	soundproofed = TRUE
	forbid_events = TRUE

/area/surface/outpost/main/dorms/dorm_1
	name = "\improper Main Outpost Dorm One"
	flags = RAD_SHIELDED
	limit_mob_size = FALSE
	block_suit_sensors = TRUE
	block_tracking = TRUE

/area/surface/outpost/main/dorms/dorm_2
	name = "\improper Main Outpost Dorm Two"
	flags = RAD_SHIELDED
	limit_mob_size = FALSE
	block_suit_sensors = TRUE
	block_tracking = TRUE

/area/surface/outpost/main/dorms/dorm_3
	name = "\improper Main Outpost Dorm Three"
	flags = RAD_SHIELDED
	limit_mob_size = FALSE
	block_suit_sensors = TRUE
	block_tracking = TRUE

/area/surface/outpost/main/dorms/dorm_4
	name = "\improper Main Outpost Dorm Four"
	flags = RAD_SHIELDED
	limit_mob_size = FALSE
	block_suit_sensors = TRUE
	block_tracking = TRUE

/area/surface/outpost/main/dorms/dorm_5
	name = "\improper Main Outpost Dorm Five"
	flags = RAD_SHIELDED
	limit_mob_size = FALSE
	block_suit_sensors = TRUE
	block_tracking = TRUE

/area/surface/outpost/main/dorms/dorm_6
	name = "\improper Main Outpost Dorm Six"
	flags = RAD_SHIELDED
	limit_mob_size = FALSE
	block_suit_sensors = TRUE
	block_tracking = TRUE

/area/crew_quarters/cafeteria
	flags = RAD_SHIELDED

/area/crew_quarters/coffee_shop
	flags = RAD_SHIELDED

/area/crew_quarters/kitchen
	flags = RAD_SHIELDED

/area/crew_quarters/bar
	flags = RAD_SHIELDED

/area/crew_quarters/sleep
<<<<<<< HEAD
	soundproofed = TRUE
	forbid_events = TRUE
=======
	flags = RAD_SHIELDED | AREA_SOUNDPROOF | AREA_FORBID_EVENTS | AREA_ALLOW_LARGE_SIZE | AREA_BLOCK_SUIT_SENSORS | AREA_BLOCK_TRACKING | AREA_FORBID_SINGULO
>>>>>>> d35faa5844 ([MIRROR] Adds a new ghost vis blocking area flag (#9636))

/area/crew_quarters/sleep/vistor_room_1
	flags = RAD_SHIELDED
	limit_mob_size = FALSE
	block_suit_sensors = TRUE
	block_tracking = TRUE

/area/crew_quarters/sleep/vistor_room_2
	flags = RAD_SHIELDED
	limit_mob_size = FALSE
	block_suit_sensors = TRUE
	block_tracking = TRUE

/area/crew_quarters/sleep/vistor_room_3
	flags = RAD_SHIELDED
	limit_mob_size = FALSE
	block_suit_sensors = TRUE
	block_tracking = TRUE

/area/crew_quarters/sleep/vistor_room_4
	flags = RAD_SHIELDED
	limit_mob_size = FALSE
	block_suit_sensors = TRUE
	block_tracking = TRUE

/area/crew_quarters/sleep/vistor_room_5
	flags = RAD_SHIELDED
	limit_mob_size = FALSE
	block_suit_sensors = TRUE
	block_tracking = TRUE

/area/crew_quarters/sleep/vistor_room_6
	flags = RAD_SHIELDED
	limit_mob_size = FALSE
	block_suit_sensors = TRUE
	block_tracking = TRUE

/area/crew_quarters/sleep/vistor_room_7
	flags = RAD_SHIELDED
	limit_mob_size = FALSE
	block_suit_sensors = TRUE
	block_tracking = TRUE

/area/crew_quarters/sleep/vistor_room_8
	flags = RAD_SHIELDED
	limit_mob_size = FALSE
	block_suit_sensors = TRUE
	block_tracking = TRUE

/area/crew_quarters/sleep/vistor_room_9
	flags = RAD_SHIELDED
	limit_mob_size = FALSE
	block_suit_sensors = TRUE
	block_tracking = TRUE

/area/crew_quarters/sleep/vistor_room_10
	flags = RAD_SHIELDED
	limit_mob_size = FALSE
	block_suit_sensors = TRUE
	block_tracking = TRUE

/area/crew_quarters/sleep/vistor_room_11
	flags = RAD_SHIELDED
	limit_mob_size = FALSE
	block_suit_sensors = TRUE
	block_tracking = TRUE

/area/crew_quarters/sleep/vistor_room_12
	flags = RAD_SHIELDED
	limit_mob_size = FALSE
	block_suit_sensors = TRUE
	block_tracking = TRUE

/area/medical/cryo/autoresleeve
	name = "\improper Medical Autoresleeving"
	forbid_events = TRUE

/area/rnd/research/particleaccelerator
	name = "\improper Particle Accelerator Lab"
	icon_state = "toxlab"

/area/shadekin
	name = "\improper Shadekin Retreat"
	icon_state = "blue"
	requires_power = 0
	limit_dark_respite = TRUE
	limit_mob_size = FALSE
	ambience = AMBIENCE_OTHERWORLDLY
	flags = RAD_SHIELDED | AREA_FLAG_IS_NOT_PERSISTENT | BLUE_SHIELDED

/area/security/nuke_storage
	flags = PHASE_SHIELDED

/area/quartermaster/disposal_sort
	name = "\improper Cargo - Disposals Sorting"
	icon_state = "quart"
	flags = AREA_FLAG_IS_NOT_PERSISTENT

/area/maintenance/field
	name = "Maintenance Deck Field"

/area/security/armoury
	flags = PHASE_SHIELDED

/area/centcom/living
	flags = AREA_FLAG_IS_NOT_PERSISTENT | AREA_SOUNDPROOF | AREA_ALLOW_LARGE_SIZE | AREA_BLOCK_GHOSTS | AREA_BLOCK_TRACKING | AREA_BLOCK_SUIT_SENSORS | AREA_BLOCK_PHASE_SHIFT | AREA_BLOCK_GHOST_SIGHT

/area/centcom/specops
	flags = AREA_FLAG_IS_NOT_PERSISTENT | AREA_BLOCK_GHOSTS | AREA_BLOCK_TRACKING | AREA_BLOCK_SUIT_SENSORS | AREA_BLOCK_PHASE_SHIFT | AREA_BLOCK_GHOST_SIGHT

/area/centcom/command
	flags = AREA_FLAG_IS_NOT_PERSISTENT | AREA_BLOCK_GHOSTS | AREA_BLOCK_TRACKING | AREA_BLOCK_SUIT_SENSORS | AREA_BLOCK_PHASE_SHIFT | AREA_BLOCK_GHOST_SIGHT

/area/centcom/creed
	flags = AREA_FLAG_IS_NOT_PERSISTENT | AREA_BLOCK_GHOSTS | AREA_BLOCK_TRACKING | AREA_BLOCK_SUIT_SENSORS | AREA_BLOCK_PHASE_SHIFT | AREA_BLOCK_GHOST_SIGHT

/area/shuttle/response_ship
	flags = AREA_FLAG_IS_NOT_PERSISTENT | AREA_BLOCK_GHOSTS | AREA_BLOCK_TRACKING | AREA_BLOCK_SUIT_SENSORS | AREA_BLOCK_PHASE_SHIFT | AREA_BLOCK_GHOST_SIGHT

/area/shuttle/administration
	flags = AREA_FLAG_IS_NOT_PERSISTENT | AREA_BLOCK_GHOSTS | AREA_BLOCK_TRACKING | AREA_BLOCK_SUIT_SENSORS | AREA_BLOCK_PHASE_SHIFT | AREA_BLOCK_GHOST_SIGHT

/area/shuttle/transport1/centcom
	flags = AREA_FLAG_IS_NOT_PERSISTENT | AREA_BLOCK_GHOSTS | AREA_BLOCK_TRACKING | AREA_BLOCK_SUIT_SENSORS | AREA_BLOCK_PHASE_SHIFT | AREA_BLOCK_GHOST_SIGHT

/area/shuttle/syndicate
	flags = AREA_FLAG_IS_NOT_PERSISTENT | AREA_BLOCK_GHOSTS | AREA_BLOCK_TRACKING | AREA_BLOCK_SUIT_SENSORS | AREA_BLOCK_PHASE_SHIFT | AREA_BLOCK_GHOST_SIGHT

/area/syndicate_station
	flags = AREA_FLAG_IS_NOT_PERSISTENT | AREA_BLOCK_GHOSTS | AREA_BLOCK_TRACKING | AREA_BLOCK_SUIT_SENSORS | AREA_BLOCK_PHASE_SHIFT | AREA_BLOCK_GHOST_SIGHT

/area/syndicate_mothership/elite_squad
	flags = AREA_FLAG_IS_NOT_PERSISTENT | AREA_BLOCK_GHOSTS | AREA_BLOCK_TRACKING | AREA_BLOCK_SUIT_SENSORS | AREA_BLOCK_PHASE_SHIFT | AREA_BLOCK_GHOST_SIGHT

/area/shuttle/syndicate_elite/mothership
	flags = AREA_FLAG_IS_NOT_PERSISTENT | AREA_BLOCK_GHOSTS | AREA_BLOCK_TRACKING | AREA_BLOCK_SUIT_SENSORS | AREA_BLOCK_PHASE_SHIFT | AREA_BLOCK_GHOST_SIGHT

/area/shuttle/skipjack
	flags = AREA_FLAG_IS_NOT_PERSISTENT | AREA_BLOCK_GHOSTS | AREA_BLOCK_TRACKING | AREA_BLOCK_SUIT_SENSORS | AREA_BLOCK_PHASE_SHIFT | AREA_BLOCK_GHOST_SIGHT

/area/skipjack_station
	flags = AREA_FLAG_IS_NOT_PERSISTENT | AREA_BLOCK_GHOSTS | AREA_BLOCK_TRACKING | AREA_BLOCK_SUIT_SENSORS | AREA_BLOCK_PHASE_SHIFT | AREA_BLOCK_GHOST_SIGHT

/area/ninja_dojo/dojo
	flags = AREA_FLAG_IS_NOT_PERSISTENT | AREA_BLOCK_GHOSTS | AREA_BLOCK_TRACKING | AREA_BLOCK_SUIT_SENSORS | AREA_BLOCK_PHASE_SHIFT | AREA_BLOCK_GHOST_SIGHT

/area/shuttle/ninja
	flags = AREA_FLAG_IS_NOT_PERSISTENT | AREA_BLOCK_GHOSTS | AREA_BLOCK_TRACKING | AREA_BLOCK_SUIT_SENSORS | AREA_BLOCK_PHASE_SHIFT | AREA_BLOCK_GHOST_SIGHT

/area/shuttle/trade
	flags = AREA_FLAG_IS_NOT_PERSISTENT | AREA_BLOCK_GHOSTS | AREA_BLOCK_TRACKING | AREA_BLOCK_SUIT_SENSORS | AREA_BLOCK_PHASE_SHIFT | AREA_BLOCK_GHOST_SIGHT

/area/shuttle/merchant
	flags = AREA_FLAG_IS_NOT_PERSISTENT | AREA_BLOCK_GHOSTS | AREA_BLOCK_TRACKING | AREA_BLOCK_SUIT_SENSORS | AREA_BLOCK_PHASE_SHIFT | AREA_BLOCK_GHOST_SIGHT

/area/wizard_station
	flags = AREA_FLAG_IS_NOT_PERSISTENT | AREA_BLOCK_GHOSTS | AREA_BLOCK_TRACKING | AREA_BLOCK_SUIT_SENSORS | AREA_BLOCK_PHASE_SHIFT | AREA_BLOCK_GHOST_SIGHT

/area/crew_quarters/heads/sc
	flags = RAD_SHIELDED | AREA_FORBID_EVENTS | AREA_FORBID_SINGULO

/area/crew_quarters/heads/sc/hop/quarters
	flags = RAD_SHIELDED | AREA_FORBID_EVENTS | AREA_FORBID_SINGULO | AREA_BLOCK_TRACKING | AREA_BLOCK_SUIT_SENSORS

/area/crew_quarters/heads/sc/hor/quarters
	flags = RAD_SHIELDED | AREA_FORBID_EVENTS | AREA_FORBID_SINGULO | AREA_BLOCK_TRACKING | AREA_BLOCK_SUIT_SENSORS

/area/crew_quarters/heads/sc/chief/quarters
	flags = RAD_SHIELDED | AREA_FORBID_EVENTS | AREA_FORBID_SINGULO | AREA_BLOCK_TRACKING | AREA_BLOCK_SUIT_SENSORS

/area/crew_quarters/heads/sc/hos/quarters
	flags = RAD_SHIELDED | AREA_FORBID_EVENTS | AREA_FORBID_SINGULO | AREA_BLOCK_TRACKING | AREA_BLOCK_SUIT_SENSORS

/area/crew_quarters/heads/sc/cmo/quarters
	flags = RAD_SHIELDED | AREA_FORBID_EVENTS | AREA_FORBID_SINGULO | AREA_BLOCK_TRACKING | AREA_BLOCK_SUIT_SENSORS

/area/crew_quarters/heads/sc/restroom
	flags = RAD_SHIELDED | AREA_FORBID_EVENTS | AREA_FORBID_SINGULO | AREA_BLOCK_TRACKING | AREA_BLOCK_SUIT_SENSORS

/area/crew_quarters/heads/sc/bs
	flags = RAD_SHIELDED | AREA_FORBID_EVENTS | AREA_FORBID_SINGULO | AREA_BLOCK_TRACKING | AREA_BLOCK_SUIT_SENSORS

/area/crew_quarters/toilet
	flags = RAD_SHIELDED | AREA_FORBID_EVENTS | AREA_FORBID_SINGULO | AREA_BLOCK_TRACKING | AREA_BLOCK_SUIT_SENSORS

/area/crew_quarters/barrestroom
	flags = RAD_SHIELDED | AREA_FORBID_EVENTS | AREA_FORBID_SINGULO | AREA_BLOCK_TRACKING | AREA_BLOCK_SUIT_SENSORS

/area/engineering/engi_restroom
	flags = RAD_SHIELDED | AREA_FORBID_EVENTS | AREA_FORBID_SINGULO | AREA_BLOCK_TRACKING | AREA_BLOCK_SUIT_SENSORS

/area/security/security_restroom
	flags = RAD_SHIELDED | AREA_FORBID_EVENTS | AREA_FORBID_SINGULO | AREA_BLOCK_TRACKING | AREA_BLOCK_SUIT_SENSORS

/area/medical/medical_restroom
	flags = RAD_SHIELDED | AREA_FORBID_EVENTS | AREA_FORBID_SINGULO | AREA_BLOCK_TRACKING | AREA_BLOCK_SUIT_SENSORS

/area/rnd/research_restroom_sc
	flags = RAD_SHIELDED | AREA_FORBID_EVENTS | AREA_FORBID_SINGULO | AREA_BLOCK_TRACKING | AREA_BLOCK_SUIT_SENSORS

/area/crew_quarters/toilet/firstdeck
	flags = RAD_SHIELDED | AREA_FORBID_EVENTS | AREA_FORBID_SINGULO | AREA_BLOCK_TRACKING | AREA_BLOCK_SUIT_SENSORS
