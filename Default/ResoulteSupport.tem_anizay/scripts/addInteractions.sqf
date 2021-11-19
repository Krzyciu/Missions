#include "script_component.hpp"

// Bomb defusal interactions

[
  "plp_ct_TravelBagRed",
  0,
  [],
  [QGVAR(prepDefuse), LLSTRING(Action_PrepDefuse), "", {
    params ["_satchel"];
    [16, _satchel, {
      params ["_satchel"];
      _satchel setVariable [QGVAR(satchelPreped), true, true];
      hint parseText LLSTRING(Action_PrepDefuse_Success);
    }, {}, LLSTRING(Action_PrepDefuse_Progress)] call ACEFUNC(common,progressBar);
  }, {
    !(_target getVariable [QGVAR(satchelPreped), false])
  }, {}, [], [0,0,0], 10] call ACEFUNC(interact_menu,createAction)
] call ACEFUNC(interact_menu,addActionToClass);

[
  "plp_ct_TravelBagRed",
  0,
  [],
  [QGVAR(prepBoard), LLSTRING(Action_PrepBoard), "", {
    params ["_satchel"];
    [5, _satchel, {
      params ["_satchel"];
      _satchel setVariable [QGVAR(boardPreped), true, true];
      hint parseText LLSTRING(Action_PrepBoard_Success);
    }, {}, LLSTRING(Action_PrepBoard_Progress)] call ACEFUNC(common,progressBar);
  }, {
    (_target getVariable [QGVAR(satchelPreped), false]) &&
    {!(_target getVariable [QGVAR(boardPreped), false])}
  }, {}, [], [0,0,0], 10] call ACEFUNC(interact_menu,createAction)
] call ACEFUNC(interact_menu,addActionToClass);

[
  "plp_ct_TravelBagRed",
  0,
  [],
  [QGVAR(disarmBoard), LLSTRING(Action_DisarmBoard), "", {
    params ["_satchel"];
    _satchel call FUNC(boardOpen);
  }, {
    (_target getVariable [QGVAR(boardPreped), false]) &&
    {!(_target getVariable [QGVAR(boardDisarmed), false])} &&
    {!(_target getVariable [QGVAR(boardFailed), false])}
  }, {}, [], [0,0,0], 10] call ACEFUNC(interact_menu,createAction)
] call ACEFUNC(interact_menu,addActionToClass);

// Rescue from wreck
[
  wreck,
  0,
  [],
  [QGVAR(rescueCrew), LLSTRING(Action_rescueCrew), "", {
    [player, "AinvPknlMstpSnonWnonDr_medic5", 0] call ACEFUNC(common,doAnimation);
    [
      30,
      [0],
      {
          crew_1 setPosASL getPosASL wreck_proxy;
          ["high", false, crew_1] spawn FUNC(damageUnit);
          deleteVehicle wreck;
      },
      {
          hint "Przerwano wycinanie"
      },
      LLSTRING(Action_rescueCrewBar)
    ] call ACEFUNC(common,progressBar);
  },
  {[player, "ACE_wirecutter"] call ACEFUNC(common,hasItem)}, {}, [], [0,0,0], 10] call ACEFUNC(interact_menu,createAction)
] call ACEFUNC(interact_menu,addActionToObject);
