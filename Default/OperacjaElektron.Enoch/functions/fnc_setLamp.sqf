params["_object","_value"];

for "_i" from 5 to _value step -1 do
{
	_object setHit [format["light_%1_hitpoint",_i],1];
};
