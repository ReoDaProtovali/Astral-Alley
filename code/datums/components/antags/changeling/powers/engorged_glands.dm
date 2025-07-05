//Updated
/datum/power/changeling/engorged_glands
	name = "Engorged Chemical Glands"
	desc = "Our chemical glands swell, permitting us to store more chemicals inside of them."
	helptext = "Allows us to store an extra 30 units of chemicals, and doubles production rate."
	genomecost = 1
	isVerb = 0
	verbpath = /mob/proc/changeling_engorgedglands

//Increases macimum chemical storage
/mob/proc/changeling_engorgedglands()
<<<<<<< HEAD:code/game/gamemodes/changeling/powers/engorged_glands.dm
	src.mind.changeling.chem_storage += 30
	src.mind.changeling.chem_recharge_rate *= 2
	return 1
=======
	var/datum/component/antag/changeling/comp = is_changeling(src)
	comp.chem_storage += 30
	comp.chem_recharge_rate *= 2
	return 1
>>>>>>> a0c273ce1f ([MIRROR] Changing changeling (Refactor) (#11142)):code/datums/components/antags/changeling/powers/engorged_glands.dm
