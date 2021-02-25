[gitlab]: https://gitlab.com/
[ubuntu-downlad]: https://ubuntu.com/#download/
[virtual-box]: https://www.virtualbox.org/

# Challenge 1 - Installa Ubuntu

Benvenuto. In questa challenge scoprirai come installare e configurare una macchina linux. Questa e' solo la prima challenge e presto ne seguiranno altre più difficili. Prima concentrati ad avere lo strumento principale per poter completare le altre challenge.

## In Questa Challenge

- Installa [Ubuntu 20.04 LTS][ubuntu-downlad] sulla macchina virtuale.
- Configura il _Sistema Operativo_.

## Introduzione

Prima di iniziare ad installare Ubuntu devi capire che cosa sono il sistema operativo e la macchina virtuale.

Cosa hanno in comune i nomi in questa lista?

- Windows XP.
- Windows 10.
- Chrome OS.
- Ubuntu 20.04 LTS.
- Android.

>!  Sono tutti quanti sistemi operativi. I primi quattro per computer, l'ultimo per mobile. 

## Prova Tu

- Elenca altri 5 sistemi operativi che conosci.
- Quali di loro sono sistemi operativi per computer, quali per mobile?

Ora che hai capito che cos'è un sistema operativo, capire che cos'è la macchina virtuale sarà più facile. La macchina virtuale e' un ambiente virtuale (un software) che simula l'esistenza di un dispositivo fisico, nel nostro caso un computer. Sul tuo computer puoi quindi girare un sistema operativo di base (Windows) e sopra virtualizzato un nuovo sistema operativo (Ubuntu). Non ce limite a quanti ambienti virtualizzati puoi girare in simultanea o per lo meno finché le risorse del tuo computer non si esauriscono (potenza di calcolo e memoria).

```
Windows-10
    └── Ubuntu-20.04-LTS
        ├── Debian-10 
        ├── Debian-9a
        └── Ubuntu-20.04-LTS
            ├── Debian-10
            └── Windows-10
                └── Ubuntu-20.04-LTS

Poi basta perché il computer sarà probabilmente esploso.
```

> I sistemi operativi di base poi si distinguono per architettura che indica il tipo di elaboratore (CPU) presente nel dispositivo. Un sistema operativo come Windows 10 che necessita di architettura 64_x86 non potrà mai essere installato su un dispositivo mobile (architettura arm). Grazie pero' alle tecnologie di _virtualizzazione_ e' possibile, ma tutto questo e' al di fuori di questa challenge.

## Istruzioni

### Installa Virtual Box

Il programma che utilizzerai in questa challenge e' [Virtual Box][virtual-box]. Scarica la versione compatibile per il tuo sistema operativo dal sito ufficiale.

> Se hai già come sistema operativo di base una distribuzione Linux e pensi di poter saltare questo passaggio ti consiglio vivamente di non farlo. Installa Ubuntu 20.04 LTS sulla macchina virtuale, perché sarà più facile per te seguire le challenge ed eseguire i comandi in un ambiente sicuro.

### Aggiungi Una Macchina Virtuale

