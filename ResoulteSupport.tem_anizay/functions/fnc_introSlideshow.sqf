#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Intro slideshow
 */

params ["_display"];

// Prep all slides
for "_i" from 1201 to 1206 do {
  private _slide = _display displayCtrl _i;
  _slide ctrlSetTextColor [1, 1, 1, 1];
  _slide ctrlSetFade 1;
  _slide ctrlCommit 0;
};

// Start slideshow
_display spawn {
  private _slide1 = _this displayCtrl 1201;
  private _slide2 = _this displayCtrl 1202;
  private _slide3 = _this displayCtrl 1203;
  private _slide4 = _this displayCtrl 1204;
  private _slide5 = _this displayCtrl 1205;
  private _slideBlank = _this displayCtrl 1206;

  private _start = diag_tickTime;

  waitUntil {(diag_tickTime - _start) >= 0.1};
  _slideBlank ctrlSetFade 0.9;
  _slideBlank ctrlCommit 0.1;
  waitUntil {(diag_tickTime - _start) >= 0.5};
  _slideBlank ctrlSetFade 1;
  _slideBlank ctrlCommit 0.1;
  waitUntil {(diag_tickTime - _start) >= 1};
  _slideBlank ctrlSetFade 0.9;
  _slideBlank ctrlCommit 0.1;
  waitUntil {(diag_tickTime - _start) >= 1.1};
  _slideBlank ctrlSetFade 1;
  _slideBlank ctrlCommit 0.1;
  waitUntil {(diag_tickTime - _start) >= 1.5};
  _slideBlank ctrlSetFade 0.9;
  _slideBlank ctrlCommit 0.1;
  waitUntil {(diag_tickTime - _start) >= 1.6};
  _slideBlank ctrlSetFade 1;
  _slideBlank ctrlCommit 0.1;

  waitUntil {(diag_tickTime - _start) >= 2.1};
  _slideBlank ctrlSetFade 0.9;
  _slideBlank ctrlCommit 0;
  _slideBlank ctrlSetFade 1;
  _slideBlank ctrlCommit 0.1;
  _slide1 ctrlSetFade 0;
  _slide1 ctrlCommit 0;
  _slide1 ctrlSetPosition [
    safezoneXAbs - (safezoneWAbs * 0.25),
    safezoneY - (safezoneH * 0.25),
    safezoneWAbs * 1.5,
    safezoneH * 1.5
  ];
  _slide1 ctrlCommit 10;

  waitUntil {(diag_tickTime - _start) >= 10};
  _slide1 ctrlSetFade 1;
  _slide1 ctrlCommit 0.1;
  _slide2 ctrlSetFade 0;
  _slide2 ctrlCommit 0.1;

  waitUntil {(diag_tickTime - _start) >= 12};
  _slide2 ctrlSetFade 1;
  _slide2 ctrlCommit 0.1;
  _slide3 ctrlSetFade 0;
  _slide3 ctrlCommit 0.1;

  waitUntil {(diag_tickTime - _start) >= 14};
  _slide3 ctrlSetFade 1;
  _slide3 ctrlCommit 0.1;
  _slide4 ctrlSetFade 0;
  _slide4 ctrlCommit 0.1;

  waitUntil {(diag_tickTime - _start) >= 16};
  _slide4 ctrlSetFade 1;
  _slide4 ctrlCommit 0.1;
  _slide5 ctrlSetFade 0;
  _slide5 ctrlCommit 0;
  _slideBlank ctrlSetFade 0.9;
  _slideBlank ctrlCommit 0;
  _slideBlank ctrlSetFade 1;
  _slideBlank ctrlCommit 0.1;

  waitUntil {(diag_tickTime - _start) >= 18};

  _slide5 ctrlSetFade 1;
  _slide5 ctrlCommit 2.5;

  waitUntil {(diag_tickTime - _start) >= 20};
  titleText ["", "PLAIN", 0.001, false, true];

  missionNamespace setVariable [QGVAR(introSlideshowEnd), true];
};
