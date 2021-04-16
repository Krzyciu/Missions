[player, "AinvPknlMstpSnonWnonDnon_medic4"] call ace_common_fnc_doAnimation;


private _onComplete = {
    player switchMove "";
    (createSimpleObject ["A3\Structures_F\System\ClutterCutter_medium_F.p3d", [0,0,0]]) setPosATL getPosATL player;
};

private _onFailure = {
    player switchMove "";
};

[7,[], _onComplete, _onFailure, "Wyrywanie trawy"] call ace_common_fnc_progressBar;
