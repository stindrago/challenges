---
title: "Challenge 2"
summary: Benvenuto nella seconda challenge, difficoltà 🤕🤕. In questa challenge farai eccessivo uso della shell (terminale).
date: 2021-03-13
tags: ["challenge-series"]
---

[challenge-3]: ../challenge-3/

# Challenge 1 - Naviga La Shell

Benvenuto nella seconda challenge, difficoltà 🤕🤕. 
In questa challenge farai eccessivo uso della shell (terminale).

## In Questa Challenge

- Il filesystem GNU/Linux.
- Navigazione nella shell.
- Operazioni su file e directory.
- Personalizzazione della shell.

## Introduzione

La maggior parte degli utenti di computer al di fuori del mondo UNIX non dedica molto tempo alla riga di comando, alcuni come mia nonna non ne hanno bisogno altri invece lo ignorano o addirittura pensano sia cosa da _hacker_. Nell'informatica se ti affidi a programmi con _GUI (Graphical User Interface)_ incomberai prima o poi in limiti.

I programmi che utilizzerai da riga di comando non sono solo adatti a programmatori o sistemisti ma anche ad utenti comuni. Quante volte hai avuto bisogno di rinnominare 100+ file automaticamente attraverso un criterio e invece hai rinominato manualmente ogni uno di essi? In modo lento con 
_tasto destro -> rinomina_ o con la scorciatoia _F2_. Forse perche non conoscevi le potenzialita della shell, all'inizio sarai come gli hacker della Hollywood i quali digitano solo caratteri mai uno spazio, mai un invio, tuttavia in fine sarai un vero hacker. 

I comandi devono essere memorizzati, alcuni saranno molto intuitivi, seguono tutti una logica e sono definiti in inglese.

Vedi ad esempio come rinominare l'estensione di tutte le foto in _Immagini_

``` shell
find immagini/ -depth -execdir rename 's/.JPEG/.jpg/' *.JPEG \;
```

### Prova tu

Apri il terminale ed esegui gli seguenti comandi in ordine

``` shell
cd ~/                                               # cambia directory in home
mkdir prova                                         # crea una nuova directory `prova`
cd prova/                                           # cambia directory in `prova`
for i in `seq 10` ; do `touch $i.TXT`; done         # crea 10 file con nome `n.TXT`
ls -l                                               # visualizza tutti i contenuti della directory
find . -depth -exec rename 's/.TXT/.txt/' *.TXT \;  # rinomina tutti i file `n.TXT` in `n.txt` 
```

> Se il comando `rename` non esiste installalo con `sudo apt install rename`.

## GNU/Linux file system

Quando si utilizza un desktop grafico come Windows, MacOS di Apple o le ultime distribuzioni GNU/Linux, arrivano con _luoghi_ dove vengono memorizzati i tuoi dati: immagini, musica, documenti, ecc. Ma se tu sia moderatamente tecnico allora ti renderai conto che in fondo questa è una _struttura gerarchica_.

``` shell
C:\Users\stindrago\Desktop  # in Windows
/Users/stindrago/Desktop    # in MacOS
/home/stindrago/Desktop     # in Ubuntu
```

La `/` indica la separazione tra i luoghi. Un insieme di `/` indica il percorso del luogo. Se un percorso inizia con `/` definita _radice_ indica il percorso completo del luogo perche prima di `/` non esistono altre directory.

``` shell
/home/stindrago/Documenti   # percorso completo della directory `Documenti`
stindrago/nota.txt          # percorso del file `nota.txt` 
nota.txt                    # file
```

Per muoversi all'interno del terminale utilizza i comandi

- `pwd` visualizza il percorso del luogo attuale 
- `cd` per cambiare luogo
- `pushd` per cambiare luogo e tenere traccia dell'ultimo luogo visitato
- `popd` per tornare nel luogo precedentemente visitato

`pushd` e `popd` sono sintetizzati nel comando `cd`. Utilizzando `cd -` si torna nel luogo precedentemente visitato con `cd` o `pushd`.

Esistono alcuni percorsi che facilitano la navigazione.

- `cd ..` torna indietro di un luogo.
- `cd ~/` cambia luogo in `/home/stindrago` definita _home directory_.
- `cd /` cambia luogo in `/` definita _root directory_.

### Prova tu

- Naviga in tre luoghi diversi.
- Quale' il percorso completo dei luoghi visitati?
- Come si torna nella _home directory_ da qualsiasi luogo?
- Usa solo il comando `cd ..` per visitare la _root directory_.

## Operazioni su file

Le operazioni su file e' una delle magie più belle della shell. Presto vedrai come automatizzare le operazioni elementari come _trova_, _crea_, _rinnomina_, _copia_, _sposta_ ed _elimina_.
Tutti i giorni abbiamo a che fare con centinaia di file, gli utenti abituati con il sistema tradizionale del _tasto destro_ sprecano tempo prezioso. Quando si tratta di pochi file non e' un problema, ma quando i file sono centinaia o addirittura migliaia? Passeresti la prossima settimana a modificarle manualmente? Finiresti in fisioterapia molto presto.

Ecco alcuni comandi elementari

- `find` trova file e directory.
- `touch` crea file.
- `mkdir` crea directory.
- `rename` rinomina file e directory.
- `cp` copia file e directory.
- `mv` sposta file e directory.
- `rm` rimuovi file e directory.

> Per leggere le istruzioni di qualsiasi comando utilizza `man`

La logica dei comandi e' _nome-comando input_. Gli input possono essere _<obbligatori>_ o _[facoltativi]_. 
Devi sapere anche che i comandi nella shell sono implementati con funzioni aggiuntive. Per invocare queste funzioni si aggiunge `-` dopo il comando seguito da una serie di caratteri. Ogni carattere indica una funzione separata.

``` shell
cp -rv immagini/pizza/ immagini/2021/
```

Dissezioniamo il comando `cp` specifico per effettuare una copia. `-` indica che invochiamo delle funzioni aggiuntive le quali sono `r` _ricorsivo_ e `v` _verboso_. Infine un input `immagini/pizza` il percorso della directory che vogliamo copiare e `immagini/2021` la destinazione. Senza `r` non potrai copiare le directory e con `v` puoi visualizzare il percorso dei file copiati in _real time_.

Anche le funzioni aggiuntive possono ricevere input.

``` shell
find immagini/pizza/ -name "capricciosa.png"
```

`find` per ricercare un file. Un input `immagini/pizza/`, il luogo in cui effettui la ricerca. La funzione `-name` richiede un input che e' il nome del file da ricercare, `capricciosa.png`.

> Il carattere `"` indica che il contenuto racchiuso tra essi e' una stringa ed e' indispensabile con i file che contengono spazi.

### Prova tu

- Leggi con `man` le istruzioni del utilizzo dei comandi.
- Crea tre directory `n\`, all'interno di ogni directory crea tre file `n.txt`.
- Copia la directory `1\` e il suo contenuto nella directory `2\`.
- Sposta tutti i file della directory `3\` in `1\2\`.
- Elimina la directory `3\`.

> Usa il carattere speciale `*` per indicare tutti i file in una directory, i.e. `directory\*`

## Personalizzazione della shell

- alias
- oh-my-zsh

TODO

## Riassunto

In questa challenge hai visto

- Perche e' utile conoscere la shell.
- Tutti possono imparare ad utilizzare la shell.
- I comandi elementari per la navigazione.
- Operazioni su file e directory.
- Come personalizzare il terminale.

Nella [challenge-3][challenge-3] vedrai come utilizzare _git_ e _gitlab_ per il versionamente dei file.

## Challenge 2

TODO
