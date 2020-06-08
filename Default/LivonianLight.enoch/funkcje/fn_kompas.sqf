params [["_show",true,[true,""]]];

//Hide//
if (_show isequalto false) exitwith {
	"RscCompass" cuttext ["","plain"];
	removemissioneventhandler ["loaded",missionnamespace getvariable ["Krzyc_fnc_showHorizontalCompass_loaded",-1]];
};

//Show//
"RscCompass" cutrsc ["RscCompass","plain"];

//Show after load
if (missionnamespace getvariable ["Krzyc_fnc_showHorizontalCompass_loaded",-1] < 0) then {
	missionnamespace setvariable [
		"Krzyc_fnc_showHorizontalCompass_loaded",
		addmissioneventhandler [
			"loaded",
			{
				[] spawn {
					sleep 0.1; //wait otherwise not shown//
					"RscCompass" cutrsc ["RscCompass","plain"];
				};
			}
		]
	];
};
