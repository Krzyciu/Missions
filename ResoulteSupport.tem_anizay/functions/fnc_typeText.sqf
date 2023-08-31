#include "script_component.hpp"
/*
    Author: Wyqer, veteran29, Krzyciu
*/


#define DELAY_CHARACTER         0.1
#define DELAY_LINE              1.3
#define DEFAULT_LINE_FORMAT     "<t align = 'left' shadow = '1' color='#ffffff' size = '0.8'>%1</t><br/>"

params [
    ["_lines", [], [[]]],
    ["_posX", 0, [0, []]],
    ["_posY", 0, [0, []]],
    ["_rootFormat", "<t font='RobotoCondensed'>%1</t>", [""]]
];

private _currentText = "";
// Print line by line
private ["_lettersArray", "_currentLineText", "_formattedLineText"];
{
    _x params [
        ["_lineText", "", [""]],
        ["_lineFormat", DEFAULT_LINE_FORMAT, [""]],
        ["_waitTime", 1, [1]]
    ];

    _lettersArray = (toArray _lineText) apply {toString [_x]};
    _currentLineText = "";
    _formattedLineText = "";

    // Print letter by letter
    {
        _currentLineText = _currentLineText + _x;
        _formattedLineText = format [_lineFormat, _currentLineText];

        _formattedText = format [_rootFormat, _currentText + _formattedLineText];
        [_formattedText, _posX, _posY, 5, 0, 0, 90] spawn BIS_fnc_dynamicText;

        playSound "click";playSound "click";

        sleep DELAY_CHARACTER;
    } forEach _lettersArray;

    _currentText = _currentText + _formattedLineText;

    sleep (DELAY_LINE + _waitTime);

} forEach _lines;

sleep 2;

//clean the screen
["", _posX, _posY, 8, 8, 0, 90] spawn BIS_fnc_dynamicText;
