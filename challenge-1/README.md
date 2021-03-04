[gitlab]: https://gitlab.com/
[ubuntu-downlad-server]: https://ubuntu.com/download/server/
[ubuntu-server-manual-download]: https://releases.ubuntu.com/20.04.2/ubuntu-20.04.2-live-server-amd64.iso/
[virtual-box]: https://www.virtualbox.org/
[windows-download]: https://www.microsoft.com/it-it/software-download/windows10ISO/
[multipass-download]: https://multipass.run/
[youtube-install-ubuntu]: https://youtu.be/EWAnQivQMw8?t=150

# Challenge 1 - Installa Ubuntu

Benvenuto. In questa challenge scoprirai come installare e configurare una macchina linux. Questa è solo la prima challenge e presto ne seguiranno altre più difficili. Concentriamoci inizialmente a fornirti gli strumenti necessari per completare le challenge future.

## In Questa Challenge

- Installa un gestore di macchine virtuali.
- Crea una nuova macchina virtuale [Ubuntu Server 20.04 LTS][ubuntu-downlad-server].

## Introduzione

Prima di iniziare ad installare Ubuntu devi capire che cosa sono il sistema operativo e la macchina virtuale.

Cosa hanno in comune i nomi in questa lista?

- Windows XP.
- Windows 10.
- Chrome OS.
- Ubuntu 20.04 LTS.
- Android.

<details>
<summary> Spoiler ⚠️</summary>
<p> Sono tutti quanti sistemi operativi. I primi quattro per computer, l'ultimo per mobile.</p>
</details> 

### Prova tu

- Elenca altri 5 sistemi operativi che conosci.
- Quali di loro sono sistemi operativi per computer, quali per mobile?

Ora che ti sei fatto un idea a cosa ci rifermiamo con il termine _sistema operativo_, capire il significato di macchina virtuale non sarà difficile. La macchina virtuale è un ambiente virtuale (un software) che simula l'esistenza di un dispositivo fisico, nel nostro caso un computer. Sul tuo computer puoi quindi girare un sistema operativo principale (Windows) e su di esso uno virtualizzato (Ubuntu e altri). Ubuntu puo fungere anche da sistema operativo principale.

Non ce limite al numero di ambienti virtualizzati che puoi creare ed eseguire simultaneamente, fintanto che le risorse del tuo computer non si esauriscono (potenza di calcolo e memoria).

```
Windows 10
    ├── Debian Server 10 
    ├── Debian Desktop 10
    ├── Ubuntu Server 20.04 LTS
    └── Windows 10

Poi basta perché il computer sarà probabilmente esploso.
```

> I sistemi operativi si distinguono per architettura che indica il tipo di elaboratore (CPU) presente nel dispositivo. Un sistema operativo come Android che necessita di architettura ARM non potrà mai essere installato su un computer desktop (architettura x86). Tuttavia le tecnologie di _virtualizzazione_ moderne lo rendono possibile (chi sviluppa APP lo sa). Esistono anche sistemi operativi  _multi-architettura_ come ad esempio Debian che gira probabilmente anche su hardware alieno.

Ci sono molti modi per creare una macchina virtuale. Tratteremo due casi.

