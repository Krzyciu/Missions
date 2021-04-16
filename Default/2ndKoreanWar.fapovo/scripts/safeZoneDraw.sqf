"marker_def" setMarkerShape "polyline";
"marker_def" setMarkerColor "ColorGuer";
"marker_bord" setMarkerShape "polyline";
"marker_bord" setMarkerColor "ColorBlue";
private _markersDef = [];
private _markersBord = [];
private _return = [];

for "_i" from 0 to 26 do
{
 private _mrk = [('marker_' + (str _i))];
 _markersDef append _mrk;
 _mrk = [];
 };
{_return pushBack (getMarkerPos _x#0);
_return pushBack (getMarkerPos _x#1);}forEach _markersDef;

"marker_def" setMarkerPolyline _return;

_return = [];

for "_i" from 27 to 60 do
{
 private _mrk = [('marker_' + (str _i))];
 _markersBord append _mrk;
 _mrk = [];
 };
{_return pushBack (getMarkerPos _x#0);
_return pushBack (getMarkerPos _x#1);}forEach _markersBord;

"marker_bord" setMarkerPolyline _return;
