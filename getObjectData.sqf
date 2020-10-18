_data = [];
{_modelPath = ((getModelInfo _x) select 1);
_posWorld = getPosWorld _x;
_vector = [vectorDir _x, vectorUp _x];
_info = [_modelPath,_posWorld,_vector];
_data = _data + _info;
}
forEach ((getMissionLayerEntities "Ambient") select 0);
copyToClipboard str [_data];
