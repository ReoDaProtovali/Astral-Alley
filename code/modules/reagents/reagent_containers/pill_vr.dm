<<<<<<< HEAD
/obj/item/weapon/reagent_containers/pill/nutriment
	name = "Nutriment (30u)"
	desc = "Used to feed people on the field. Contains 30 units of Nutriment."
=======
/obj/item/reagent_containers/pill/nutriment
	name = REAGENT_NUTRIMENT + " (30u)"
	desc = "Used to feed people on the field. Contains 30 units of " + REAGENT_NUTRIMENT + "."
>>>>>>> fd5d9267ff ([MIRROR] Converts gas, ore, plants and reagent strings to defines (#9611))
	icon_state = "pill10"

/obj/item/weapon/reagent_containers/pill/nutriment/Initialize()
	. = ..()
	reagents.add_reagent(REAGENT_ID_NUTRIMENT, 30)

<<<<<<< HEAD
/obj/item/weapon/reagent_containers/pill/protein
	name = "Protein (30u)"
	desc = "Used to feed carnivores on the field. Contains 30 units of Protein."
=======
/obj/item/reagent_containers/pill/protein
	name = REAGENT_PROTEIN + " (30u)"
	desc = "Used to feed carnivores on the field. Contains 30 units of " + REAGENT_PROTEIN + "."
>>>>>>> fd5d9267ff ([MIRROR] Converts gas, ore, plants and reagent strings to defines (#9611))
	icon_state = "pill24"

/obj/item/weapon/reagent_containers/pill/protein/Initialize()
	. = ..()
	reagents.add_reagent(REAGENT_ID_PROTEIN, 30)

<<<<<<< HEAD
/obj/item/weapon/reagent_containers/pill/rezadone
	name = "Rezadone (5u)"
=======
/obj/item/reagent_containers/pill/rezadone
	name = REAGENT_REZADONE + " (5u)"
>>>>>>> fd5d9267ff ([MIRROR] Converts gas, ore, plants and reagent strings to defines (#9611))
	desc = "A powder with almost magical properties, this substance can effectively treat genetic damage in humanoids, though excessive consumption has side effects."
	icon_state = "pill2"

/obj/item/weapon/reagent_containers/pill/rezadone/Initialize()
	. = ..()
	reagents.add_reagent(REAGENT_ID_REZADONE, 5)
	color = reagents.get_color()

<<<<<<< HEAD
/obj/item/weapon/reagent_containers/pill/peridaxon
	name = "Peridaxon (10u)"
=======
/obj/item/reagent_containers/pill/peridaxon
	name = REAGENT_PERIDAXON + " (10u)"
>>>>>>> fd5d9267ff ([MIRROR] Converts gas, ore, plants and reagent strings to defines (#9611))
	desc = "Used to encourage recovery of internal organs and nervous systems. Medicate cautiously."
	icon_state = "pill10"

/obj/item/weapon/reagent_containers/pill/peridaxon/Initialize()
	. = ..()
	reagents.add_reagent(REAGENT_ID_PERIDAXON, 10)

<<<<<<< HEAD
/obj/item/weapon/reagent_containers/pill/carthatoline
	name = "Carthatoline (15u)"
	desc = "Carthatoline is strong evacuant used to treat severe poisoning."
=======
/obj/item/reagent_containers/pill/carthatoline
	name = REAGENT_CARTHATOLINE + " (15u)"
	desc = REAGENT_CARTHATOLINE + " is strong evacuant used to treat severe poisoning."
>>>>>>> fd5d9267ff ([MIRROR] Converts gas, ore, plants and reagent strings to defines (#9611))
	icon_state = "pill4"

/obj/item/weapon/reagent_containers/pill/carthatoline/Initialize()
	. = ..()
	reagents.add_reagent(REAGENT_ID_CARTHATOLINE, 15)
	color = reagents.get_color()

<<<<<<< HEAD
/obj/item/weapon/reagent_containers/pill/alkysine
	name = "Alkysine (10u)"
	desc = "Alkysine is a drug used to lessen the damage to neurological tissue after a catastrophic injury. Can heal brain tissue."
=======
/obj/item/reagent_containers/pill/alkysine
	name = REAGENT_ALKYSINE + " (10u)"
	desc = REAGENT_ALKYSINE + " is a drug used to lessen the damage to neurological tissue after a catastrophic injury. Can heal brain tissue."
>>>>>>> fd5d9267ff ([MIRROR] Converts gas, ore, plants and reagent strings to defines (#9611))
	icon_state = "pill3"

/obj/item/weapon/reagent_containers/pill/alkysine/Initialize()
	. = ..()
	reagents.add_reagent(REAGENT_ID_ALKYSINE, 10)
	color = reagents.get_color()

<<<<<<< HEAD
/obj/item/weapon/reagent_containers/pill/imidazoline
	name = "Imidazoline (15u)"
=======
/obj/item/reagent_containers/pill/imidazoline
	name = REAGENT_IMIDAZOLINE + " (15u)"
>>>>>>> fd5d9267ff ([MIRROR] Converts gas, ore, plants and reagent strings to defines (#9611))
	desc = "Heals eye damage."
	icon_state = "pill3"

/obj/item/weapon/reagent_containers/pill/imidazoline/Initialize()
	. = ..()
	reagents.add_reagent(REAGENT_ID_IMIDAZOLINE, 15)
	color = reagents.get_color()

<<<<<<< HEAD
/obj/item/weapon/reagent_containers/pill/osteodaxon
	name = "Osteodaxon (25u)"
=======
/obj/item/reagent_containers/pill/osteodaxon
	name = REAGENT_OSTEODAXON + " (25u)"
>>>>>>> fd5d9267ff ([MIRROR] Converts gas, ore, plants and reagent strings to defines (#9611))
	desc = "An experimental drug used to heal bone fractures."
	icon_state = "pill2"

/obj/item/weapon/reagent_containers/pill/osteodaxon/Initialize()
	. = ..()
	reagents.add_reagent(REAGENT_ID_OSTEODAXON, 15)
	reagents.add_reagent(REAGENT_ID_INAPROVALINE, 10)
	color = reagents.get_color()

<<<<<<< HEAD
/obj/item/weapon/reagent_containers/pill/myelamine
	name = "Myelamine (25u)"
=======
/obj/item/reagent_containers/pill/myelamine
	name = REAGENT_MYELAMINE + " (25u)"
>>>>>>> fd5d9267ff ([MIRROR] Converts gas, ore, plants and reagent strings to defines (#9611))
	desc = "Used to rapidly clot internal hemorrhages by increasing the effectiveness of platelets."
	icon_state = "pill1"

/obj/item/weapon/reagent_containers/pill/myelamine/Initialize()
	. = ..()
	reagents.add_reagent(REAGENT_ID_MYELAMINE, 15)
	reagents.add_reagent(REAGENT_ID_INAPROVALINE, 10)
	color = reagents.get_color()

<<<<<<< HEAD
/obj/item/weapon/reagent_containers/pill/hyronalin
	name = "Hyronalin (15u)"
	desc = "Hyronalin is a medicinal drug used to counter the effect of radiation poisoning."
=======
/obj/item/reagent_containers/pill/hyronalin
	name = REAGENT_HYRONALIN + " (15u)"
	desc = REAGENT_HYRONALIN + " is a medicinal drug used to counter the effect of radiation poisoning."
>>>>>>> fd5d9267ff ([MIRROR] Converts gas, ore, plants and reagent strings to defines (#9611))
	icon_state = "pill4"

/obj/item/weapon/reagent_containers/pill/hyronalin/Initialize()
	. = ..()
	reagents.add_reagent(REAGENT_ID_HYRONALIN, 15)
	color = reagents.get_color()

<<<<<<< HEAD
/obj/item/weapon/reagent_containers/pill/arithrazine
	name = "Arithrazine (5u)"
	desc = "Arithrazine is an unstable medication used for the most extreme cases of radiation poisoning."
=======
/obj/item/reagent_containers/pill/arithrazine
	name = REAGENT_ARITHRAZINE + " (5u)"
	desc = REAGENT_ARITHRAZINE + " is an unstable medication used for the most extreme cases of radiation poisoning."
>>>>>>> fd5d9267ff ([MIRROR] Converts gas, ore, plants and reagent strings to defines (#9611))
	icon_state = "pill2"

/obj/item/weapon/reagent_containers/pill/arithrazine/Initialize()
	. = ..()
	reagents.add_reagent(REAGENT_ID_ARITHRAZINE, 5)
	color = reagents.get_color()

<<<<<<< HEAD
/obj/item/weapon/reagent_containers/pill/corophizine
	name = "Corophizine (5u)"
=======
/obj/item/reagent_containers/pill/corophizine
	name = REAGENT_COROPHIZINE + " (5u)"
>>>>>>> fd5d9267ff ([MIRROR] Converts gas, ore, plants and reagent strings to defines (#9611))
	desc = "A wide-spectrum antibiotic drug. Powerful and uncomfortable in equal doses."
	icon_state = "pill2"

/obj/item/weapon/reagent_containers/pill/corophizine/Initialize()
	. = ..()
	reagents.add_reagent(REAGENT_ID_COROPHIZINE, 5)
	color = reagents.get_color()

<<<<<<< HEAD
/obj/item/weapon/reagent_containers/pill/vermicetol
	name = "Vermicetol (15u)"
=======
/obj/item/reagent_containers/pill/vermicetol
	name = REAGENT_VERMICETOL + " (15u)"
>>>>>>> fd5d9267ff ([MIRROR] Converts gas, ore, plants and reagent strings to defines (#9611))
	desc = "An extremely potent drug to treat physical injuries."
	icon_state = "pill1"

/obj/item/weapon/reagent_containers/pill/vermicetol/Initialize()
	. = ..()
	reagents.add_reagent(REAGENT_ID_VERMICETOL, 15)
	color = reagents.get_color()

<<<<<<< HEAD
/obj/item/weapon/reagent_containers/pill/healing_nanites
	name = "Healing nanites (30u)"
=======
/obj/item/reagent_containers/pill/healing_nanites
	name = REAGENT_HEALINGNANITES + " (30u)"
>>>>>>> fd5d9267ff ([MIRROR] Converts gas, ore, plants and reagent strings to defines (#9611))
	desc = "Miniature medical robots that swiftly restore bodily damage."
	icon_state = "pill1"

/obj/item/weapon/reagent_containers/pill/healing_nanites/Initialize()
	. = ..()
	reagents.add_reagent(REAGENT_ID_HEALINGNANITES, 30)
	color = reagents.get_color()

/*CHOMPStation removal begin
<<<<<<< HEAD
/obj/item/weapon/reagent_containers/pill/sleevingcure
	name = "Vey-Med Resleeving Booster pill" //YW Edit
	desc = "A rare medication provided by Vey-Med that helps counteract negative side effects of using resleeving machinery. Numb tongue before swallowing." //YW Edit
=======
/obj/item/reagent_containers/pill/sleevingcure
	name = REAGENT_SLEEVINGCURE + " (1u)"
	desc = "A rare cure provided by Vey-Med that helps counteract negative side effects of using imperfect resleeving machinery."
>>>>>>> fd5d9267ff ([MIRROR] Converts gas, ore, plants and reagent strings to defines (#9611))
	icon_state = "pill3"

/obj/item/weapon/reagent_containers/pill/sleevingcure/Initialize()
	. = ..()
	reagents.add_reagent(REAGENT_ID_SLEEVINGCURE, 1)
	color = reagents.get_color()
*/ //CHOMPStation removal end

/obj/item/weapon/reagent_containers/pill/airlock
	name = "\'Airlock\' Pill"
	desc = "Neutralizes toxins and provides a mild analgesic effect."
	icon_state = "pill2"

/obj/item/weapon/reagent_containers/pill/airlock/New()
	..()
	reagents.add_reagent(REAGENT_ID_ANTITOXIN, 15)
	reagents.add_reagent(REAGENT_ID_PARACETAMOL, 5)
