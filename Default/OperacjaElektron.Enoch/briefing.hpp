if(_player != player) exitWith {};

/***************************************
               Briefing
****************************************/
// NOTES: CREDITS
_cre = player createDiaryRecord ["diary", ["Credits","
<br/>
Thanks to Alias for his leaks scripts.
<br/><br/>
"]];

// NOTES: ADMINISTRATION
_adm = player createDiaryRecord ["diary", ["Techniczne","
<br/>
Sprzęt macie na sobie.<br/>
Interakcje pod menu interakcji - rozglądajcie się za nimi szczególnie w kompleksie. Bez nich nie będziecie w stanie popchnąć akcji dalej.<br/>
Wejście do kompleksu oznaczone czerwoną strzałką, na której jest interakcja.<br/>

"]];

// NOTES: EXECUTION
_exe = player createDiaryRecord ["diary", ["Wykonanie","
<br/>
Przedostać się niezauważenie do kompleksu rakietowego.<br/>
Wysadzić podziemne instalacje.<br/>
Wydostać się do punktu ewakuacji w koordynatach 123-088.<br/>

<br/><br/><br/><br/>
Niestety mamy spory problem. W opuszczonej fabryce Siła znajdują się pozycje p-lot. Dopóki ich nie wyeliminujemy nasze wsparcie lotnicze będzie musiało trzymać się z daleka.<br/><br/>
Niebyłby to problem, gdyby nie to że prawdopodobnie postawi to w stan gotowości całe siły wroga w rejonie.<br/><br/>
Jednak bez zniszczenia ich nie będziemy w stanie przejąć głównego kompleksu rakietowego.
<br/>
"]];


// NOTES: SITUATION
_sit = player createDiaryRecord ["diary", ["Sytuacja","
<br/>
Liwonia po nawiązaniu stosunków dyplomatycznych z Rosją zainwestowała w systemy rakiet dalekiego zasięgu. Na terenie Nadboru rozlokowano jeden z kompeleksów. W jego zasięgu znajduje się 37% naszego kraju.<br/>
Po sierpniowych prostestach na Białorusi i interwencji krajów NATO, która spotkała się ze sprzeciwem Liwonii oraz Rosji, pogorszyły się stosunki między naszymi krajami.<br/>
Na granicy regularnie dochodzi do prowokacji ze strony Liwonii. Wywiad uzyskał dostęp do informacji, według których Rosja wraz z Liwonią mogą próbować zastosować metody jak na Ukrainie w 2014.<br/>
Dwa dni temu w pobliżu Elektrowni Jądrowej Żaronowiec przejęto odziały Liwońskiego Specnazu. Prawdopodobnie miały za zadanie uszkodzić elektrownie.<br/>
W odpowiedzi na te działania podjęto decyzje o zniszczeniu Liwońskich instalacji.<br/><br/>
Akcja nosi kryptonim Operacja Elektron.
<br/>
<br/>
"]];
