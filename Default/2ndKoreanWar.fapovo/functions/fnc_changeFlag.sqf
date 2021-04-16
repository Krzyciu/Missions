params ["_flag"];
[[_flag, 0, ["ACE_MainActions","changeFlag"]],ace_interact_menu_fnc_removeActionFromObject] remoteExec ["call", -2, true];

[_flag, 0,0.5] call BIS_fnc_animateFlag;
waitUntil{sleep 1;flagAnimationPhase _flag == 0;};
player switchmove "AmovPercMstpSrasWrflDnon_SaluteIn";
[_flag,"data\S_Korea.paa"] remoteExec ["setFlagTexture", 2];
[_flag, 1,0.5] call BIS_fnc_animateFlag;
waitUntil{sleep 1.5;flagAnimationPhase _flag == 1;};
player switchmove "";
