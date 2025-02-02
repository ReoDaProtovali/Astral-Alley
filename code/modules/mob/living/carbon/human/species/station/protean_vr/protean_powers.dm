#define PER_LIMB_STEEL_COST SHEET_MATERIAL_AMOUNT
////
//  One-part Refactor
////
/mob/living/carbon/human/proc/nano_partswap()
	set name = "Ref - Single Limb"
	set desc = "Allows you to replace and reshape your limbs as you see fit."
	set category = "Abilities"
	set hidden = TRUE

	if(stat)
		to_chat(src,"<span class='warning'>You must be awake and standing to perform this action!</span>")
		return

	if(!isturf(loc))
		to_chat(src,"<span class='warning'>You need more space to perform this action!</span>")
		return

	var/obj/item/organ/internal/nano/refactory/refactory = nano_get_refactory()
	//Missing the organ that does this
	if(!istype(refactory))
		to_chat(src,"<span class='warning'>You don't have a working refactory module!</span>")
		return

	var/choice = tgui_input_list(src,"Pick the bodypart to change:", "Refactor - One Bodypart", species.has_limbs)
	if(!choice)
		return

	//Organ is missing, needs restoring
	if(!organs_by_name[choice] || istype(organs_by_name[choice], /obj/item/organ/external/stump)) //allows limb stumps to regenerate like removed limbs.
		if(refactory.get_stored_material(MAT_STEEL) < PER_LIMB_STEEL_COST)
			to_chat(src,"<span class='warning'>You're missing that limb, and need to store at least [PER_LIMB_STEEL_COST] steel to regenerate it.</span>")
			return
		var/regen = tgui_alert(src,"That limb is missing, do you want to regenerate it in exchange for [PER_LIMB_STEEL_COST] steel?","Regenerate limb?",list("Yes","No"))
		if(regen != "Yes")
			return
		if(!refactory.use_stored_material(MAT_STEEL,PER_LIMB_STEEL_COST))
			return
		if(organs_by_name[choice])
			var/obj/item/organ/external/oldlimb = organs_by_name[choice]
			oldlimb.removed()
			qdel(oldlimb)

		var/mob/living/simple_mob/protean_blob/blob = nano_intoblob()
		active_regen = TRUE
		if(do_after(blob,5 SECONDS))
			var/list/limblist = species.has_limbs[choice]
			var/limbpath = limblist["path"]
			var/obj/item/organ/external/new_eo = new limbpath(src)
			organs_by_name[choice] = new_eo
			new_eo.robotize(synthetic ? synthetic.company : null) //Use the base we started with
			new_eo.sync_colour_to_human(src)
			regenerate_icons()
		active_regen = FALSE
		nano_outofblob(blob)
		return

	//Organ exists, let's reshape it
	var/list/usable_manufacturers = list()
	for(var/company in chargen_robolimbs)
		var/datum/robolimb/M = chargen_robolimbs[company]
		if(!(choice in M.parts))
			continue
		if(species?.base_species in M.species_cannot_use)
			continue
		if(M.whitelisted_to && !(ckey in M.whitelisted_to))
			continue
		usable_manufacturers[company] = M
	if(!usable_manufacturers.len)
		return
	var/manu_choice = tgui_input_list(src, "Which manufacturer do you wish to mimic for this limb?", "Manufacturer for [choice]", usable_manufacturers)

	if(!manu_choice)
		return //Changed mind

	var/obj/item/organ/external/eo = organs_by_name[choice]
	if(!eo)
		return //Lost it meanwhile

	eo.robotize(manu_choice)
	visible_message("<B>[src]</B>'s [choice] loses its shape, then reforms.")
	update_icons_body()