1. Utilizzando il metodo tradizionale con [Virtual Box](#virtual-box) (lungo e noioso).
1. Utilizzando tecnologie più moderne con [Multipass](#multipass) 😏 (semplice e veloce).

> Se hai già come sistema operativo principale una distribuzione GNU/Linux e pensi di poter saltare questo passaggio ti consiglio vivamente di non farlo, potresti perdere un dito o tutta la mano sfortunatamente. Installa Ubuntu 20.04 LTS sulla macchina virtuale, perché sarà più facile seguire le challenge e sperimentare all'interno di un ambiente sicuro.

<a id="virtual-box"></a>
    
##  Installa Ubuntu Con Virtual Box

Prima di procedere con le istruzioni scarica l'ISO con [Ubuntu Server 20.04 LTS][ubuntu-downlad-server] per l'installazione manuale. Sei il sito crea confusione utilizza il [dowload diretto][ubuntu-server-manual-download].

Scarica ed installa [Virtual Box][virtual-box], scegli la versione compatibile con  il tuo sistema operativo.

Se la lingua del programma è in inglese cambiala in `Tools -> Preferences -> Language`.

## Crea Una Macchina Virtuale

Dal menù a tendina in alto clicca su `Macchina -> Nuova Macchina`.

**Nome e sistema operativo**

Introduci le informazioni generali della nuova macchina virtuale.

```
Nome: ubuntu-challenge
Cartelle della macchina: <predefinito> # Non cambiare nulla
Tipo: Linux
Versione: Ubuntu (64-bit)
```

> Il carattere `#` indica che il testo che segue è solo un commento.

Clicca `Continua`.

**Dimensione della memoria**

Seleziona la quantità di memoria RAM da assegnare alla macchina virtuale. Posiziona la freccia al confine tra il colore verde e l'arancione. Assicurati che la memoria sia almeno 1024 MB.

Clicca `Continua`.

Nelle prossime tre schede lascia i valori predefiniti, clicca semplicemente `Crea -> Contiuna -> Continua`.

1. **Disco fisso**:  `Crea subito un nuovo disco virtuale`  selezionato.
1. **Tipo di file del disco fisso**: `VDI`  selezionato.
1. **Archiviazione su disco fisico fisso**: `Allocato dinamicamente` selezionato.

**Posizione file e dimensione**

Questa scheda è importante e conviene spiegarla.

1. Non cambiare il percorso di destinazione, non è altro che l'unione del percorso `Cartelle della macchina` e il nome  `ubuntu-challenge`  che hai scelto nella prima scheda.
2. Assegna 20GB di memoria alla macchina . Questa memoria non verrà sottratta immediatamente al sistema operativo principale perche la macchina virtuale utilizzerà un allocamento dinamico. Potrà essere comunque cambiata successivamente nelle impostazioni di Virutal Box.

Abbiamo finito il processo di creazione della macchina virtuale. Tuttavia non puoi ancora utilizzare il nuovo sistema operativo perche non è ancora installato. Ti ricordi l'ISO che hai scaricato poco fa? La utilizzerai per installare il sistema operativo.

Quindi click su `Avvia` per avviare la macchina virtuale. Nella prima scheda ti verrà chiesto di inserire il percorso dell'ISO con Ubuntu scaricata poco fa.

Fatto questo segui le istruzioni mostrate sullo schermo per completare l'installazione di Ubuntu. Se i passaggi da qui in poi sono troppo difficili segui [questo video su Youtube][youtube-install-ubuntu] che potrebbe aiutarti. In alternativa usa [Multipass](#multipass).

> Ti ho avvertito che questo è un processo lungo e noioso. Purtroppo è uno dei pochi modi disponibili per virtualizzare sistemi operativi come Windows o Hackintosh. Questi due cercano di fare gli alternativi...

### Prova tu

- Cosa succede se crei una macchina virtuale assegnando tutta la memoria RAM disponibile?
- Crea una nuova macchina virtuale Windows 10. Scarica l'ISO dal [sito ufficiale][windows-download].

<a id="multipass"></a>

##  Installa Ubuntu Con Multipass

Scarcia ed installa [Multipass][multipass-download].

Se usi una distribuzione GNU/Linux o MacOS apri il terminale. Se usi Windows invece apri la Powershell come amministratore.

Ora inserisci i prossimi comandi all'interno del terminale.

Crea una nuova macchina virtuale

``` shell
multipass launch 20.04 --name ubuntu-challenge
```

Avvia la macchina virtuale

``` shell
multipass start ubuntu-challenge
```

Apri una shell

``` shell
multipass shell ubuntu-challenge
```

🤯 Tutto qui? Si, con Multipass e' più semplice e veloce.

> Per uscire dalla shell della macchina virtuale usa il comando `exit`. Una shell è un istanza del terminale (dove esegui i comandi).  Faremo uso di questo termine a lungo, meglio conoscerne il significato.

Ricordati di spegnere la macchina quando hai finito 👌

``` shell
multipass stop ubuntu-challenge
```

### Prova tu

- Esegui il comando  `multipass find` e trova la versione di Ubuntu che hai appena installato.
- Crea una nuova macchina virtuale Ubuntu versione `18.04`  e  nome `ubuntu-prova`.
- Esegui il comando  `multipass list` nel terminale del tuo sistema operativo principale. Qualè l'output?
- Esegui il comando  `multipass help`.

## Riassunto

In questa challenge abbiamo imparato come che cosa si intende per sistema operativo e macchina virtuale. Abbiamo visto come utilizzare diverse tecnologie ma anche
- Esistono tanti sistemi operativi per architetture diversi.
- Come creare una macchina virtuale.
- Quali sono le tecnologie di virtualizzazione
- Come creare con facilità una macchina virtuale con Multipass.

Nella prossima challenge aprofondiamo di più l'utilizzo della shell.

## Challenge 1

- Crea 5 macchine virtuali in 1 minuto.
  + Una macchina _Ubuntu 16.04 LTS_ con nome "ubuntu-1604-LTS"
  + Una macchina _Ubuntu 18.04 LTS_ con nome "ubuntu-1804-LTS"
  + Una macchina _Ubuntu 20.04 LTS_ con nome "ubuntu-2004-LTS"
  + Una macchina _Ubuntu 20.10_ con nome "ubuntu-2010"
  + Una macchina _Ubuntu 20.10_ con nome "ubuntu-2010-bis"
