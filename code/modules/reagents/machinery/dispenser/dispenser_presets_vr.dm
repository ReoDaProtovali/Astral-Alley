/obj/machinery/chemical_dispenser/xenoflora
	name = "xenoflora chem dispenser"
	ui_title = "Xenoflora Chemical Dispenser"
	dispense_reagents = list(
		REAGENT_ID_WATER, REAGENT_ID_SUGAR, REAGENT_ID_ETHANOL, REAGENT_ID_RADIUM, REAGENT_ID_AMMONIA, REAGENT_ID_DIETHYLAMINE, REAGENT_ID_PLANTBGONE, REAGENT_ID_MUTAGEN, REAGENT_ID_CALCIUM
		)

/obj/machinery/chemical_dispenser/xenoflora/full
	spawn_cartridges = list(
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/water,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/sugar,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/ethanol,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/radium,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/ammonia,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/diethylamine,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/plantbgone,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/mutagen,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/calcium
		)

/obj/machinery/chemical_dispenser/biochemistry
	name = "bioproduct dispenser"
	ui_title = "Bioproduct Dispenser"
	dispense_reagents = list(
		REAGENT_ID_NUTRIMENT, REAGENT_ID_PROTEIN, REAGENT_ID_MILK
		)

/obj/machinery/chemical_dispenser/biochemistry/full
	spawn_cartridges = list(
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/nutriment,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/protein,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/milk
		)

/obj/machinery/chemical_dispenser/ert/specialops
	spawn_cartridges = list(
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/inaprov,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/dylovene,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/ryetalyn,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/tramadol,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/oxycodone,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/sterilizine,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/leporazine,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/kelotane,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/dermaline,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/dexalin,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/dexalin_p,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/synaptizine,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/hyronalin,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/arithrazine,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/alkysine,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/imidazoline,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/peridaxon,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/bicaridine,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/hyperzine,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/rezadone,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/spaceacillin,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/ethylredox,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/carthatoline,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/corophizine,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/myelamine,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/osteodaxon,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/biomass,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/iron,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/nutriment,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/protein
		)

/obj/machinery/chemical_dispenser/ert/specialops/abductor
	name = "chemical dispenser"
	icon = 'icons/obj/abductor_vr.dmi'
	icon_state = "dispenser_2way"
	desc = "A mysterious machine which can fabricate many chemicals."