////
//  Full Refactor
////
/mob/living/carbon/human/proc/nano_regenerate() //fixed the proc, it used to leave active_regen true.
	set name = "Ref - Whole Body"
	set desc = "Allows you to regrow limbs and replace organs, given you have enough materials."
	set category = "Abilities"
	set hidden = TRUE

	if(stat)
		to_chat(src,"<span class='warning'>You must be awake and standing to perform this action!</span>")
		return

	if(!isturf(loc))
		to_chat(src,"<span class='warning'>You need more space to perform this action!</span>")
		return

	var/obj/item/organ/internal/nano/refactory/refactory = nano_get_refactory()
	//Missing the organ that does this
	if(!istype(refactory))
		to_chat(src,"<span class='warning'>You don't have a working refactory module!</span>")
		return

	//Already regenerating
	if(active_regen)
		to_chat(src, "<span class='warning'>You are already refactoring!</span>")
		return

	var/swap_not_rebuild = tgui_alert(src,"Do you want to rebuild, or reshape?","Rebuild or Reshape",list("Reshape","Cancel","Rebuild"))
	if(!swap_not_rebuild || swap_not_rebuild == "Cancel")
		return
	if(swap_not_rebuild == "Reshape")
		var/list/usable_manufacturers = list()
		for(var/company in chargen_robolimbs)
			var/datum/robolimb/M = chargen_robolimbs[company]
			if(!(BP_TORSO in M.parts))
				continue
			if(species?.base_species in M.species_cannot_use)
				continue
			if(M.whitelisted_to && !(ckey in M.whitelisted_to))
				continue
			usable_manufacturers[company] = M
		if(!usable_manufacturers.len)
			return
		var/manu_choice = tgui_input_list(src, "Which manufacturer do you wish to mimic?", "Manufacturer", usable_manufacturers)

		if(!manu_choice)
			return //Changed mind
		if(!organs_by_name[BP_TORSO])
			return //Ain't got a torso!

		var/obj/item/organ/external/torso = organs_by_name[BP_TORSO]
		to_chat(src, "<span class='danger'>Remain still while the process takes place! It will take 5 seconds.</span>")
		visible_message("<B>[src]</B>'s form collapses into an amorphous blob of black ichor...")

		var/mob/living/simple_mob/protean_blob/blob = nano_intoblob()
		active_regen = TRUE
		if(do_after(blob,5 SECONDS))
			synthetic = usable_manufacturers[manu_choice]
			torso.robotize(manu_choice) //Will cascade to all other organs.
			regenerate_icons()
			visible_message("<B>[src]</B>'s form reshapes into a new one...")
		active_regen = FALSE
		nano_outofblob(blob)
		return

	//Not enough resources (AND spends the resources, should be the last check)
	if(!refactory.use_stored_material(MAT_STEEL,refactory.max_storage))
		to_chat(src, "<span class='warning'>You need to be maxed out on normal metal to do this!</span>")
		return

	var/delay_length = round(active_regen_delay * species.active_regen_mult)
	to_chat(src, "<span class='danger'>Remain still while the process takes place! It will take [delay_length/10] seconds.</span>")
	visible_message("<B>[src]</B>'s form begins to shift and ripple as if made of oil...")
	active_regen = TRUE

	var/mob/living/simple_mob/protean_blob/blob = nano_intoblob()
	if(do_after(blob, delay_length, null, 0))
		if(stat != DEAD && refactory)
			var/list/holder = refactory.materials
			species.create_organs(src)
			var/obj/item/organ/external/torso = organs_by_name[BP_TORSO]
			torso.robotize() //synthetic wasn't defined here.
			LAZYCLEARLIST(blood_DNA)
			LAZYCLEARLIST(feet_blood_DNA)
			blood_color = null
			feet_blood_color = null
			regenerate_icons() //Probably worth it, yeah.
			var/obj/item/organ/internal/nano/refactory/new_refactory = locate() in internal_organs
			if(!new_refactory)
				log_debug("[src] protean-regen'd but lacked a refactory when done.")
			else
				new_refactory.materials = holder
			to_chat(src, "<span class='notice'>Your refactoring is complete.</span>") //Guarantees the message shows no matter how bad the timing.
			to_chat(blob, "<span class='notice'>Your refactoring is complete!</span>")
		else
			to_chat(src,  "<span class='critical'>Your refactoring has failed.</span>")
			to_chat(blob, "<span class='critical'>Your refactoring has failed!</span>")
	else
		to_chat(src,  "<span class='critical'>Your refactoring is interrupted.</span>")
		to_chat(blob, "<span class='critical'>Your refactoring is interrupted!</span>")
	active_regen = FALSE
	nano_outofblob(blob)


