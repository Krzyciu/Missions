#define PATH(fncName) functions\fnc##_##fncName.sqf
#define PREP(fncName) Krzyc##_##fnc##_##fncName = compileFinal preprocessFileLineNumbers #PATH(fncName)
PREP(intro);
PREP(talks);
PREP(teleport);
PREP(ambientLabs);
PREP(gasLeak);
PREP(waterLeak);
PREP(setLamp);
PREP(gateOpen);
PREP(password);
PREP(explosions);
PREP(orb);
PREP(blackfishLocal);
PREP(blackfishServer);
