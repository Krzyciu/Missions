/*
 * Briefing
 * Dokumentacja: https://community.bistudio.com/wiki/createDiaryRecord
 */

/*
    INFO: Jeśli chcesz użyć stringtable w briefingu, pamiętaj aby zamienić:
    & na &amp;
    < na &lt;
    > na &gt;
    " na &quot;
    ' na &apos;

    Wtedy możesz smiało użyć stringtable (przykład w stringtable.xml) i zamienić wpis
    briefingu na "player createDiaryRecord ["Diary", ["Briefing", LLSTRING(Briefing)]];"
    "
*/

private _adm = player createDiaryRecord ["diary", ["Techniczne","
<br/>
Interakcje pod menu interakcji.<br/>
Uważnie czytać znaleziony intel.<br/>
"]];

// NOTES: SITUATION
private _sit = player createDiaryRecord ["diary", ["Sytuacja","
Susze spowodowały dotkliwe braki wody na afgańskiej prowincji. Wielu ludzi umiera z pragnienia, szerzy się dyzenteria, brakuje podstawowych środków opieki medycznej.
W tym trudnym czasie, do bazy Landay dotarła właśnie pierwsza zmiana Altańskiego Kontygentu Wojskowego. Wyruszą do FOBu Nauzad, gdzie zluzują stacjonujące tam jednostki Australijskie.<br/><br/>
Plutonowi przydzielono dodatkowo zadanie rozwiezienia wody do pobliskich, najbardziej dotkniętych suszą miejscowości.
Dostarczycie także medykamenty lokalnemu szpitalowi oraz uzupełnicie wyposażenie ANP na jednym z ich posterunków.
Mamy potwierdzone zagrożenie IED w przynajmniej 3 miejscach - wiadomości pochodzą od lokalnych informatorów, także nie mamy 100% pewności.<br/>
Do wsparcia waszych sił przydzielono sekcje saperską z US Army. W rejonie działań operuje mieszany Niemiecko-Włoski zespół CSAR - będą do waszej dyspozycji w razie potrzeby.
"]];

private _8lnr = player createDiaryRecord ["diary", ["8 Liner","
<br/>
<img width='365' image='data\8liner.jpg' /><br />
"]];

player createDiarySubject [QGVAR(boardManual), LLSTRING(BoardManual)];
player createDiaryRecord [QGVAR(boardManual), ["L10|5L2II|2RT|GL", LLSTRING(BoardManual_1)]];
player createDiaryRecord [QGVAR(boardManual), ["L10|5L2II|2RT|G7", LLSTRING(BoardManual_2)]];
player createDiaryRecord [QGVAR(boardManual), ["L10|5I2LI|1GB|GL", LLSTRING(BoardManual_3)]];
player createDiaryRecord [QGVAR(boardManual), ["L11|5I2LI|1GB|GL", LLSTRING(BoardManual_4)]];
player createDiaryRecord [QGVAR(boardManual), ["L11|II2LI|1RB|LI", LLSTRING(BoardManual_5)]];
player createDiaryRecord [QGVAR(boardManual), ["L11|II2LI|3gB|LI", LLSTRING(BoardManual_6)]];
player createDiaryRecord [QGVAR(boardManual), ["L1B|II2LI|2GB|LL", LLSTRING(BoardManual_7)]];
player createDiaryRecord [QGVAR(boardManual), ["L1L|II2LL|3WB|I1", LLSTRING(BoardManual_8)]];
player createDiaryRecord [QGVAR(boardManual), ["L10|II2LL|3RT|I1", LLSTRING(BoardManual_9)]];
player createDiaryRecord [QGVAR(boardManual), ["L10|I217|2BT|IL", LLSTRING(BoardManual_10)]];
