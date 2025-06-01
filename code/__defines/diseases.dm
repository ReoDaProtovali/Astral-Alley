#define VIRUS_SYMPTOM_LIMIT	6

//Visibility Flags
#define HIDDEN_SCANNER	(1<<0)
#define HIDDEN_PANDEMIC	(1<<1)

//Disease Flags
#define CURABLE				(1<<0)
#define CAN_CARRY			(1<<1)
#define CAN_RESIST			(1<<2)
#define CAN_NOT_POPULATE	(1<<3)

//Spread Flags
<<<<<<< HEAD
#define SPECIAL			(1<<0)
#define NON_CONTAGIOUS	(1<<1)
#define BLOOD			(1<<2)
#define CONTACT_FEET	(1<<3)
#define CONTACT_HANDS	(1<<4)
#define CONTACT_GENERAL	(1<<5)
#define AIRBORNE		(1<<6)
=======
#define DISEASE_SPREAD_SPECIAL			(1<<0)
#define DISEASE_SPREAD_NON_CONTAGIOUS	(1<<1)
#define DISEASE_SPREAD_BLOOD			(1<<2)
#define DISEASE_SPREAD_FLUIDS			(1<<3)
#define DISEASE_SPREAD_CONTACT			(1<<4)
#define DISEASE_SPREAD_AIRBORNE			(1<<5)
#define DISEASE_SPREAD_FALTERED			(1<<6)
>>>>>>> 05b57277bf ([MIRROR] Faltered & Dormant diseases update (#10985))

//Severity Defines
#define NONTHREAT	"No threat"
#define MINOR		"Minor"
#define MEDIUM		"Medium"
#define HARMFUL		"Harmful"
#define DANGEROUS 	"Dangerous!"
#define BIOHAZARD	"BIOHAZARD THREAT!"

<<<<<<< HEAD
#define SYMPTOM_ACTIVATION_PROB 3
=======
//Various Virus Flags
#define NEEDS_ALL_CURES			0x1		/// If a virus requires EVERY cure in the cure list to become cured.
#define SPREAD_DEAD				0x2		/// If a virus spreads to the dead and proceesses in them.
#define INFECT_SYNTHETICS		0x4		/// If a synthetic can be infected with the virus.
#define HAS_TIMER				0x8		/// If the cure timer is currently active.
#define PROCESSING				0x10	/// If stage_act has been called and we are now processing.
#define CARRIER					0x20	/// If we are a carrier for the virus but we will not be affected by it.
#define BYPASSES_IMMUNITY 		0x40	/// If this virus bypasses immunity.
#define DISCOVERED				0x80	/// If applied, this virus will show up on medical HUDs. Automatically set when it reaches mid-stage.
#define DORMANT					0x100	/// If applied, the virus is dormant and will not act or spread.
#define FALTERED				0x200	/// If applied, the virus is faltered and will only spread by intentional injection.

#define EXTRAPOLATOR_RESULT_DISEASES		"extrapolator_result_disease"
#define EXTRAPOLATOR_RESULT_ACT_PRIORITY	"extrapolator_result_action_priority"
#define EXTRAPOLATOR_ACT_PRIORITY_SPECIAL	"extrapolator_action_priority_special"
#define EXTRAPOLATOR_ACT_PRIORITY_ISOLATE	"extrapolator_action_priority_isolate"
#define EXTRAPOLATOR_ACT_ADD_DISEASES(target_list, diseases)\
	do {\
		var/_D = ##diseases;\
		if ((islist(_D) && length(_D)) || istype(_D, /datum/disease)) {	\
			LAZYORASSOCLIST(##target_list, EXTRAPOLATOR_RESULT_DISEASES, _D);\
		}\
	} while(0)
#define EXTRAPOLATOR_ACT_CHECK(target_list, wanted_action_priority) (##target_list[EXTRAPOLATOR_RESULT_ACT_PRIORITY] == ##wanted_action_priority)
#define EXTRAPOLATOR_ACT_SET(target_list, wanted_action_priority) (##target_list[EXTRAPOLATOR_RESULT_ACT_PRIORITY] = ##wanted_action_priority)
>>>>>>> 05b57277bf ([MIRROR] Faltered & Dormant diseases update (#10985))
