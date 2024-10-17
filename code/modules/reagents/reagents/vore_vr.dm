
////////////////////////////
/// NW's shrinking serum ///
////////////////////////////

/datum/reagent/macrocillin
	name = "Macrocillin"
	id = "macrocillin"
	description = "Glowing yellow liquid."
	reagent_state = LIQUID
	color = "#FFFF00" // rgb: 255, 255, 0
	metabolism = 0.01
	mrate_static = TRUE

/datum/reagent/macrocillin/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	M.resize(M.size_multiplier+0.01, animate = FALSE, uncapped = M.has_large_resize_bounds()) //Incrrease 1% per tick. //CHOMP Edit: don't do fancy animates. Unnecessary on 1% changes. Laggy.
	return

/datum/reagent/microcillin
	name = "Microcillin"
	id = "microcillin"
	description = "Murky purple liquid."
	reagent_state = LIQUID
	color = "#800080"
	metabolism = 0.01
	mrate_static = TRUE

/datum/reagent/microcillin/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	M.resize(M.size_multiplier-0.01, animate = FALSE, uncapped = M.has_large_resize_bounds()) //Decrease 1% per tick. //CHOMP Edit: don't do fancy animates. Unnecessary on 1% changes. Laggy.
	return


/datum/reagent/normalcillin
	name = "Normalcillin"
	id = "normalcillin"
	description = "Translucent cyan liquid."
	reagent_state = LIQUID
	color = "#00FFFF"
	metabolism = 0.01 //One unit will be just enough to bring someone from 200% to 100%
	mrate_static = TRUE

/datum/reagent/normalcillin/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	if(M.size_multiplier > RESIZE_NORMAL)
		M.resize(M.size_multiplier-0.01, FALSE) //Decrease by 1% size per tick. //CHOMP Edit: don't do fancy animates. Unnecessary on 1% changes. Laggy.
	else if(M.size_multiplier < RESIZE_NORMAL)
		M.resize(M.size_multiplier+0.01, FALSE) //Increase 1% per tick.  //CHOMP Edit: don't do fancy animates. Unnecessary on 1% changes. Laggy.
	return


/datum/reagent/sizeoxadone
	name = "Sizeoxadone"
	id = "sizeoxadone"
	description = "A volatile liquid used as a precursor to size-altering chemicals. Causes dizziness if taken unprocessed."
	reagent_state = LIQUID
	color = "#1E90FF"
	overdose = REAGENTS_OVERDOSE

/datum/reagent/sizeoxadone/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	M.make_dizzy(1)
	if(!M.confused) M.confused = 1
	M.confused = max(M.confused, 20)
	return


////////////////////////// Anti-Noms Drugs //////////////////////////

/datum/reagent/ickypak
	name = "Ickypak"
	id = "ickypak"
	description = "A foul-smelling green liquid, for inducing muscle contractions to expel accidentally ingested things."
	reagent_state = LIQUID
	color = "#0E900E"
	overdose = REAGENTS_OVERDOSE

/datum/reagent/ickypak/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	M.make_dizzy(1)
	M.adjustHalLoss(2)

	for(var/obj/belly/B as anything in M.vore_organs)
		for(var/atom/movable/A in B)
			if(isliving(A))
				var/mob/living/P = A
				if(P.absorbed)
					continue
			if(prob(5))
				playsound(M, 'sound/effects/splat.ogg', 50, 1)
				B.release_specific_contents(A)

/datum/reagent/unsorbitol
	name = "Unsorbitol"
	id = "unsorbitol"
	description = "A frothy pink liquid, for causing cellular-level hetrogenous structure separation."
	reagent_state = LIQUID
	color = "#EF77E5"
	overdose = REAGENTS_OVERDOSE

/datum/reagent/unsorbitol/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	M.make_dizzy(1)
	M.adjustHalLoss(1)
	if(!M.confused) M.confused = 1
	M.confused = max(M.confused, 20)
	M.hallucination += 15

	for(var/obj/belly/B as anything in M.vore_organs)

		if(B.digest_mode == DM_ABSORB) //Turn off absorbing on bellies
			B.digest_mode = DM_HOLD

		for(var/mob/living/P in B)
			if(!P.absorbed)
				continue

			else if(prob(1))
				playsound(M, 'sound/vore/schlorp.ogg', 50, 1)
				P.absorbed = 0
				M.visible_message(span_infoplain(span_green(span_bold("Something spills into [M]'s [lowertext(B.name)]!"))))

////////////////////////// TF Drugs //////////////////////////

/datum/reagent/amorphorovir
	name = "Amorphorovir"
	id = "amorphorovir"
	description = "A base medical concoction, capable of rapidly altering genetic and physical structure of the body. Requires extra processing to allow for a targeted transformation."
	reagent_state = LIQUID
	color = "#AAAAAA"
