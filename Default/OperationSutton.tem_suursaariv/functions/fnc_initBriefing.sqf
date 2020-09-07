
//Wait 2 seconds. This is NEEDED else it won't work properly on restart (scripts take too much time to get initialized)
waituntil {!isnil "bis_fnc_init"};

//include both briefings and tools
#include "fnc_brief.sqf";

// - First Briefing -

[ _timelineA, 0, nil, allMapMarkers, ((getMissionLayerEntities "showAtEnd") select 1), "BIS_mrkh_Zoom_0"] spawn BIS_fnc_animatedBriefing;

//Disable map textures
//ctrlActivate ( ( findDisplay 12 ) displayCtrl 107 );

//Wait for timeline to initialize and set eventTime_playing to true
Sleep 1;

//Wait until timeline is over
waitUntil{!(missionNamespace getVariable ["BIS_fnc_eventTimeline_playing", true]);};
//Give the FSM time to teleport the player to its correct position
sleep 1;
