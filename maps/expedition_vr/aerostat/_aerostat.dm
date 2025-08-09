#include "../../submaps/pois_vr/aerostat/virgo2.dm"

/obj/effect/overmap/visitable/sector/virgo2
	initial_generic_waypoints = list("aerostat_west","aerostat_east","aerostat_south","aerostat_northwest","aerostat_northeast")

// -- Datums -- //

/datum/shuttle/autodock/ferry/aerostat
	name = "Aerostat Ferry"
	shuttle_area = /area/shuttle/aerostat
	warmup_time = 10	//want some warmup time so people can cancel.
	landmark_station = "aerostat_east"
	landmark_offsite = "aerostat_surface"

/datum/random_map/noise/ore/virgo2/check_map_sanity()
	return 1 //Totally random, but probably beneficial.

/datum/random_map/noise/ore/virgo2/apply_to_turf(var/x,var/y)			//Same as normal + Rutile

	var/tx = ((origin_x-1)+x)*chunk_size
	var/ty = ((origin_y-1)+y)*chunk_size

	for(var/i=0,i<chunk_size,i++)
		for(var/j=0,j<chunk_size,j++)
			var/turf/simulated/T = locate(tx+j, ty+i, origin_z)
			if(!istype(T) || !T.has_resources)
				continue
			if(!priority_process) sleep(-1)
			T.resources = list()
			T.resources[ORE_SAND] = rand(3,5)
			T.resources[ORE_CARBON] = rand(3,5)

			var/current_cell = map[get_map_cell(x,y)]
			if(current_cell < rare_val)      // Surface metals.
				T.resources[ORE_HEMATITE] = rand(RESOURCE_HIGH_MIN, RESOURCE_HIGH_MAX)
				T.resources[ORE_GOLD] =     rand(RESOURCE_LOW_MIN,  RESOURCE_LOW_MAX)
				T.resources[ORE_SILVER] =   rand(RESOURCE_LOW_MIN,  RESOURCE_LOW_MAX)
				T.resources[ORE_URANIUM] =  rand(RESOURCE_LOW_MIN,  RESOURCE_LOW_MAX)
				T.resources[ORE_MARBLE] =   rand(RESOURCE_LOW_MIN, RESOURCE_MID_MAX)
				T.resources[ORE_DIAMOND] =  0
				T.resources[ORE_PHORON] =   0
				T.resources[ORE_PLATINUM] =   0
				T.resources[ORE_MHYDROGEN] = 0
				T.resources[ORE_VERDANTIUM] = 0
				T.resources[ORE_LEAD]     = 0
				//T.resources[ORE_COPPER] =   rand(RESOURCE_MID_MIN, RESOURCE_HIGH_MAX)
				//T.resources[ORE_TIN] =      rand(RESOURCE_LOW_MIN, RESOURCE_MID_MAX)
				//T.resources[ORE_BAUXITE] =  rand(RESOURCE_LOW_MIN, RESOURCE_LOW_MAX)
				T.resources[ORE_RUTILE] =   rand(RESOURCE_LOW_MIN, RESOURCE_LOW_MAX)
				//T.resources[ORE_VOPAL] = 0
				//T.resources[ORE_QUARTZ] = 0
				//T.resources[ORE_PAINITE] = 0
			else if(current_cell < deep_val) // Rare metals.
				T.resources[ORE_GOLD] =     rand(RESOURCE_MID_MIN,  RESOURCE_MID_MAX)
				T.resources[ORE_SILVER] =   rand(RESOURCE_MID_MIN,  RESOURCE_MID_MAX)
				T.resources[ORE_URANIUM] =  rand(RESOURCE_MID_MIN,  RESOURCE_MID_MAX)
				T.resources[ORE_PHORON] =   rand(RESOURCE_MID_MIN,  RESOURCE_MID_MAX)
				T.resources[ORE_PLATINUM] =   rand(RESOURCE_MID_MIN,  RESOURCE_MID_MAX)
				T.resources[ORE_VERDANTIUM] = rand(RESOURCE_LOW_MIN, RESOURCE_LOW_MAX)
				T.resources[ORE_LEAD] =     rand(RESOURCE_LOW_MIN, RESOURCE_MID_MAX)
				T.resources[ORE_MHYDROGEN] = 0
				T.resources[ORE_DIAMOND] =  0
				T.resources[ORE_HEMATITE] = 0
				T.resources[ORE_MARBLE] =   0
				//T.resources[ORE_COPPER] =   0
				//T.resources[ORE_TIN] =      rand(RESOURCE_MID_MIN, RESOURCE_MID_MAX)
				//T.resources[ORE_BAUXITE] =  0
				T.resources[ORE_RUTILE] =   rand(RESOURCE_MID_MIN, RESOURCE_MID_MAX)
				//T.resources[ORE_VOPAL] = 0
				//T.resources[ORE_QUARTZ] = 0
				//T.resources[ORE_PAINITE] = 0
			else                             // Deep metals.
				T.resources[ORE_URANIUM] =  rand(RESOURCE_LOW_MIN,  RESOURCE_LOW_MAX)
				T.resources[ORE_DIAMOND] =  rand(RESOURCE_LOW_MIN,  RESOURCE_LOW_MAX)
				T.resources[ORE_VERDANTIUM] = rand(RESOURCE_LOW_MIN, RESOURCE_MID_MAX)
				T.resources[ORE_PHORON] =   rand(RESOURCE_HIGH_MIN, RESOURCE_HIGH_MAX)
				T.resources[ORE_PLATINUM] =   rand(RESOURCE_HIGH_MIN, RESOURCE_HIGH_MAX)
				T.resources[ORE_MHYDROGEN] = rand(RESOURCE_MID_MIN,  RESOURCE_MID_MAX)
				T.resources[ORE_MARBLE] =   rand(RESOURCE_MID_MIN, RESOURCE_HIGH_MAX)
				T.resources[ORE_LEAD] =     rand(RESOURCE_LOW_MIN, RESOURCE_HIGH_MAX)
				T.resources[ORE_HEMATITE] = 0
				T.resources[ORE_GOLD] =     0
				T.resources[ORE_SILVER] =   0
				//T.resources[ORE_COPPER] =   0
				//T.resources[ORE_TIN] =      0
				//T.resources[ORE_BAUXITE] =  0
				T.resources[ORE_RUTILE] =   rand(RESOURCE_HIGH_MIN, RESOURCE_HIGH_MAX)
				//T.resources[ORE_VOPAL] = 0
				//T.resources[ORE_QUARTZ] = 0
				//T.resources[ORE_PAINITE] = 0
	return

