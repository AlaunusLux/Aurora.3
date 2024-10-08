/*
	THIS IS A LEGACY FILE, DO NOT ADD ONTOP OF THIS
	USE code\__DEFINES\subsystems.dm AND THE APPROPRIATE DEF NAMES
	THAT ARE PRESENT THERE
*/

#define SS_INIT_CARGO       13	// Random warehouse generation. Runs after SSatoms because it assumes objects are initialized when it runs.
#define SS_INIT_PIPENET     12	// Initial pipenet build.
#define SS_INIT_NIGHT       9	// Nightmode controller. Will trigger lighting updates.
#define SS_INIT_AO          6	// Wall AO neighbour build.
#define SS_INIT_SUNLIGHT    1	// Sunlight setup. Creates lots of lighting & SSzcopy updates.
#define SS_INIT_XENOARCH   -2   // Xenoarch is this far below because it can infinite loop if placed in SS_INIT_MISC as it was before, due to some subsystems spawning stuff there.
#define SS_INIT_HOLOMAP    -4   // Minimap subsystem. Should be initialized after all maps, away sites, ships, planets, etc.

// Something to remember when setting priorities: SS_TICKER runs before Normal, which runs before SS_BACKGROUND.
// Each group has its own priority bracket.
// SS_BACKGROUND handles high server load differently than Normal and SS_TICKER do.

// Priorities are a weight that controls how much of the BYOND tick the subsystem will be allowed to use. 50 is the default, so a subsystem with a priority of 100 would
//  be allocated twice the amount of runtime as normal, and 25 would get half the amount.

// SS_TICKER
#define SS_PRIORITY_OVERLAY   100	// Applies overlays. May cause overlay pop-in if it gets behind.
//#define FIRE_PRIORITY_DEFAULT  50	// This is defined somewhere else.
#define SS_PRIORITY_TIMER      20	// Timed event scheduling. This is important.
#define SS_PRIORITY_PROFILE    15
#define SS_PRIORITY_OVERMAP    12   // Handles overmap processing. Keeps things smooth during highpop, ideally.
#define SS_PRIORITY_SMOOTHING  10	// Smooth turf generation.
#define SS_PRIORITY_ORBIT       5	// Orbit datum updates.
#define SS_PRIORITY_ICON_UPDATE 5	// Queued icon updates. Mostly used by APCs and tables.

// Normal
#define SS_PRIORITY_TICKER     100	// Gameticker.
//#define FIRE_PRIORITY_DEFAULT   50	// This is defined somewhere else.
#define SS_PRIORITY_AIR         40	// ZAS processing.
#define SS_PRIORITY_STATPANELS  25  // Statpanels.
#define SS_PRIORITY_LIGHTING    25	// Queued lighting engine updates.
#define SS_PRIORITY_MACHINERY   25	// Machinery + powernet ticks.
#define SS_PRIORITY_NANOUI      25	// UI updates.
#define SS_PRIORITY_ELECTRONICS 20	// Integrated Electronics processing.
#define SS_PRIORITY_CALAMITY    20	// Singularity, Tesla, Nar'sie, blob, etc.
#define SS_PRIORITY_EVENT       20
#define SS_PRIORITY_DISEASE     20	// Disease ticks.
#define SS_PRIORITY_RADIATION   20  // Radiation processing and cache updates.
#define SS_PRIORITY_ALARMS      20
#define SS_PRIORITY_PLANTS      20	// Spreading plant effects.
#define SS_PRIORITY_EFFECTS     20	// New-style effects manager. Timing of effects may be off if this gets too far behind.
#define SS_PRIORITY_CHEMISTRY   10	// Multi-tick chemical reactions.
#define SS_PRIORITY_SHUTTLE     10	// Shuttle movement.
#define SS_PRIORITY_WEATHER     10  // Weather processing.
#define SS_PRIORITY_AIRFLOW     10	// Handles object movement due to ZAS airflow.
#define SS_PRIORITY_ZCOPY       10	// Z-mimic icon generation/updates.
#define SS_PRIORITY_ARRIVALS    10	// Centcomm arrivals shuttle auto-launch. Usually asleep.


// SS_BACKGROUND
//#define FIRE_PRIORITY_DEFAULT     50	// This is defined somewhere else.
#define SS_PRIORITY_PSYCHICS      30
#define SS_PRIORITY_EVAC          30   // Processes the evac controller.
#define SS_PRIORITY_EXPLOSIVES    20	// TODO: MOVE TO SS_TICKER
#define SS_PRIORITY_DISPOSALS     20	// Disposal holder movement.
#define SS_PRIORITY_MODIFIER      10
#define SS_PRIORITY_NIGHT         10	// Nightmode.
#define SS_PRIORITY_STATISTICS    10	// Player population polling & AFK kick.
#define SS_PRIORITY_SUN           10	// Sun movement & Solar tracking.
#define SS_PRIORITY_GARBAGE        5	// Garbage collection.

// SS runlevels
#define RUNLEVEL_INIT		0
#define RUNLEVEL_LOBBY		1
#define RUNLEVEL_SETUP		2
#define RUNLEVEL_GAME 		4
#define RUNLEVEL_POSTGAME 	8

#define RUNLEVELS_DEFAULT (RUNLEVEL_SETUP | RUNLEVEL_GAME | RUNLEVEL_POSTGAME)
#define RUNLEVELS_PLAYING (RUNLEVEL_GAME | RUNLEVEL_POSTGAME)
