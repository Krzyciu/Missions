if(_player != player) exitWith {};

/***************************************
               Briefing
****************************************/
// NOTES: ADMINISTRATION
_adm = player createDiaryRecord ["diary", ["Techniczne","
<br/>
Sprzęt macie na sobie.<br/><br/>
Interakcje pod menu interakcji.<br/><br/>
Uzupełnianie amunicji w samolocie za pomocą interakcji na warsztacie.<br/><br/>
"]];

// NOTES: EXECUTION
_exe = player createDiaryRecord ["diary", ["Wykonanie","
<br/>
Zadania zostaną przedstawione przez dowódcę w czasie odprawy na lotniskowcu.
<br/><br/>
Nie bawimy się w zajmowanie każdego domku. Liczy się czas i element zaskoczenia.
<br/>
"]];


// NOTES: SITUATION
_sit = player createDiaryRecord ["diary", ["Sytuacja","
<br/>
2 kwietnia 1982 Argentyńska marynarka wojenna z tysiącem żołnierzy wylądowała na Malwinach. Siły brytyjskie znajdujące się na wyspie (57 Królewskich Marines, 11 marynarzy oraz do 40 żołnierzy obrony terytorialnej i ochotników) broniły się zaciekle, lecz daremnie.<br/><br/>
Po krótkotrwałej wymianie ognia gubernator Rex Hunt rozkazał im złożyć broń. Siły marines oraz brytyjski gubernator odleciały do Montevideo, stolicy Urugwaju. Wieść o zajęciu Falklandów dotarła do Wielkiej Brytanii w godzinach popołudniowych.<br/><br/>
Decyzję o odbiciu wysp podjęto tego samego dnia o godzinie 19.30.
<br/>
<br/>
"]];

_rad = player createDiaryRecord ["diary", ["Radia","
<br/>
<img width='250' image='data\radia.jpg' /><br />
<br/>
"]];

_wea = player createDiaryRecord ["diary", ["Prognoza Pogody","
<br/>
Czas prognozy: 1h30min
<br/>
Czas: x2
<br/>
Zachmurzenie:75% Oczekiwana zmiana na 50%
<br/>
Zamglenie:35% Oczekiwana zmiana na 10%
<br/>
Opady:50% Oczekiwana zmiana na 10%
<br/>
Temperatura:7°C Oczekiwana zmiana na 12°C 
<br/>
<br/>
"]];