////
//  Storing metal
////
/mob/living/carbon/human/proc/nano_metalnom()
	set name = "Ref - Store Metals"
	set desc = "If you're holding a stack of material, you can consume some and store it for later."
	set category = "Abilities"
	set hidden = TRUE

	var/obj/item/organ/internal/nano/refactory/refactory = nano_get_refactory()
	//Missing the organ that does this
	if(!istype(refactory))
		to_chat(src,"<span class='warning'>You don't have a working refactory module!</span>")
		return

	var/held = get_active_hand()
	if(!istype(held,/obj/item/stack/material))
		to_chat(src,"<span class='warning'>You aren't holding a stack of materials in your active hand...!</span>")
		return

	var/obj/item/stack/material/matstack = held
	var/substance = matstack.material.name
	var allowed = FALSE
	for(var/material in PROTEAN_EDIBLE_MATERIALS)
		if(material == substance) allowed = TRUE
	if(!allowed)
		to_chat(src,"<span class='warning'>You can't process [substance]!</span>")
		return //Only a few things matter, the rest are best not cluttering the lists.

	var/howmuch = tgui_input_number(src,"How much do you want to store? (0-[matstack.get_amount()])","Select amount",null,matstack.get_amount(),0)
	if(!howmuch || matstack != get_active_hand() || howmuch > matstack.get_amount())
		return //Quietly fail

	var/actually_added = refactory.add_stored_material(substance,howmuch*matstack.perunit)
	matstack.use(CEILING((actually_added/matstack.perunit), 1))
	if(actually_added && actually_added < howmuch)
		to_chat(src,"<span class='warning'>Your refactory module is now full, so only [actually_added] units were stored.</span>")
		visible_message("<span class='notice'>[src] nibbles some of the [substance] right off the stack!</span>")
	else if(actually_added)
		to_chat(src,"<span class='notice'>You store [actually_added] units of [substance].</span>")
		visible_message("<span class='notice'>[src] devours some of the [substance] right off the stack!</span>")
	else
		to_chat(src,"<span class='notice'>You're completely capped out on [substance]!</span>")

////
//  Blob Form
////
/mob/living/carbon/human/proc/nano_blobform()
	set name = "Toggle Blobform"
	set desc = "Switch between amorphous and humanoid forms."
	set category = "Abilities"
	set hidden = TRUE

	var/atom/movable/to_locate = temporary_form || src
	if(!isturf(to_locate.loc))
		to_chat(to_locate,"<span class='warning'>You need more space to perform this action!</span>")
		return

	//Blob form
	if(temporary_form)
		if(health < maxHealth*0.5)
			to_chat(temporary_form,"<span class='warning'>You need to regenerate more nanites first!</span>")
		else if(temporary_form.stat)
			to_chat(temporary_form,"<span class='warning'>You can only do this while not stunned.</span>")
		else
			nano_outofblob(temporary_form)

	//Human form
	else if(stat)
		to_chat(src,"<span class='warning'>You can only do this while not stunned.</span>")
		return
	else
		nano_intoblob()

////
//  Change fitting
////
/mob/living/carbon/human/proc/nano_change_fitting()
	set name = "Change Species Fit"
	set desc = "Tweak your shape to change what suits you fit into (and their sprites!)."
	set category = "Abilities"

	if(stat)
		to_chat(src,"<span class='warning'>You must be awake and standing to perform this action!</span>")
		return

	var/new_species = tgui_input_list(usr, "Please select a species to emulate.", "Shapeshifter Body", GLOB.playable_species)
	if(new_species)
		species?.base_species = new_species // Really though you better have a species
		regenerate_icons() //Expensive, but we need to recrunch all the icons we're wearing

