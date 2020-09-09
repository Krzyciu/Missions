_password_tablet = with uiNamespace do {ctrlText (findDisplay 1984 displayCtrl 1400);};
_password_keycard = with uiNamespace do {ctrlText (findDisplay 2984 displayCtrl 3400);};
private _switcher = _this select 1;
switch (_switcher) do{
	case "jedynka":
		{if (_password_tablet isEqualTo Krzyc_password) then
		{
			playSound "pass_ok";
			[[gate_1],Krzyc_fnc_gate] remoteExec ["spawn",2];
			[[gate_2],Krzyc_fnc_gate] remoteExec ["spawn",2];
			closeDialog 0;
		[tablet, 0 ,["ACE_MainActions", "actionB"]] remoteExecCall ["ace_interact_menu_fnc_removeActionFromObject", 0, true];
		} else
	{
			playSound "pass_wrong";
		};
	};
	case "dwojka":
	{
		if (_password_keycard isEqualTo Krzyc_Keycard) then
		{
			playSound "pass_ok";
			[[gate_3],Krzyc_fnc_gate] remoteExec ["spawn",2];
			closeDialog 0;
			[tablet_3, 0 ,["ACE_MainActions", "actionV"]] remoteExecCall ["ace_interact_menu_fnc_removeActionFromObject", 0, true];
			} else
		{
				playSound "pass_wrong";
			};
		};
};