// -- Turfs -- //

<<<<<<< HEAD
//Atmosphere properties
#define VIRGO2_ONE_ATMOSPHERE	312.1 //kPa
#define VIRGO2_AVG_TEMP			612 //kelvin

#define VIRGO2_PER_N2		0.10 //percent
#define VIRGO2_PER_O2		0.03
#define VIRGO2_PER_N2O		0.00 //Currently no capacity to 'start' a turf with this. See turf.dm
#define VIRGO2_PER_CO2		0.87
#define VIRGO2_PER_PHORON	0.00

//Math only beyond this point
#define VIRGO2_MOL_PER_TURF		(VIRGO2_ONE_ATMOSPHERE*CELL_VOLUME/(VIRGO2_AVG_TEMP*R_IDEAL_GAS_EQUATION))
#define VIRGO2_MOL_N2			(VIRGO2_MOL_PER_TURF * VIRGO2_PER_N2)
#define VIRGO2_MOL_O2			(VIRGO2_MOL_PER_TURF * VIRGO2_PER_O2)
#define VIRGO2_MOL_N2O			(VIRGO2_MOL_PER_TURF * VIRGO2_PER_N2O)
#define VIRGO2_MOL_CO2			(VIRGO2_MOL_PER_TURF * VIRGO2_PER_CO2)
#define VIRGO2_MOL_PHORON		(VIRGO2_MOL_PER_TURF * VIRGO2_PER_PHORON)

//Turfmakers
#define VIRGO2_SET_ATMOS	nitrogen=VIRGO2_MOL_N2;oxygen=VIRGO2_MOL_O2;carbon_dioxide=VIRGO2_MOL_CO2;phoron=VIRGO2_MOL_PHORON;temperature=VIRGO2_AVG_TEMP
#define VIRGO2_TURF_CREATE(x)	x/virgo2/nitrogen=VIRGO2_MOL_N2;x/virgo2/oxygen=VIRGO2_MOL_O2;x/virgo2/carbon_dioxide=VIRGO2_MOL_CO2;x/virgo2/phoron=VIRGO2_MOL_PHORON;x/virgo2/temperature=VIRGO2_AVG_TEMP;x/virgo2/color="#eacd7c"

/turf/unsimulated/floor/sky/virgo2_sky
	name = "virgo 2 atmosphere"
	desc = "Be careful where you step!"
	color = "#eacd7c"
	VIRGO2_SET_ATMOS

/turf/unsimulated/floor/sky/virgo2_sky/Initialize()
=======
/turf/unsimulated/floor/sky/virgo2_sky/Initialize(mapload)
>>>>>>> 651c8bc1af ([MIRROR] Simultaneous map definitions (#10295))
	skyfall_levels = list(z+1)
	. = ..()

/turf/simulated/mineral/virgo2/make_ore()
	if(mineral)
		return

	var/mineral_name = pickweight(list(ORE_MARBLE = 5, ORE_URANIUM = 5, ORE_PLATINUM = 5, ORE_HEMATITE = 5, ORE_CARBON = 5, ORE_DIAMOND = 5, ORE_GOLD = 5, ORE_SILVER = 5, ORE_LEAD = 5, ORE_VERDANTIUM = 5, ORE_RUTILE = 20))

	if(mineral_name && (mineral_name in GLOB.ore_data))
		mineral = GLOB.ore_data[mineral_name]
		UpdateMineral()
	update_icon()

// -- Areas -- //

/area/offmap/aerostat/surface/explored
	name = "Away Mission - Aerostat Surface (E)"
	icon_state = "explored"
	dynamic_lighting = FALSE // Override

/area/offmap/aerostat/surface/unexplored
	name = "Away Mission - Aerostat Surface (UE)"
	icon_state = "unexplored"
	dynamic_lighting = FALSE // Override
