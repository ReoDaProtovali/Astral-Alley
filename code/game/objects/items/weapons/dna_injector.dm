/obj/item/weapon/dnainjector
	name = "\improper DNA injector"
	desc = "This injects the person with DNA."
	icon = 'icons/obj/items.dmi'
	icon_state = "dnainjector"
	var/block=0
	var/datum/dna2/record/buf=null
	throw_speed = 1
	throw_range = 5
	w_class = ITEMSIZE_TINY
	slot_flags = SLOT_EARS
	var/uses = 1
	var/nofail

	// USE ONLY IN PREMADE SYRINGES.  WILL NOT WORK OTHERWISE.
	var/datatype=0
	var/value=0

<<<<<<< HEAD
/obj/item/weapon/dnainjector/New()
=======
	// Traitgenes edit begin - Removed subtype, replaced with flag. Allows for safe injectors. Mostly for admin usage.
	var/has_radiation = TRUE
	// Traitgenes edit end

/obj/item/dnainjector/Initialize() // Traitgenes edit - Moved to init
>>>>>>> 7bfffc808d ([MIRROR] Adds Trait Genetics (#10142))
	if(datatype && block)
		buf=new
		buf.dna=new
		buf.types = datatype
		buf.dna.ResetSE()
		//testing("[name]: DNA2 SE blocks prior to SetValue: [english_list(buf.dna.SE)]")
		SetValue(src.value)
		//testing("[name]: DNA2 SE blocks after SetValue: [english_list(buf.dna.SE)]")
	. = ..() // Traitgenes edit - Moved to init

/obj/item/weapon/dnainjector/proc/GetRealBlock(var/selblock)
	if(selblock==0)
		return block
	else
		return selblock

/obj/item/weapon/dnainjector/proc/GetState(var/selblock=0)
	var/real_block=GetRealBlock(selblock)
	if(buf.types&DNA2_BUF_SE)
		return buf.dna.GetSEState(real_block)
	else
		return buf.dna.GetUIState(real_block)

/obj/item/weapon/dnainjector/proc/SetState(var/on, var/selblock=0)
	var/real_block=GetRealBlock(selblock)
	if(buf.types&DNA2_BUF_SE)
		return buf.dna.SetSEState(real_block,on)
	else
		return buf.dna.SetUIState(real_block,on)

/obj/item/weapon/dnainjector/proc/GetValue(var/selblock=0)
	var/real_block=GetRealBlock(selblock)
	if(buf.types&DNA2_BUF_SE)
		return buf.dna.GetSEValue(real_block)
	else
		return buf.dna.GetUIValue(real_block)

/obj/item/weapon/dnainjector/proc/SetValue(var/val,var/selblock=0)
	var/real_block=GetRealBlock(selblock)
	if(buf.types&DNA2_BUF_SE)
		return buf.dna.SetSEValue(real_block,val)
	else
		return buf.dna.SetUIValue(real_block,val)

<<<<<<< HEAD
/obj/item/weapon/dnainjector/proc/inject(mob/M as mob, mob/user as mob)
	if(istype(M,/mob/living))
=======
/obj/item/dnainjector/proc/inject(mob/M as mob, mob/user as mob)
	if(isliving(M) && has_radiation)
>>>>>>> 7bfffc808d ([MIRROR] Adds Trait Genetics (#10142))
		var/mob/living/L = M
		L.apply_effect(rand(5,20), IRRADIATE, check_protection = 0)
		L.apply_damage(max(2,L.getCloneLoss()), CLONE)

	// Traitgenes edit begin - NO_SCAN and Synthetics cannot be mutated
	var/allow = TRUE
	if(M.isSynthetic())
		allow = FALSE
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		if(!H.species || H.species.flags & NO_SCAN)
			allow = FALSE
	// Traitgenes edit end
	if (!(NOCLONE in M.mutations) && allow) // prevents drained people from having their DNA changed, Traitgenes edit - NO_SCAN and Synthetics cannot be mutated
		if(buf)
			if (buf.types & DNA2_BUF_UI)
				if (!block) //isolated block?
					M.UpdateAppearance(buf.dna.UI.Copy())
					if (buf.types & DNA2_BUF_UE) //unique enzymes? yes
						M.real_name = buf.dna.real_name
						M.name = buf.dna.real_name
					uses--
				else
					M.dna.SetUIValue(block,src.GetValue())
					M.UpdateAppearance()
					uses--
			if (buf.types & DNA2_BUF_SE)
				if (!block) //isolated block?
					M.dna.SE = buf.dna.SE.Copy()
					M.dna.UpdateSE()
				else
					M.dna.SetSEValue(block,src.GetValue())
				uses--
				// Traitgenes edit - Moved gene checks to after side effects
				if(prob(5))
					trigger_side_effect(M)
			// Traitgenes edit begin - Do gene updates here, and more comprehensively
			if(ishuman(M))
				var/mob/living/carbon/human/H = M
				H.sync_dna_traits(FALSE,FALSE)
				H.sync_organ_dna()
			M.regenerate_icons()
			// Traitgenes edit end

	if (user)
		user.drop_from_inventory(src)
	INVOKE_ASYNC(GLOBAL_PROC, GLOBAL_PROC_REF(qdel), src)
	return uses

/obj/item/weapon/dnainjector/attack(mob/M as mob, mob/user as mob)
	if (!istype(M, /mob))
		return
	if (!usr.IsAdvancedToolUser())
		return
	if (in_use)
		return

<<<<<<< HEAD
	user.visible_message("<span class='danger'>\The [user] is trying to inject \the [M] with \the [src]!</span>")
	inuse = 1
	s_time = world.time
	spawn(50)
		inuse = 0
=======
	user.visible_message(span_danger("\The [user] is trying to inject \the [M] with \the [src]!"))
	in_use = TRUE

	//addtimer(VARSET_CALLBACK(src, in_use , FALSE), 5 SECONDS, TIMER_DELETE_ME) //Leaving this for reference of how to do the timer here if do_after wasn't present.
>>>>>>> 7bfffc808d ([MIRROR] Adds Trait Genetics (#10142))

	if(!do_after(user,50))
		in_use = FALSE
		return


	user.setClickCooldown(DEFAULT_QUICK_COOLDOWN)
	user.do_attack_animation(M)

	M.visible_message("<span class='danger'>\The [M] has been injected with \the [src] by \the [user].</span>")

	var/mob/living/carbon/human/H = M
	if(!istype(H))
		to_chat(user, "<span class='warning'>Apparently it didn't work...</span>")
		return

<<<<<<< HEAD
	// Used by admin log.
	var/injected_with_monkey = ""
	if((buf.types & DNA2_BUF_SE) && (block ? (GetState() && block == MONKEYBLOCK) : GetState(MONKEYBLOCK)))
		injected_with_monkey = " <span class='danger'>(MONKEY)</span>"

	add_attack_logs(user,M,"[injected_with_monkey] used the [name] on")

	// Apply the DNA shit.
	inject(M, user)
	return

/obj/item/weapon/dnainjector/hulkmut
	name = "\improper DNA injector (Hulk)"
	desc = "This will make you big and strong, but give you a bad skin condition."
	datatype = DNA2_BUF_SE
	value = 0xFFF

/obj/item/weapon/dnainjector/hulkmut/New()
	block = HULKBLOCK
	..()

/obj/item/weapon/dnainjector/antihulk
	name = "\improper DNA injector (Anti-Hulk)"
	desc = "Cures green skin."
	datatype = DNA2_BUF_SE
	value = 0x001

/obj/item/weapon/dnainjector/antihulk/New()
	block = HULKBLOCK
	..()

/obj/item/weapon/dnainjector/xraymut
	name = "\improper DNA injector (Xray)"
	desc = "Finally you can see what the Site Manager does."
	datatype = DNA2_BUF_SE
	value = 0xFFF

/obj/item/weapon/dnainjector/xraymut/New()
	block = XRAYBLOCK
	..()

/obj/item/weapon/dnainjector/antixray
	name = "\improper DNA injector (Anti-Xray)"
	desc = "It will make you see harder."
	datatype = DNA2_BUF_SE
	value = 0x001

/obj/item/weapon/dnainjector/antixray/New()
	block = XRAYBLOCK
	..()

/obj/item/weapon/dnainjector/firemut
	name = "\improper DNA injector (Fire)"
	desc = "Gives you fire."
	datatype = DNA2_BUF_SE
	value = 0xFFF

/obj/item/weapon/dnainjector/firemut/New()
	block = FIREBLOCK
	..()

/obj/item/weapon/dnainjector/antifire
	name = "\improper DNA injector (Anti-Fire)"
	desc = "Cures fire."
	datatype = DNA2_BUF_SE
	value = 0x001

/obj/item/weapon/dnainjector/antifire/New()
	block = FIREBLOCK
	..()

/obj/item/weapon/dnainjector/telemut
	name = "\improper DNA injector (Tele.)"
	desc = "Super brain man!"
	datatype = DNA2_BUF_SE
	value = 0xFFF

/obj/item/weapon/dnainjector/telemut/New()
	block = TELEBLOCK
	..()

/obj/item/weapon/dnainjector/antitele
	name = "\improper DNA injector (Anti-Tele.)"
	desc = "Will make you not able to control your mind."
	datatype = DNA2_BUF_SE
	value = 0x001

/obj/item/weapon/dnainjector/antitele/New()
	block = TELEBLOCK
	..()

/obj/item/weapon/dnainjector/nobreath
	name = "\improper DNA injector (No Breath)"
	desc = "Hold your breath and count to infinity."
	datatype = DNA2_BUF_SE
	value = 0xFFF

/obj/item/weapon/dnainjector/nobreath/New()
	block = NOBREATHBLOCK
	..()

/obj/item/weapon/dnainjector/antinobreath
	name = "\improper DNA injector (Anti-No Breath)"
	desc = "Hold your breath and count to 100."
	datatype = DNA2_BUF_SE
	value = 0x001

/obj/item/weapon/dnainjector/antinobreath/New()
	block = NOBREATHBLOCK
	..()

/obj/item/weapon/dnainjector/remoteview
	name = "\improper DNA injector (Remote View)"
	desc = "Stare into the distance for a reason."
	datatype = DNA2_BUF_SE
	value = 0xFFF

/obj/item/weapon/dnainjector/remoteview/New()
	block = REMOTEVIEWBLOCK
	..()

/obj/item/weapon/dnainjector/antiremoteview
	name = "\improper DNA injector (Anti-Remote View)"
	desc = "Cures green skin."
	datatype = DNA2_BUF_SE
	value = 0x001

/obj/item/weapon/dnainjector/antiremoteview/New()
	block = REMOTEVIEWBLOCK
	..()

/obj/item/weapon/dnainjector/regenerate
	name = "\improper DNA injector (Regeneration)"
	desc = "Healthy but hungry."
	datatype = DNA2_BUF_SE
	value = 0xFFF

/obj/item/weapon/dnainjector/regenerate/New()
	block = REGENERATEBLOCK
	..()

/obj/item/weapon/dnainjector/antiregenerate
	name = "\improper DNA injector (Anti-Regeneration)"
	desc = "Sickly but sated."
	datatype = DNA2_BUF_SE
	value = 0x001

/obj/item/weapon/dnainjector/antiregenerate/New()
	block = REGENERATEBLOCK
	..()

/obj/item/weapon/dnainjector/runfast
	name = "\improper DNA injector (Increase Run)"
	desc = "Running Man."
	datatype = DNA2_BUF_SE
	value = 0xFFF

/obj/item/weapon/dnainjector/runfast/New()
	block = INCREASERUNBLOCK
	..()

/obj/item/weapon/dnainjector/antirunfast
	name = "\improper DNA injector (Anti-Increase Run)"
	desc = "Walking Man."
	datatype = DNA2_BUF_SE
	value = 0x001

/obj/item/weapon/dnainjector/antirunfast/New()
	block = INCREASERUNBLOCK
	..()

/obj/item/weapon/dnainjector/morph
	name = "\improper DNA injector (Morph)"
	desc = "A total makeover."
	datatype = DNA2_BUF_SE
	value = 0xFFF

/obj/item/weapon/dnainjector/morph/New()
	block = MORPHBLOCK
	..()

/obj/item/weapon/dnainjector/antimorph
	name = "\improper DNA injector (Anti-Morph)"
	desc = "Cures identity crisis."
	datatype = DNA2_BUF_SE
	value = 0x001

/obj/item/weapon/dnainjector/antimorph/New()
	block = MORPHBLOCK
	..()

/obj/item/weapon/dnainjector/noprints
	name = "\improper DNA injector (No Prints)"
	desc = "Better than a pair of budget insulated gloves."
	datatype = DNA2_BUF_SE
	value = 0xFFF

/obj/item/weapon/dnainjector/noprints/New()
	block = NOPRINTSBLOCK
	..()

/obj/item/weapon/dnainjector/antinoprints
	name = "\improper DNA injector (Anti-No Prints)"
	desc = "Not quite as good as a pair of budget insulated gloves."
	datatype = DNA2_BUF_SE
	value = 0x001

/obj/item/weapon/dnainjector/antinoprints/New()
	block = NOPRINTSBLOCK
	..()

/obj/item/weapon/dnainjector/insulation
	name = "\improper DNA injector (Shock Immunity)"
	desc = "Better than a pair of real insulated gloves."
	datatype = DNA2_BUF_SE
	value = 0xFFF

/obj/item/weapon/dnainjector/insulation/New()
	block = SHOCKIMMUNITYBLOCK
	..()

/obj/item/weapon/dnainjector/antiinsulation
	name = "\improper DNA injector (Anti-Shock Immunity)"
	desc = "Not quite as good as a pair of real insulated gloves."
	datatype = DNA2_BUF_SE
	value = 0x001

/obj/item/weapon/dnainjector/antiinsulation/New()
	block = SHOCKIMMUNITYBLOCK
	..()

/obj/item/weapon/dnainjector/midgit
	name = "\improper DNA injector (Small Size)"
	desc = "Makes you shrink."
	datatype = DNA2_BUF_SE
	value = 0xFFF

/obj/item/weapon/dnainjector/midgit/New()
	block = SMALLSIZEBLOCK
	..()

/obj/item/weapon/dnainjector/antimidgit
	name = "\improper DNA injector (Anti-Small Size)"
	desc = "Makes you grow. But not too much."
	datatype = DNA2_BUF_SE
	value = 0x001

/obj/item/weapon/dnainjector/antimidgit/New()
	block = SMALLSIZEBLOCK
	..()

/////////////////////////////////////
/obj/item/weapon/dnainjector/antiglasses
	name = "\improper DNA injector (Anti-Glasses)"
	desc = "Toss away those glasses!"
	datatype = DNA2_BUF_SE
	value = 0x001

/obj/item/weapon/dnainjector/antiglasses/New()
	block = GLASSESBLOCK
	..()

/obj/item/weapon/dnainjector/glassesmut
	name = "\improper DNA injector (Glasses)"
	desc = "Will make you need dorkish glasses."
	datatype = DNA2_BUF_SE
	value = 0xFFF

/obj/item/weapon/dnainjector/glassesmut/New()
	block = GLASSESBLOCK
	..()

/obj/item/weapon/dnainjector/epimut
	name = "\improper DNA injector (Epi.)"
	desc = "Shake shake shake the room!"
	datatype = DNA2_BUF_SE
	value = 0xFFF

/obj/item/weapon/dnainjector/epimut/New()
	block = HEADACHEBLOCK
	..()

/obj/item/weapon/dnainjector/antiepi
	name = "\improper DNA injector (Anti-Epi.)"
	desc = "Will fix you up from shaking the room."
	datatype = DNA2_BUF_SE
	value = 0x001

/obj/item/weapon/dnainjector/antiepi/New()
	block = HEADACHEBLOCK
	..()

/obj/item/weapon/dnainjector/anticough
	name = "\improper DNA injector (Anti-Cough)"
	desc = "Will stop that awful noise."
	datatype = DNA2_BUF_SE
	value = 0x001

/obj/item/weapon/dnainjector/anticough/New()
	block = COUGHBLOCK
	..()

/obj/item/weapon/dnainjector/coughmut
	name = "\improper DNA injector (Cough)"
	desc = "Will bring forth a sound of horror from your throat."
	datatype = DNA2_BUF_SE
	value = 0xFFF

/obj/item/weapon/dnainjector/coughmut/New()
	block = COUGHBLOCK
	..()

/obj/item/weapon/dnainjector/clumsymut
	name = "\improper DNA injector (Clumsy)"
	desc = "Makes clumsy minions."
	datatype = DNA2_BUF_SE
	value = 0xFFF

/obj/item/weapon/dnainjector/clumsymut/New()
	block = CLUMSYBLOCK
	..()

/obj/item/weapon/dnainjector/anticlumsy
	name = "\improper DNA injector (Anti-Clumy)"
	desc = "Cleans up confusion."
	datatype = DNA2_BUF_SE
	value = 0x001

/obj/item/weapon/dnainjector/anticlumsy/New()
	block = CLUMSYBLOCK
	..()

/obj/item/weapon/dnainjector/antitour
	name = "\improper DNA injector (Anti-Tour.)"
	desc = "Will cure tourrets."
	datatype = DNA2_BUF_SE
	value = 0x001

/obj/item/weapon/dnainjector/antitour/New()
	block = TWITCHBLOCK
	..()

/obj/item/weapon/dnainjector/tourmut
	name = "\improper DNA injector (Tour.)"
	desc = "Gives you a nasty case off tourrets."
	datatype = DNA2_BUF_SE
	value = 0xFFF

/obj/item/weapon/dnainjector/tourmut/New()
	block = TWITCHBLOCK
	..()

/obj/item/weapon/dnainjector/stuttmut
	name = "\improper DNA injector (Stutt.)"
	desc = "Makes you s-s-stuttterrr"
	datatype = DNA2_BUF_SE
	value = 0xFFF

/obj/item/weapon/dnainjector/stuttmut/New()
	block = NERVOUSBLOCK
	..()

/obj/item/weapon/dnainjector/antistutt
	name = "\improper DNA injector (Anti-Stutt.)"
	desc = "Fixes that speaking impairment."
	datatype = DNA2_BUF_SE
	value = 0x001

/obj/item/weapon/dnainjector/antistutt/New()
	block = NERVOUSBLOCK
	..()

/obj/item/weapon/dnainjector/blindmut
	name = "\improper DNA injector (Blind)"
	desc = "Makes you not see anything."
	datatype = DNA2_BUF_SE
	value = 0xFFF

/obj/item/weapon/dnainjector/blindmut/New()
	block = BLINDBLOCK
	..()

/obj/item/weapon/dnainjector/antiblind
	name = "\improper DNA injector (Anti-Blind)"
	desc = "ITS A MIRACLE!!!"
	datatype = DNA2_BUF_SE
	value = 0x001

/obj/item/weapon/dnainjector/antiblind/New()
	block = BLINDBLOCK
	..()

/obj/item/weapon/dnainjector/deafmut
	name = "\improper DNA injector (Deaf)"
	desc = "Sorry, what did you say?"
	datatype = DNA2_BUF_SE
	value = 0xFFF

/obj/item/weapon/dnainjector/deafmut/New()
	block = DEAFBLOCK
	..()

/obj/item/weapon/dnainjector/antideaf
	name = "\improper DNA injector (Anti-Deaf)"
	desc = "Will make you hear once more."
	datatype = DNA2_BUF_SE
	value = 0x001

/obj/item/weapon/dnainjector/antideaf/New()
	block = DEAFBLOCK
	..()

/obj/item/weapon/dnainjector/hallucination
	name = "\improper DNA injector (Halluctination)"
	desc = "What you see isn't always what you get."
	datatype = DNA2_BUF_SE
	value = 0xFFF

/obj/item/weapon/dnainjector/hallucination/New()
	block = HALLUCINATIONBLOCK
	..()

/obj/item/weapon/dnainjector/antihallucination
	name = "\improper DNA injector (Anti-Hallucination)"
	desc = "What you see is what you get."
	datatype = DNA2_BUF_SE
	value = 0x001

/obj/item/weapon/dnainjector/antihallucination/New()
	block = HALLUCINATIONBLOCK
	..()

/obj/item/weapon/dnainjector/h2m
	name = "\improper DNA injector (Human > Monkey)"
	desc = "Will make you a flea bag."
	datatype = DNA2_BUF_SE
	value = 0xFFF

/obj/item/weapon/dnainjector/h2m/New()
	block = MONKEYBLOCK
	..()

/obj/item/weapon/dnainjector/m2h
	name = "\improper DNA injector (Monkey > Human)"
	desc = "Will make you...less hairy."
	datatype = DNA2_BUF_SE
	value = 0x001

/obj/item/weapon/dnainjector/m2h/New()
	block = MONKEYBLOCK
	..()
=======
	inject(M, user)
	return


// Traitgenes Injectors are randomized now due to no hardcoded genes. Split into good or bad, and then versions that specify what they do on the label.
// Otherwise scroll down further for how to make unique injectors
/obj/item/dnainjector/proc/pick_block(var/datum/gene/trait/G, var/labeled, var/allow_disable, var/force_disable = FALSE)
	if(G)
		block = G.block
		datatype = DNA2_BUF_SE
		if(!force_disable)
			value = 0xFFF
		else
			value = 0x000
		if(allow_disable)
			value = pick(0x000,0xFFF)
		if(labeled)
			name = initial(name) + " - [value == 0x000 ? "Removes" : ""] [G.get_name()]"

/obj/item/dnainjector/random
	name = "\improper DNA injector"
	desc = "This injects the person with DNA."

// Purely rando
/obj/item/dnainjector/random/Initialize()
	pick_block( pick(GLOB.dna_genes_good + GLOB.dna_genes_neutral + GLOB.dna_genes_bad), FALSE, TRUE)
	. = ..()

/obj/item/dnainjector/random_labeled/Initialize()
	pick_block( pick(GLOB.dna_genes_good + GLOB.dna_genes_neutral + GLOB.dna_genes_bad), TRUE, TRUE)
	. = ..()

// Good/bad but also neutral genes mixed in, less OP selection of genes
/obj/item/dnainjector/random_good/Initialize()
	pick_block( pick(GLOB.dna_genes_good + GLOB.dna_genes_neutral ), FALSE, TRUE)
	. = ..()

/obj/item/dnainjector/random_good_labeled/Initialize()
	pick_block( pick(GLOB.dna_genes_good + GLOB.dna_genes_neutral ), TRUE, TRUE)
	. = ..()

/obj/item/dnainjector/random_bad/Initialize()
	pick_block( pick(GLOB.dna_genes_bad + GLOB.dna_genes_neutral ), FALSE, TRUE)
	. = ..()

/obj/item/dnainjector/random_bad_labeled/Initialize()
	pick_block( pick(GLOB.dna_genes_bad + GLOB.dna_genes_neutral ), TRUE, TRUE)
	. = ..()

// Purely good/bad genes, intended to be usually good rewards or punishments
/obj/item/dnainjector/random_verygood/Initialize()
	pick_block( pick(GLOB.dna_genes_good), FALSE, FALSE)
	. = ..()

/obj/item/dnainjector/random_verygood_labeled/Initialize()
	pick_block( pick(GLOB.dna_genes_good), TRUE, FALSE)
	. = ..()

/obj/item/dnainjector/random_verybad/Initialize()
	pick_block( pick(GLOB.dna_genes_bad), FALSE, FALSE)
	. = ..()

/obj/item/dnainjector/random_verybad_labeled/Initialize()
	pick_block( pick(GLOB.dna_genes_bad), TRUE, FALSE)
	. = ..()

// Random neutral traits
/obj/item/dnainjector/random_neutral/Initialize()
	pick_block( pick(GLOB.dna_genes_neutral ), FALSE, TRUE)
	. = ..()

/obj/item/dnainjector/random_neutral_labeled/Initialize()
	pick_block( pick(GLOB.dna_genes_neutral ), TRUE, TRUE)
	. = ..()

// If you want a unique injector, use a subtype of these
/obj/item/dnainjector/set_trait
	var/trait_path
	var/disabling = FALSE

/obj/item/dnainjector/set_trait/Initialize()
	var/G = get_gene_from_trait(trait_path)
	if(trait_path && G)
		pick_block( G, TRUE, FALSE, disabling)
	else
		qdel(src)
		return
	. = ..()

	disabling = TRUE

// Injectors for all original genes and some new ones
/obj/item/dnainjector/set_trait/anxiety	// stutter
	trait_path = /datum/trait/negative/disability_anxiety
/obj/item/dnainjector/set_trait/anxiety/disable
	disabling = TRUE

/obj/item/dnainjector/set_trait/noprints // noprints
	trait_path = /datum/trait/positive/superpower_noprints
/obj/item/dnainjector/set_trait/noprints/disable
	disabling = TRUE

/obj/item/dnainjector/set_trait/tourettes // tour
	trait_path = /datum/trait/negative/disability_tourettes
/obj/item/dnainjector/set_trait/tourettes/disable
	disabling = TRUE

/obj/item/dnainjector/set_trait/cough // cough
	trait_path = /datum/trait/negative/disability_cough
/obj/item/dnainjector/set_trait/cough/disable
	disabling = TRUE

/obj/item/dnainjector/set_trait/nearsighted // glasses
	trait_path = /datum/trait/negative/disability_nearsighted
/obj/item/dnainjector/set_trait/nearsighted/disable
	disabling = TRUE

/obj/item/dnainjector/set_trait/heatadapt // fire
	trait_path = /datum/trait/neutral/hotadapt
/obj/item/dnainjector/set_trait/heatadapt/disable
	disabling = TRUE

/obj/item/dnainjector/set_trait/epilepsy // epi
	trait_path = /datum/trait/negative/disability_epilepsy
/obj/item/dnainjector/set_trait/epilepsy/disable
	disabling = TRUE

/obj/item/dnainjector/set_trait/morph // morph
	trait_path = /datum/trait/positive/superpower_morph
/obj/item/dnainjector/set_trait/morph/disable
	disabling = TRUE

/obj/item/dnainjector/set_trait/regenerate // regenerate
	trait_path = /datum/trait/positive/superpower_regenerate
/obj/item/dnainjector/set_trait/regenerate/disable
	disabling = TRUE

/obj/item/dnainjector/set_trait/clumsy // clumsy
	trait_path = /datum/trait/negative/disability_clumsy
/obj/item/dnainjector/set_trait/clumsy/disable
	disabling = TRUE

/obj/item/dnainjector/set_trait/coldadapt // insulated
	trait_path = /datum/trait/neutral/coldadapt
/obj/item/dnainjector/set_trait/coldadapt/disable
	disabling = TRUE

/obj/item/dnainjector/set_trait/xray // xraymut
	trait_path = /datum/trait/positive/superpower_xray
/obj/item/dnainjector/set_trait/xray/disable
	disabling = TRUE

/obj/item/dnainjector/set_trait/deaf // deafmut
	trait_path = /datum/trait/negative/disability_deaf
/obj/item/dnainjector/set_trait/deaf/disable
	disabling = TRUE

/obj/item/dnainjector/set_trait/tk // telemut
	trait_path = /datum/trait/positive/superpower_tk
/obj/item/dnainjector/set_trait/tk/disable
	disabling = TRUE

/obj/item/dnainjector/set_trait/haste // runfast
	trait_path = /datum/trait/positive/speed_fast
/obj/item/dnainjector/set_trait/haste/disable
	disabling = TRUE

/obj/item/dnainjector/set_trait/blind // blindmut
	trait_path = /datum/trait/negative/blindness
/obj/item/dnainjector/set_trait/blind/disable
	disabling = TRUE

/obj/item/dnainjector/set_trait/nobreathe // nobreath
	trait_path = /datum/trait/positive/superpower_nobreathe
/obj/item/dnainjector/set_trait/nobreathe/disable
	disabling = TRUE

/obj/item/dnainjector/set_trait/remoteview // remoteview
	trait_path = /datum/trait/positive/superpower_remoteview
/obj/item/dnainjector/set_trait/remoteview/disable
	disabling = TRUE

/obj/item/dnainjector/set_trait/flashproof // flashproof
	trait_path = /datum/trait/positive/superpower_flashproof
/obj/item/dnainjector/set_trait/flashproof/disable
	disabling = TRUE

/obj/item/dnainjector/set_trait/hulk // hulk
	trait_path = /datum/trait/positive/superpower_hulk
/obj/item/dnainjector/set_trait/hulk/disable
	disabling = TRUE

/obj/item/dnainjector/set_trait/table_passer // midgit
	trait_path = /datum/trait/positive/table_passer
/obj/item/dnainjector/set_trait/table_passer/disable
	disabling = TRUE

/obj/item/dnainjector/set_trait/remotetalk // remotetalk
	trait_path = /datum/trait/positive/superpower_remotetalk
/obj/item/dnainjector/set_trait/remotetalk/disable
	disabling = TRUE

/obj/item/dnainjector/set_trait/nonconduct // shock
	trait_path = /datum/trait/positive/nonconductive_plus
/obj/item/dnainjector/set_trait/nonconduct/disable
	disabling = TRUE
>>>>>>> 7bfffc808d ([MIRROR] Adds Trait Genetics (#10142))
