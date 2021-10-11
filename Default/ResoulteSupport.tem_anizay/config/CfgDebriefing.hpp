/*
 * Deklaracja zakończeń
 * Dokumentacja: https://community.bistudio.com/wiki/Debriefing
 */

class CfgDebriefing {
    class End1 {
        title = CSTRING(CfgDebriefing_MissonEnd);
        subtitle = CSTRING(CfgDebriefing_AllTasksAccomplished);
        description = CSTRING(CfgDebriefing_MissonEndSuccess);
        pictureBackground = "data\loadscreen.jpg";
        picture = "data\a3c2.paa";
        pictureColor[] = {1,1,1,1};
    };
    class End2 {
        title = CSTRING(CfgDebriefing_MissonEnd);
        subtitle = CSTRING(CfgDebriefing_MissionFailed);
        description = CSTRING(CfgDebriefing_MissonEndFailed);
        pictureBackground = "data\loadscreen.jpg";
        picture = "data\a3c.paa";
        pictureColor[] = {1,1,1,1};
    };

    //Poniższa klasa zostanie wywołana AUTOMATYCZNIE w przypadku gdy wszyscy gracze zginą
    class endDeath {
        title = CSTRING(CfgDebriefing_MissonEnd);
        subtitle = CSTRING(CfgDebriefing_AllUnitsDead);
        description = CSTRING(CfgDebriefing_MissonEndFailed);
        pictureBackground = "";
        picture = "KIA";
        pictureColor[] = {0.6,0.1,0.2,1};
    };
};
