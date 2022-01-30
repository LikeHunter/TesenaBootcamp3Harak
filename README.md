# TesenaBootcamp3Harak
##  Repozitar pro splnění tesena Bootcampu 3

###  5 Testovacích scénářů na základě testovaných sekcích
*  Registrace
*  Login
*  Vyhledání zboží
*  Přídání zboží do košíku 
*  Napsání review na produkt

Frontendovy test na http://tutorialsninja.com/demo/ s pouzitim Robot Framework. 

Testy overují fuknčnost webu 

# Zadani testovacich scenaru:
##  REGISTRACE
* Zaregistrovat se a ulozit si pouzity e-mail/password do .csv souboru (pokud pozitivni scenar)
* Privacy policy agreement je povinny
* Pri chybe se zobrazi error message

## LOGIN
* Musi byt vyplnene existujici e-mail a spravna kombinace paru e-mail + heslo
* Pri chybe se zobrazi error message

## Vyhledani zbozi
* Úspěšné vyhledání hledaného zboží
* kontrola vyhledáného zboží
* Při nevyhledání se zobrazí validní message 

## Přídání zboží do košíku 
* Vlozit zbozi do kosiku a nasledne ho odstranit z kosiku
* kontrola přidaní do košíku 
* kontola ceny kosíku po pridání produktu

##  Napsání review na produkt
* Name musi byt vyplneno
* Review musi mit alespon 25 znaku
* Po odeslani review se zobrazi success message
* Pri chybe se zobrazi error message

