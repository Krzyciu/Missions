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
