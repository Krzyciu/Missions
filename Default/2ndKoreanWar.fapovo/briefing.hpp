if(_player != player) exitWith {};

/***************************************
               Briefing
****************************************/
private _tech = player createDiaryRecord ["diary", ["Techniczne","
<br/>
Radia krótkie mają tylko dowódcy/sekcyjni.<br/>
Pojazdy nie mają termowizji.<br/>
Celowanie z towa odbywa się za pomocą interakcji z wnętrza pojazdu.<br/>
Amunicje w towie uzupełnia się z zewnątrz, mając w plecaku rakietę do towa.<br/>
Interakcje pod menu interakcji.<br/>
Dowódca Operacji może wezwać jednokrotny zrzut zaopatrzenia za pomocą interakcji.<br/>
Dowódca Operacji może wezwać ostrzał artyleryjski.<br/>
Dodana interakcja na wycięcie trawy wokół swojej postaci.<br/>
Dodana interakcja na zmianę flagi na maszcie.<br/>
"]];


private _sit = player createDiaryRecord ["diary", ["Sytuacja Polityczna","
<br/>
Pierwsze lata po rozejmie z 53' były bardzo burzliwe.<br/>
Do początku lat 60 zbudowano kilometry liń umocnień. Zaminowano kilometry kwadratowe terenu. W potyczkach granicznych zginęło wielu żołnierzy po obu stronach.<br/>
Po śmierci Kim Ir Sena w 1961 roku nastała odwilż. Nastąpiło zbliżenie gospodarcze pomiędzy obiema Koreami. Umożliwiono swobodny przepływ ludności między krajami, zunifikowano sieć energetyczną, rozpoczęto rozbiórkę fortyfikacji po obu stronach granicy. Nastąpił złoty okres rozwoju Korei.<br/>
Niestety sielanka nie mogła trwać wiecznie. W czerwcu 1974 roku premier Korei Północnej Bang Jin-Ho został zamordowany w zamachu bombowym. Z poparciem Chin, władzę w kraju przejął Bing Kwan, który zniweczył ponad 10 lat współpracy krajów.<br/><br/>
W Korei Północnej rozpoczęły się czystki opozycjonistów. Rządzącemu w Korei Południowej dyktatorowi Chun Doo-hwanowi kończył się mandat prezydencki. Pomijając procedury wyborcze wyznacza swojego następcę. Ludność Korei Południowej, która liczyła na pełną demokratyzację kraju wychodzi na ulicę w licznych protestach.<br/>
Do stłumienia protestów zostaje wysłane wojsko. Padają strzały. Są ranni i zabici. Protesty narastają w siłę. Z tej okazji korzysta KRLD, pod hasłem zjednoczenia Korei rozpoczyna ofensywę w dół 38 równoleżnika.
"]];

private _sitRep = player createDiaryRecord ["diary", ["SitRep","
<br/>
Czołem Panowie!
<br/><br/>
Sytuacja jest beznadziejna. Musimy jak najszybciej brać się do działania.<br/>
Siły KRLD rozpoczęły ofensywę na całej długości granicy (niebieska linia). Nasze oddziały starają się ich spowolnić, żeby dać nam czas na utworzenie drugiej lini obrony tutaj (zielona linia).<br/><br/>
Mamy niewiele sprzętu, ale musimy działać z tym co mamy. Saperzy powinni zaminować główne drogi (czerwone wykrzykniki). Reszta powinna w tym czasie przygotować linie umocnień na wzgórzach.<br/>
Mamy dostęp do helikopetera z wyrzutnią min, powinien jak najszybciej zaminować przedpole.<br/><br/>
Brać się do roboty, nie mam pojęcia ile wytrzymają na pierwszej lini.
"]];
