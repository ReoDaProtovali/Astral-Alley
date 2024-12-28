/mob/living/carbon/human/verb/hide_headset()
	set name = "Show/Hide Headset"
	set category = "IC.Settings"
	set desc = "Toggle headset worn icon visibility."
	hide_headset = !hide_headset
	update_inv_ears()

/mob/living/carbon/human/verb/hide_glasses()
	set name = "Show/Hide Glasses"
	set category = "IC.Settings"
	set desc = "Toggle glasses worn icon visibility."
	hide_glasses = !hide_glasses
	update_inv_glasses()

/mob/living/carbon/human/verb/flip_lying()
	set name = "Flip Resting Direction"
	set category = "Abilities.General"
	set desc = "Switch your horizontal direction while prone."
	if(isnull(rest_dir))
		rest_dir = FALSE
	rest_dir = !rest_dir
	update_transform(TRUE)

/mob/living/carbon/human/proc/synth_reag_toggle()
	set name = "Toggle Reagent Processing"
	set category = "Abilities.Vore"
	set desc = "Toggle reagent processing as synth."
	synth_reag_processing = !synth_reag_processing

//Formally used from a paper, gave this to everyone.
/mob/living/carbon/human/verb/create_area()
    set name = "Create Area"
    set desc = "Create an area in a enclosed space, making it able to be powered by an APC."
    set category = "IC.Game"

    if(stat || world.time < last_special)
        to_chat(usr, "<span class='warning'>You recently tried to create an area. Wait a while before using it again.</span>")
        return

    last_special = world.time + 2 SECONDS // Antispam.
    create_new_area(usr)
    return

/mob/living/carbon/human/update_misc_tabs()
	..()
	if(species)
		species.update_misc_tabs(src)

	if(istype(back,/obj/item/weapon/rig))
		var/obj/item/weapon/rig/R = back
		RigPanel(R)

	else if(istype(belt,/obj/item/weapon/rig))
		var/obj/item/weapon/rig/R = belt
		RigPanel(R)

/mob/proc/RigPanel(var/obj/item/weapon/rig/R)
	if(R && !R.canremove && R.installed_modules.len)
		var/list/L = list()
		var/cell_status = R.cell ? "[R.cell.charge]/[R.cell.maxcharge]" : "ERROR"
		L[++L.len] = list("Suit charge: [cell_status]", null, null, null, null)
		for(var/obj/item/rig_module/module in R.installed_modules)
		{
			for(var/stat_rig_module/SRM in module.stat_modules)
				if(SRM.CanUse())
					L[++L.len] = list(SRM.module.interface_name,null,null,SRM.name,REF(SRM))
		}
		misc_tabs["Hardsuit Modules"] = L

/mob/living/update_misc_tabs()
	..()
	if(get_rig_stats)
		var/obj/item/weapon/rig/rig = get_rig()
		if(rig)
			RigPanel(rig)
