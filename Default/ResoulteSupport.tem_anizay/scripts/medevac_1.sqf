#include "script_component.hpp"

{["high", true, _x] spawn FUNC(damageUnit)} forEach [p_1, p_4, p_11, p_12];
{["med", false, _x] spawn FUNC(damageUnit)} forEach [p_2, p_3, p_5, p_6, p_7];
{["low", false, _x] spawn FUNC(damageUnit)} forEach [p_8, p_9, p_10];
