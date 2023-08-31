/*
 * Deklaracja naszywek naramiennych
 * Dokumentacja: https://community.bistudio.com/wiki/Arma_3:_Unit_Insignia
 */

class CfgUnitInsignia {
    // Pamiętaj, że GVAR(twojaKlasa) rozwiazuje się do mission_twojaKlasa
    class 111thID {
        // Nazwa naszywki
     	displayName = "111th Infantry Division"; // Możesz też użyc CSTRING(CfgUnitInsignia_111thID);

        // Autor
     	author = "Bohemia Interactive";

        // Ścieżka do pliku graficznego. Plik musi być w formacie PAA, w rozmiarach 128x128px
     	texture = "\a3\UI_F_Bootcamp\Data\CfgUnitInsignia\B_111thID_texture_ca.paa";
    };
};
