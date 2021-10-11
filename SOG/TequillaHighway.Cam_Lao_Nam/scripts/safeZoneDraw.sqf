#include "script_component.hpp"

"marker_bord" setMarkerShape "polyline";
"marker_bord" setMarkerColor "ColorBlue";
private _markersBord = [];
private _return = [];

for "_i" from 1 to 256 do
{
 private _mrk = [('mrk_' + (str _i))];
 _markersBord append _mrk;
 _mrk = [];
 };
{_return pushBack (getMarkerPos _x#0);
_return pushBack (getMarkerPos _x#1);}forEach _markersBord;

"marker_bord" setMarkerPolyline _return;
