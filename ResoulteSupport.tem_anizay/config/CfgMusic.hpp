/*
 * Deklaracja muzyki
 * Dokumentacja: https://community.bistudio.com/wiki/Description.ext#CfgMusic
 */

class CfgMusic {
    // Pamiętaj, że GVAR(twojaKlasa) rozwiazuje się do mission_twojaKlasa
    class GVAR(twojaKlasa) {
        // Nazwa dźwięku, nazwa techniczna, niewidoczna dla graczy
        name = "";

        // Ścieżka do pliku dźwiękowego, głośność, wysokość tonu
        sound[] = {"", 1, 1};
    };
};
