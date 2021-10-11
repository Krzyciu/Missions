/*
 * Deklaracja dźwięków
 * Dokumentacja: https://community.bistudio.com/wiki/Description.ext#CfgSounds
 */

 class CfgSounds {
     class GVAR(nvg_on) {
     		name = QGVAR(nvgON);
     		sound[] = {"data\sounds\nvgON.ogg", 3, 1, 100};
     		titles[] = {0,""};
     };
     class GVAR(nvg_off) {
         name = QGVAR(nvgOFF);
         sound[] = {"data\sounds\nvgOFF.ogg", 3, 1, 100};
         titles[] = {0, ""};
     };
     class GVAR(beep) {
         name = QGVAR(beep);
         sound[] = {"data\sounds\beep.ogg", 3, 1, 100};
         titles[] = {0, ""};
     };
     class GVAR(prayer) {
         name = QGVAR(prayer);
         sound[] = {"data\sounds\prayer.ogg", 3, 1, 100};
         titles[] = {0, ""};
     };
     class GVAR(scramble) {
         name = QGVAR(scramble);
         sound[] = {"data\sounds\scramble.ogg", 3, 1, 100};
         titles[] = {0, ""};
     };
 };