////
//  Change size
////
/mob/living/carbon/human/proc/nano_set_size()
	set name = "Adjust Volume"
	set category = "Abilities"
	set hidden = TRUE

	var/mob/living/user = temporary_form || src

	var/obj/item/organ/internal/nano/refactory/refactory = nano_get_refactory()
	//Missing the organ that does this
	if(!istype(refactory))
		to_chat(user,"<span class='warning'>You don't have a working refactory module!</span>")
		return

	var/nagmessage = "Adjust your mass to be a size between 25 to 200% (or between 1 to 600% in dorms area). Up-sizing consumes metal, downsizing returns metal."
	var/new_size = tgui_input_number(user, nagmessage, "Pick a Size", user.size_multiplier*100, 600, 1)
	if(!new_size || !size_range_check(new_size))
		return

<<<<<<< HEAD
	var/size_factor = new_size/100

	//Will be: -1.75 for 200->25, and 1.75 for 25->200
	var/sizediff = size_factor - user.size_multiplier

	//Negative if shrinking, positive if growing
	//Will be (PLSC*2)*-1.75 to 1.75
	//For 2000 PLSC that's -7000 to 7000
	var/cost = (PER_LIMB_STEEL_COST*2)*sizediff

	//Sizing up
	if(cost > 0)
		if(refactory.use_stored_material(MAT_STEEL,cost))
			user.resize(size_factor, ignore_prefs = TRUE)
