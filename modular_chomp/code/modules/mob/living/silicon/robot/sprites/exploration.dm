/datum/robot_sprite/dogborg/explorer
	module_type = "Exploration"
	sprite_icon = 'modular_chomp/icons/mob/widerobot_exp_ch.dmi'
	sprite_hud_icon_state = "platform"

/datum/robot_sprite/dogborg/explorer/vale2
	name = "Explorationhound V2"
	sprite_icon_state = "exploration-v2"
	has_eye_light_sprites = TRUE

/datum/robot_sprite/dogborg/explorer/vale
	name = "Explorationhound V2 - Pink"
	sprite_icon_state = "exploration"
	has_eye_light_sprites = TRUE

/datum/robot_sprite/dogborg/tall/explorer/dullahan
	module_type = "Exploration"
	sprite_icon = 'modular_chomp/icons/mob/dullahanborg/dullahan_explorer.dmi'
	pixel_x = 0

/datum/robot_sprite/dogborg/tall/explorer/dullahan/explorer
	name = "Dullahan"
	sprite_icon_state = "dullahanexplo"
	has_eye_light_sprites = TRUE
	has_vore_belly_sprites = TRUE
	rest_sprite_options = list("Default", "Sit")

<<<<<<< HEAD:modular_chomp/code/modules/mob/living/silicon/robot/sprites/exploration.dm
/datum/robot_sprite/dogborg/tall/explorer/dullahan/exploreralt
	name = "Dullahan v2"
	sprite_icon_state = "dullahanexplo_alt"
	has_eye_light_sprites = TRUE
	has_vore_belly_sprites = TRUE
	rest_sprite_options = list("Default", "Sit")
=======
/datum/robot_sprite/dogborg/explorer/smolraptor
	sprite_icon = 'icons/mob/robot/smallraptors/smolraptor_ninja.dmi'
	name = "Small Raptor"
	sprite_icon_state = "smolraptor"
	has_eye_light_sprites = TRUE
	has_vore_belly_sprites = TRUE
	has_dead_sprite_overlay = FALSE
	rest_sprite_options = list("Default", "Sit", "Bellyup")
>>>>>>> 96d877eacd ([MIRROR] Smolraptor updates (#10934)):code/modules/mob/living/silicon/robot/subtypes/exploration/exploration-sprites.dm

/* placeholder
/datum/robot_sprite/dogborg/tall/explorer
	module_type = "Exploration"
	sprite_icon = 'modular_chomp/icons/mob/tallborg/tallrobots.dmi'
	pixel_x = 0

/datum/robot_sprite/dogborg/raptor/explorer
	module_type = "Exploration"
	sprite_icon = 'modular_chomp/icons/mob/raptorborg/raptor_ch.dmi'

/datum/robot_sprite/dogborg/raptor/explorer/raptor
	name = "Raptor"
	sprite_icon_state = "chraptor"
	has_custom_equipment_sprites = TRUE
	rest_sprite_options = list("Default", "Bellyup")

/datum/robot_sprite/dogborg/tall/explorer/meka
	name = "MEKA"
	sprite_icon_state = "mmekaunity"
	has_eye_light_sprites = TRUE
	has_custom_open_sprites = TRUE
	has_vore_belly_sprites = TRUE
	rest_sprite_options = list("Default", "Sit")
*/
