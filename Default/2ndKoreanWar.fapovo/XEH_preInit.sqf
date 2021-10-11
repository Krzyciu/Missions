#define PATH(fncName) functions\fnc##_##fncName.sqf
#define PREP(fncName) Krzyc##_##fnc##_##fncName = compileScript [#PATH(fncName),true];
PREP(intro);
PREP(ammoDrop);
PREP(typeText);
PREP(arty);
PREP(mineDrop);
PREP(rearm);
PREP(vlsFire);
PREP(changeFlag);
PREP(cutGrass);
PREP(tow);
PREP(towRearm);

if (is3DEN) then {
	setTerrainGrid 50;
} else {
  0 spawn {
    private _handle = [{
      ace_map_mapIllumination = false;
      ace_medical_playerDamageThreshold = 6.5;
			ace_medical_statemachine_fatalInjuriesPlayer = 1;
      ace_map_mapShowCursorCoordinates = true;
      ace_map_DefaultChannel = 0;
    }, 0.5, []] call CBA_fnc_addPerFrameHandler;
    sleep 10;
    [_handle] call CBA_fnc_removePerFrameHandler;
  };
};