=======
/mob/living/carbon/human/proc/appearance_switch()
	set name = "Switch Blob Appearance"
	set desc = "Allows a protean blob to switch its outwards appearance."
	//set category = "Abilities.Protean"
	set hidden = 1
	var/datum/species/protean/S = src.species
	var/mob/living/protie = src
	if(temporary_form)
		protie = temporary_form
	var/list/icon_choices = list(
			"Primary" = image(icon = 'icons/mob/species/protean/protean.dmi', icon_state = "primary"),
			"Highlight" = image(icon = 'icons/mob/species/protean/protean.dmi', icon_state = "highlight"),
			"puddle1" = image(icon = 'icons/mob/species/protean/protean_powers.dmi', icon_state = "blob"),
			"puddle0" = image(icon = 'icons/mob/species/protean/protean.dmi', icon_state = "puddle"),
			"shadow" = image(icon = 'icons/mob/species/protean/protean.dmi', icon_state = "shadow"),
			"clean" = image(icon = 'icons/mob/species/protean/protean.dmi', icon_state = "clean"),
			"swarm" = image(icon = 'icons/mob/species/protean/protean.dmi', icon_state = "swarm"),
			"slime" = image(icon = 'icons/mob/species/protean/protean.dmi', icon_state = "slime"),
			"chaos" = image(icon = 'icons/mob/species/protean/protean.dmi', icon_state = "chaos"),
			"cloud" = image(icon = 'icons/mob/species/protean/protean.dmi', icon_state = "cloud"),
			 // CHOMPEnable Start
			"catslug" = image(icon = 'icons/mob/species/protean/protean.dmi', icon_state = "catslug"),
			"cat" = image(icon = 'icons/mob/species/protean/protean.dmi', icon_state = "cat"),
			"mouse" = image(icon = 'icons/mob/species/protean/protean.dmi', icon_state = "mouse"),
			"rabbit" = image(icon = 'icons/mob/species/protean/protean.dmi', icon_state = "rabbit"),
			"bear" = image(icon = 'icons/mob/species/protean/protean.dmi', icon_state = "bear"),
			"fen" = image(icon = 'icons/mob/species/protean/protean.dmi', icon_state = "fen"),
			"fox" = image(icon = 'icons/mob/species/protean/protean.dmi', icon_state = "fox"),
			"raptor" = image(icon = 'icons/mob/species/protean/protean.dmi', icon_state = "raptor"),
			"rat" = image(icon = 'icons/mob/species/protean/protean64x32.dmi', icon_state = "rat", pixel_x = -16),
			"lizard" = image(icon = 'icons/mob/species/protean/protean64x32.dmi', icon_state = "lizard", pixel_x = -16),
			"wolf" = image(icon = 'icons/mob/species/protean/protean64x32.dmi', icon_state = "wolf", pixel_x = -16),
			//"drake" = image(icon = 'modular_chomp/icons/mob/species/protean/protean64x64.dmi', icon_state = "drake", pixel_x = -16),
			"teppi" = image(icon = 'icons/mob/species/protean/protean64x64.dmi', icon_state = "teppi", pixel_x = -16),
			"panther" = image(icon = 'icons/mob/species/protean/protean64x64.dmi', icon_state = "panther", pixel_x = -16),
			"robodrgn" = image(icon = 'icons/mob/species/protean/protean128x64.dmi', icon_state = "robodrgn", pixel_x = -48),
			"Dragon" = image(icon = 'icons/mob/bigdragon_small.dmi', icon_state = "dragon_small"),
			"dullahan" = image(icon = 'modular_chomp/icons/mob/dullahanborg/dullahanicon.dmi', icon_state = "proticon")
			//CHOMPEnable End
			)
	var/blobstyle = show_radial_menu(protie, protie, icon_choices, require_near = TRUE, tooltips = FALSE)
	if(!blobstyle || QDELETED(protie) || protie.incapacitated())
		return FALSE
	switch(blobstyle)
		if("Dragon")	//Fuck it, we ball
			var/list/options = list("Underbelly","Body","Ears","Mane","Horns","Eyes")
			for(var/option in options)
				LAZYSET(options, option, image('icons/effects/bigdragon_labels.dmi', option))
			var/choice = show_radial_menu(protie, protie, options, radius = 60)
			if(!choice || QDELETED(protie) || protie.incapacitated())
				return FALSE
			. = TRUE
			var/list/underbelly_styles = list(
				"dragon_underSmooth",
				"dragon_underPlated"
			)
			var/list/body_styles = list(
				"dragon_bodySmooth",
				"dragon_bodyScaled"
			)
			var/list/ear_styles = list(
				"dragon_earsNormal"
			)
			var/list/mane_styles = list(
				"dragon_maneNone",
				"dragon_maneShaggy",
				"dragon_maneDorsalfin"
			)
			var/list/horn_styles = list(
				"dragon_hornsPointy",
				"dragon_hornsCurved",
				"dragon_hornsCurved2",
				"dragon_hornsJagged",
				"dragon_hornsCrown",
				"dragon_hornsSkull"
			)
			var/list/eye_styles = list(
				"dragon_eyesNormal"
			)
			switch(choice)
				if("Underbelly")
					options = underbelly_styles
					for(var/option in options)
						var/image/I = image('icons/mob/vore128x64.dmi', option, dir = 4, pixel_x = -48)
						LAZYSET(options, option, I)
					choice = show_radial_menu(protie, protie, options, radius = 90)
					if(!choice || QDELETED(protie) || protie.incapacitated())
						return 0
					var/new_color = tgui_color_picker(protie, "Pick underbelly color:","Underbelly Color", S.dragon_overlays[1])
					if(!new_color)
						return 0
					S.dragon_overlays[1] = choice
					S.dragon_overlays[S.dragon_overlays[1]] = new_color
				if("Body")
					options = body_styles
					for(var/option in options)
						var/image/I = image('icons/mob/vore128x64.dmi', option, dir = 4, pixel_x = -48)
						LAZYSET(options, option, I)
					choice = show_radial_menu(protie, protie, options, radius = 90)
					if(!choice || QDELETED(protie) || protie.incapacitated())
						return 0
					var/new_color = tgui_color_picker(protie, "Pick body color:","Body Color", S.dragon_overlays[2])
					if(!new_color)
						return 0
					S.dragon_overlays[2] = choice
					S.dragon_overlays[S.dragon_overlays[2]] = new_color
				if("Ears")
					options = ear_styles
					for(var/option in options)
						var/image/I = image('icons/mob/vore128x64.dmi', option, dir = 4, pixel_x = -76, pixel_y = -50)
						LAZYSET(options, option, I)
					choice = show_radial_menu(protie, protie, options, radius = 90)
					if(!choice || QDELETED(protie) || protie.incapacitated())
						return 0
					var/new_color = tgui_color_picker(protie, "Pick ear color:","Ear Color", S.dragon_overlays[3])
					if(!new_color)
						return 0
					S.dragon_overlays[3] = choice
					S.dragon_overlays[S.dragon_overlays[3]] = new_color
				if("Mane")
					options = mane_styles
					for(var/option in options)
						var/image/I = image('icons/mob/vore128x64.dmi', option, dir = 4, pixel_x = -76, pixel_y = -50)
						LAZYSET(options, option, I)
					choice = show_radial_menu(protie, protie, options, radius = 90)
					if(!choice || QDELETED(protie) || protie.incapacitated())
						return 0
					var/new_color = tgui_color_picker(protie, "Pick mane color:","Mane Color", S.dragon_overlays[4])
					if(!new_color)
						return 0
					S.dragon_overlays[4] = choice
					S.dragon_overlays[S.dragon_overlays[4]] = new_color
				if("Horns")
					options = horn_styles
					for(var/option in options)
						var/image/I = image('icons/mob/vore128x64.dmi', option, dir = 4, pixel_x = -86, pixel_y = -50)
						LAZYSET(options, option, I)
					choice = show_radial_menu(protie, protie, options, radius = 90)
					if(!choice || QDELETED(protie) || protie.incapacitated())
						return 0
					var/new_color = tgui_color_picker(protie, "Pick horn color:","Horn Color", S.dragon_overlays[5])
					if(!new_color)
						return 0
					S.dragon_overlays[5] = choice
					S.dragon_overlays[S.dragon_overlays[5]] = new_color
				if("Eyes")
					options = eye_styles
					for(var/option in options)
						var/image/I = image('icons/mob/vore128x64.dmi', option, dir = 2, pixel_x = -48, pixel_y = -50)
						LAZYSET(options, option, I)
					choice = show_radial_menu(protie, protie, options, radius = 90)
					if(!choice || QDELETED(protie) || protie.incapacitated())
						return 0
					var/new_color = tgui_color_picker(protie, "Pick eye color:","Eye Color", S.dragon_overlays[6])
					if(!new_color)
						return 0
					S.dragon_overlays[6] = choice
					S.dragon_overlays[S.dragon_overlays[6]] = new_color
			S.blob_appearance = "dragon"
		// CHOMPEdit Start
		if("dullahan")
			var/list/options = list("Metalshell","Eyes","Decals","Import","Export")
			for(var/option in options)
				LAZYSET(options, option, image('modular_chomp/icons/mob/dullahanborg/dullahansigns.dmi', option))
			var/choice = show_radial_menu(protie, protie, options, radius = 60)
			if(!choice || QDELETED(protie) || protie.incapacitated())
				return FALSE
			. = TRUE
			var/list/dullahanmetal_styles = list(
				"dullahanmetal",
				"dullahanmetal2"
			)
			if(mind.assigned_role in command_positions)
				dullahanmetal_styles.Add("dullahancommand")
			var/list/dullahaneyes_styles = list(
				"dullahaneyes"
			)
			var/list/dullahandecals_styles = list(
				"dullahandecals",
				"dullahandecals1",
				"dullahandecals2",
				"dullahandecals3",
				"dullahandecals4",
				"dullahandecals5",
				"emptydecals"
			)
			var/dmetal
			var/ddecals
			var/deyes
			var/ddecalscolor
			var/deyescolor
			var/dmetalcolor
			switch(choice)
				if("Metalshell")
					var/extraon = "dullahanextendedon"
					var/extraoff = "dullahanextendedoff"
					options = dullahanmetal_styles
					for(var/option in options)
						var/image/I = image('modular_chomp/icons/mob/dullahanborg/Dullahanprotean64x64.dmi', option, dir = 2, pixel_x = -16)
						LAZYSET(options, option, I)
					choice = show_radial_menu(protie, protie, options, radius = 90)
					if(!choice || QDELETED(protie) || protie.incapacitated())
						return 0
					var/new_color = tgui_color_picker(src, "Pick shell color:","Shell Color", S.dullahan_overlays[3])
					if(!new_color)
						return 0
					S.dullahan_overlays[3] = choice //metal overlay is 3, eyes is 4
					S.dullahan_overlays[S.dullahan_overlays[3]] = new_color
					if(choice == "dullahanmetal2")
						S.dullahan_overlays[6] = extraon
						var/tempcolor ="#FFFFFF"
						S.dullahan_overlays[S.dullahan_overlays[6]] = tempcolor
					else
						S.dullahan_overlays[6] = extraoff
				if("Eyes")
					options = dullahaneyes_styles
					for(var/option in options)
						var/image/I = image('modular_chomp/icons/mob/dullahanborg/Dullahanprotean64x64.dmi', option, dir = 2, pixel_x = -16)
						LAZYSET(options, option, I)
					choice = show_radial_menu(protie, protie, options, radius = 90)
					if(!choice || QDELETED(protie) || protie.incapacitated())
						return 0
					var/new_color = tgui_color_picker(src, "Pick eye color:","Eye Color", S.dullahan_overlays[4])
					if(!new_color)
						return 0
					S.dullahan_overlays[4] = choice
					S.dullahan_overlays[S.dullahan_overlays[4]] = new_color
				if("Decals")
					options = dullahandecals_styles
					for(var/option in options)
						var/image/I = image('modular_chomp/icons/mob/dullahanborg/Dullahanprotean64x64.dmi', option, dir = 2, pixel_x = -16, pixel_y = -16)
						LAZYSET(options, option, I)
					choice = show_radial_menu(protie, protie, options, radius = 90)
					if(!choice || QDELETED(protie) || protie.incapacitated())
						return 0
					var/new_color = tgui_color_picker(src, "Pick decal color:","Decal Color", S.dullahan_overlays[5])
					if(!new_color)
						return 0
					S.dullahan_overlays[5] = choice
					S.dullahan_overlays[S.dullahan_overlays[5]] = new_color
				if("Import")
					var/dinput_style
					dinput_style = sanitizeSafe(tgui_input_text(protie,"Paste the style string you exported with Export Style.", "Style loading","", 120), 128)
					if(dinput_style)
						var/list/dinput_style_list = splittext(dinput_style, ";")
						if((LAZYLEN(dinput_style_list) == 6) && (dinput_style_list[1] in dullahanmetal_styles) && (dinput_style_list[3] in dullahandecals_styles) && (dinput_style_list[5] in dullahaneyes_styles))
							try
								if(dinput_style_list[1] in dullahanmetal_styles)
									S.dullahan_overlays[3] = dinput_style_list[1]
									if(dinput_style_list[1] == "dullahanmetal2")
										S.dullahan_overlays[6] = "dullahanextendedon"
									else
										S.dullahan_overlays[6] = "dullahanextendedoff"
								if(rgb2num(dinput_style_list[2]))
									S.dullahan_overlays[S.dullahan_overlays[3]] = dinput_style_list[2] //metal shell color -2-
							catch
								dmetal = dinput_style_list[1]
							try
								if(dinput_style_list[3] in dullahandecals_styles)
									S.dullahan_overlays[5] = dinput_style_list[3]
								if(rgb2num(dinput_style_list[4]))
									S.dullahan_overlays[S.dullahan_overlays[5]] = dinput_style_list[4] // decals color
							catch
								ddecals = dinput_style_list[3]
							try
								if(dinput_style_list[5] in dullahaneyes_styles)
									S.dullahan_overlays[4] = dinput_style_list[5]
								if(rgb2num(dinput_style_list[6]))
									S.dullahan_overlays[S.dullahan_overlays[4]] = dinput_style_list[6] //eyes color
							catch
								ddecals = dinput_style_list[5]
				if("Export")
					dmetal = S.dullahan_overlays[3]
					ddecals = S.dullahan_overlays[5]
					deyes = S.dullahan_overlays[4]
					dmetalcolor = S.dullahan_overlays[S.dullahan_overlays[3]]
					ddecalscolor = S.dullahan_overlays[S.dullahan_overlays[5]]
					deyescolor = S.dullahan_overlays[S.dullahan_overlays[4]]
					var/output_style = jointext(list(dmetal,dmetalcolor,ddecals,ddecalscolor,deyes,deyescolor), ";")
					to_chat(protie, span_notice("Exported style string is \" [output_style] \". Use this to get the same style in the future with import style"))
			S.blob_appearance = "dullahan"
			// CHOMPEdit End
		if("Primary")
			var/new_color = tgui_color_picker(protie, "Pick primary color:","Protean Primary", "#FF0000")
			if(!new_color)
				return
			S.blob_color_1 = new_color
		if("Highlight")
			var/new_color = tgui_color_picker(protie, "Pick highlight color:","Protean Highlight", "#FF0000")
			if(!new_color)
				return
			S.blob_color_2 = new_color