/* CHOMPStation Removal for using Chompstation reagents over upstreams'
/datum/reagent/androrovir
	name = "Androrovir"
	id = "androrovir"
	description = "A medical concoction, capable of rapidly altering genetic and physical structure of the body. This one seems to realign the target's gender to be male."
	reagent_state = LIQUID
	color = "#00BBFF"

/datum/reagent/androrovir/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	if(!(M.allow_spontaneous_tf))
		return
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		if(M.reagents.has_reagent("gynorovir") || M.reagents.has_reagent("androgynorovir"))
			H.Confuse(1)
		else
			if(!(H.gender == MALE))
				H.set_gender(MALE)
				H.change_gender_identity(MALE)
				H.visible_message("<span class='notice'>[H] suddenly twitches as some of their features seem to contort and reshape, adjusting... In the end, it seems they are now male.</span>",
								"<span class='warning'>Your body suddenly contorts, feeling very different in various ways... By the time the rushing feeling is over it seems you just became male.</span>")

/datum/reagent/gynorovir
	name = "Gynorovir"
	id = "gynorovir"
	description = "A medical concoction, capable of rapidly altering genetic and physical structure of the body. This one seems to realign the target's gender to be female."
	reagent_state = LIQUID
	color = "#FF00AA"

/datum/reagent/gynorovir/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	if(!(M.allow_spontaneous_tf))
		return
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		if(M.reagents.has_reagent("androrovir") || M.reagents.has_reagent("androgynorovir"))
			H.Confuse(1)
		else
			if(!(H.gender == FEMALE))
				H.set_gender(FEMALE)
				H.change_gender_identity(FEMALE)
				H.visible_message("<span class='notice'>[H] suddenly twitches as some of their features seem to contort and reshape, adjusting... In the end, it seems they are now female.</span>",
								"<span class='warning'>Your body suddenly contorts, feeling very different in various ways... By the time the rushing feeling is over it seems you just became female.</span>")

/datum/reagent/androgynorovir
	name = "Androgynorovir"
	id = "androgynorovir"
	description = "A medical concoction, capable of rapidly altering genetic and physical structure of the body. This one seems to realign the target's gender to be mixed."
	reagent_state = LIQUID
	color = "#6600FF"

/datum/reagent/androgynorovir/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	if(!(M.allow_spontaneous_tf))
		return
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		if(M.reagents.has_reagent("gynorovir") || M.reagents.has_reagent("androrovir"))
			H.Confuse(1)
		else
			if(!(H.gender == PLURAL))
				H.set_gender(PLURAL)
				H.change_gender_identity(PLURAL)
				H.visible_message("<span class='notice'>[H] suddenly twitches as some of their features seem to contort and reshape, adjusting... In the end, it seems they are now of mixed gender.</span>",
								"<span class='warning'>Your body suddenly contorts, feeling very different in various ways... By the time the rushing feeling is over it seems you just became of mixed gender.</span>")
*/

////////////////////////// Misc Drugs //////////////////////////

/datum/reagent/drugs/rainbow_toxin /// Replaces Space Drugs.
	name = "Rainbow Toxin"
	id = "rainbowtoxin"
	description = "Known for providing a euphoric high, this psychoactive drug is often injected into unknowing prey by serpents and other fanged beasts. Highly valuable and frequently sought after by hypno-enthusiasts and party-goers."
	taste_description = "mixed euphoria"
	taste_mult = 0.8 //You ARE going to taste this!
	scannable = 1	//Sure! If you manage to milk a snake for some of this, go ahead and scan it and mass produce it. Your local club will love you!

/datum/reagent/drugs/rainbow_toxin/affect_blood(mob/living/carbon/M, var/alien, var/removed)
	..()
	var/drug_strength = 20
	M.druggy = max(M.druggy, drug_strength)

/datum/reagent/drugs/bliss/overdose(var/mob/living/M as mob)
	if(prob_proc == TRUE && prob(20))
		M.hallucination = max(M.hallucination, 5)
		prob_proc = FALSE
	M.adjustBrainLoss(0.25*REM) //Too much isn't good for your long term health...
	M.adjustToxLoss(0.01*REM)	//Enough that it'll make your HUD dummy update, but not enough that you'll vomit mid scene. (Sorry emetophiliacs!)
	..()

/datum/reagent/paralysis_toxin
	name = "Tetrodotoxin"
	id = "paralysistoxin"
	description = "A potent toxin commonly found in a plethora of species. When exposed to the toxin, causes extreme, paralysis for a prolonged period, with only essential functions of the body being unhindered. Commonly used by covert operatives and used as a crowd control tool."
	taste_description = "bitterness"
	reagent_state = LIQUID
	color = "#37007f"
	metabolism = REM * 0.25
	overdose = REAGENTS_OVERDOSE
	scannable = 0 //YOU ARE NOT SCANNING THE FUNNY PARALYSIS TOXIN. NO. BAD. STAY AWAY.

/datum/reagent/paralysis_toxin/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	if(M.weakened < 50) //Let's not leave them PERMA stuck, after all.
		M.AdjustWeakened(5) //Stand in for paralyze so you can still talk/emote/see

/datum/reagent/pain_enzyme
	name = "Pain Enzyme"
	id = "painenzyme"
	description = "An enzyme found in a variety of species. When exposed to the toxin, will cause severe, agonizing pain. The effects can last for hours depending on the dose. Only known cure is an equally strong painkiller or dialysis."
	taste_description = "sourness"
	reagent_state = LIQUID
	color = "#04b8fa" //Light blue in honor of Perry.
	metabolism = 0.1 //Lasts up to 50 seconds if you give 5 units.
	mrate_static = TRUE
	overdose = 100 //There is no OD. You already are taking the worst of it.
	scannable = 0 //Let's not have medical mechs able to make an extremely strong 'I hit you you fall down in agony' chem.

/datum/reagent/pain_enzyme/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	M.add_chemical_effect(CE_PAINKILLER, -200)
	if(prob(0.01)) //1 in 10000 chance per tick. Extremely rare.
		to_chat(M,"<span class='warning'>Your body feels as though it's on fire!</span>")
