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
Połowa 1974. <br/><br/>
Większość sił USA powoli wraca do kraju. Odpowiedzialność za utrzymanie kontroli zostaje przekazana na ręce ARVN, który niestety nie radzi sobie za dobrze z powierzonym zadaniem - w krótkim czasie siły Północy zdobywają znaczną część terenów Południa.
W Wietnamie pozostaje jeszcze komponent lotniczy oraz siły specjalne, które ewakuują zgromadzone dane oraz niszczą pozostawiony sprzęt, starają się także opóźnić ofensywę NVA.<br/><br/>
W rolę jednego z takich oddziałów wcielicie się wy. Będziecie sabotować linie zaopatrzenia wroga, przecinać komunikację, wysadzać tunele - aby dać czas pozostałym siłom na ewakuację.
Zaczynacie w helikopterze lecącym z południowego lotniska, na którym wysadziliście pozostawiony sprzęt.
"]];