>>>>>>> 965f8f4a61 ([MIRROR] remove old inputs (#10038))
		else
			to_chat(user,"<span class='warning'>That size change would cost [cost] steel, which you don't have.</span>")
	//Sizing down (or not at all)
	else if(cost <= 0)
		cost = abs(cost)
		var/actually_added = refactory.add_stored_material(MAT_STEEL,cost)
		user.resize(size_factor, ignore_prefs = TRUE)
		if(actually_added != cost)
			to_chat(user,"<span class='warning'>Unfortunately, [cost-actually_added] steel was lost due to lack of storage space.</span>")

	user.visible_message("<span class='notice'>Black mist swirls around [user] as they change size.</span>")

/// /// /// A helper to reuse
/mob/living/proc/nano_get_refactory(obj/item/organ/internal/nano/refactory/R)
	if(istype(R))
		if(!(R.status & ORGAN_DEAD))
			return R
	return

/mob/living/simple_mob/protean_blob/nano_get_refactory()
	if(refactory)
		return ..(refactory)
	if(humanform)
		return humanform.nano_get_refactory()

/mob/living/carbon/human/nano_get_refactory()
	return ..(locate(/obj/item/organ/internal/nano/refactory) in internal_organs)



/// /// /// Ability objects for stat panel
/obj/effect/protean_ability
	name = "Activate"
	desc = ""
	icon = 'icons/mob/species/protean/protean_powers.dmi'
	var/ability_name
	var/to_call

/obj/effect/protean_ability/proc/atom_button_text()
	return src

/obj/effect/protean_ability/Click(var/location, var/control, var/params)
	var/list/clickprops = params2list(params)
	var/opts = clickprops["shift"]

	if(opts)
		to_chat(usr,"<span class='notice'><b>[ability_name]</b> - [desc]</span>")
	else
		//Humanform using it
		if(ishuman(usr))
			do_ability(usr)
		//Blobform using it
		else
			var/mob/living/simple_mob/protean_blob/blob = usr
			do_ability(blob.humanform)

/obj/effect/protean_ability/proc/do_ability(var/mob/living/L)
	if(istype(L))
		call(L,to_call)()
	return FALSE

/// The actual abilities
/obj/effect/protean_ability/into_blob
	ability_name = "Toggle Blobform"
	desc = "Discard your shape entirely, changing to a low-energy blob that can fit into small spaces. You'll consume steel to repair yourself in this form."
	icon_state = "blob"
	to_call = /mob/living/carbon/human/proc/nano_blobform

/obj/effect/protean_ability/change_volume
	ability_name = "Change Volume"
	desc = "Alter your size by consuming steel to produce additional nanites, or regain steel by reducing your size and reclaiming them."
	icon_state = "volume"
	to_call = /mob/living/carbon/human/proc/nano_set_size

/obj/effect/protean_ability/reform_limb
	ability_name = "Ref - Single Limb"
	desc = "Rebuild or replace a single limb, assuming you have 2000 steel."
	icon_state = "limb"
	to_call = /mob/living/carbon/human/proc/nano_partswap

/obj/effect/protean_ability/reform_body
	ability_name = "Ref - Whole Body"
	desc = "Rebuild your entire body into whatever design you want, assuming you have 10,000 metal."
	icon_state = "body"
	to_call = /mob/living/carbon/human/proc/nano_regenerate

/obj/effect/protean_ability/metal_nom
	ability_name = "Ref - Store Metals"
	desc = "Store the metal you're holding. Your refactory can only store steel, and all other metals will be converted into nanites ASAP for various effects."
	icon_state = "metal"
	to_call = /mob/living/carbon/human/proc/nano_metalnom

#undef PER_LIMB_STEEL_COST
