_situation = _this select 0;

switch (_situation) do {
  case "Entry":
    {
      [dome, 1, 1] call BIS_fnc_Door;
      [water_1] spawn Krzyc_fnc_waterLeak;
      sleep 0.7;
      lamp_1 say2D "spark";
      sleep 0.6;
          {
          _x setDamage 1;
          } forEach ((getMissionLayerEntities "Lamps") select 0);
      sleep 2;
          {
          sleep (random 1);
          _x setDamage 0;
          [_x,2] spawn Krzyc_fnc_setLamp;
          } forEach ((getMissionLayerEntities "Lamps") select 0);
      sleep 15;
      [gas_1,0,0,[1,1,1]]  spawn Krzyc_fnc_gasLeak;
      sleep 45;
      {deleteVehicle _x} forEach [water_1,gas_1];
  };
  case "Room_1":
    {
      [gas_2,-4,0,[1,1,1]]  spawn Krzyc_fnc_gasLeak;
      lampeczka setDamage 0;
      sleep 30;
      deleteVehicle gas_2;
    };
  case "Room_2":
  {
    [gas_3,-4,0,[1,1,1]]  spawn Krzyc_fnc_gasLeak;
    [gas_4,-4,0,[1,1,1]]  spawn Krzyc_fnc_gasLeak;
    [test_1, "Acts_CivilInjuredChest_1", 2, false] call ace_common_fnc_doAnimation;
    [test_2, "Acts_CivilInjuredHead_1", 2, false] call ace_common_fnc_doAnimation;
    sleep 15;
    test_1 setDamage 1;
    sleep 8;
    test_2 setDamage 1;
    sleep 5;
    {deleteVehicle _x} forEach [gas_3,gas_4];
  };
};
