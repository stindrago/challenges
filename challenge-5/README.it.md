---
title: "Challenge 5"
summary: Benvenuto nella quinta challenge, difficoltà 🤕🤕🤕🤕🤕. In questa challenge prenderai i panni di un agente di sicurezza informatica della rete.
date: 2021-04-03
tags: ["challenge-series"]
---

[minecraft]: https://www.minecraft.net
[factorio]: https://www.factorio.com
[parrot-sec-os]: https://download.parrot.sh/parrot/iso/4.11/Parrot-security-4.11_amd64.iso.mirrorlist
[balena-etcher]: https://www.balena.io/etcher/

# Challenge 5 - WiFi Penetration

Benvenuto nella quinta challenge, difficoltà 🤕🤕🤕🤕🤕.
In questa challenge prenderai i panni di un agente di sicurezza informatica della rete.

**Questa challenge e' a solo scopo educativo, pertanto l'autore della challenge non si assume nessuna responsabilità per l'uso che i partecipanti faranno di questa conoscenza.**

## In Questa Challenge

- Installazione di Parrot Sec OS su chiavetta USB.
- Attivazione della scheda di rete WiFi in modalita promiscua.
- Monitoraggio del target.
- De-autenticazione dei client dall'AP (access point).
- Cattura della chiave di autenticazione client-AP come _Man In The Middle_.
- _Brute Force Crack_ della chiave catturata attraverso un dizionario.

## Introduzione

Che cos'è il _penetration testing_?

E' un ramo della sicurezza informatica che si occupa di identificare le vulnerabilità di una rete.
Queste reti possono essere: reti aziendali, pubbliche o la rete di casa tua.
I test di penetrazione mettono alla prova la sicurezza di una rete.
Questi test nel ambito professionale si definiscono _audit_, forse ne hai sentito parlare.
Gli esperti possono garantire che i test non danneggino la rete e forniscono informazioni su possibili vulnerabilità.
In questa challenge specificatamente vedrai come effettuare il _pen testing_ della tua rete per verificarne la sicurezza.
Ti concentrerai ad attaccare con particolari strategie l'_AP (access point)_: il tuo router WiFi.
Il modo più facile per qualcuno di entrare nella tua rete e' proprio attraverso uno degli accessi che hai con l'esterno, i.e. una WiFi non sicura.
Ci sono altri accessi alla tua rete come ad esempio un attacco proveniente da Internet che mira a specifiche porte aperte sul router.

> Attento a quali server [Minecraft][minecraft]/[Factorio][factorio] ti connetti 😂.

## Preparazione

Strumenti necessari

|                                  |                                          |
|----------------------------------|------------------------------------------|
| OS con i strumenti preinstallati | [Parrot Sec OS][parrot-sec-os]           |
| SD flasher                       | [Balena Etcher][balena-etcher]           |
| Chiavetta USB                    | Minimo 8GB                               |
| Target Router                    | Router con WiFi                          |
| Scheda di rete WiFi              | Con supporto per la _modalita promiscua_ |

Scarica l'[ISO di Parrot Sec OS][parrot-sec-os] ed installa [Balena Etcher][balena-etcher].

Scaricato **Parrot Sec OS** inserisci la **chiavetta USB** nel tuo computer, apri **Balena Etcher** e seleziona come immagine l'ISO appena scaricata e come destinazione la chiavetta USB.

Al termine dell'operazione riavvia il computer e fai il _boot_ da chiavetta USB.

Dal menù che compare seleziona `Live Mode`.

> Ora sei pronto per continuare la challenge. Se non sai come fare il _boot _ da chiavetta USB cerca su Internet il tuo modello. Di solito bisogna premere ripetutamente al riavvio i tasti: `Tab`, `F2` o `F9` finche non compare una nuova finestra dove selezionerai la chiavetta USB.

## Penetration Test

Se utilizzi un dongle come scheda di rete connettilo ora.

Apri `MATE terminal` e accedi come root

``` shell
su
```

Crea una cartella e cambia in essa

``` shell
mkdir ~/challenge-5
cd ~/challenge-5
```

Identifica l'interfaccia di rete wireless.

``` shell
ip a
```

> L'interfaccia di rete wireless inizia con la lettera `w`, se usi la scheda  di rete interna di un portatile il nome e' `wlan0` altrimenti sarà `wlan1` oppure un altro nome.

Killa tutti i processi che potrebbereo interferire con il _pen test_.

``` shell
airmon-ng check kill
```

Attiva l'interfaccia di rete wireless in modalita promiscua

``` shell
airmon-ng start wlan0
```

> Da ora in poi l'interfaccia di rete wireless assumerà un nuovo nome: `wlan0mon`

Ricerca le WiFi cicostanti per ricavare alcune informazioni

``` shell
airodump-ng wlan0mon
```

Individuale seguenti informazioni associate all'AP

- Il `BSSID`:_indirizzo MAC_.
- Il `CH`: _channel_.

> Per individuare l'_indirizzo MAC_ dell'AP cerca nella *tabella in alto* e nella collonna `SSID` il nome della tua WiFi e annota il `BSSID` associato.
> Per individuare il _channel_ in cui l'AP ascolta cerca nella *tabella in alto* e nella colonna `SSID` il nome della tua WiFi e annota il `CH` associato.

Usa `CTRL + C` per interrompere il programma e salva per comodità il `BSSID` e il `CH` in delle variabili

``` shell
echo 'export ap-bssid="XX:XX:XX:XX:XX:XX" >> ~/.bashrc'
echo 'export ap-ch="N" >> ~/.bashrc'
source ~/.bashrc
```

> Sostituisci `XX:XX:XX:XX:XX:XX` con l'indirizzo MAC e `N` con il channel dell'*AP* ricavato.

Avvia il programma `airodump-ng` con nuovi parametri per metterti in ascolto mirando soltanto alla tua WiFi

``` shell
airodump-ng wlan0mon --bssid "$ap-bssid" --channel "$ap-ch" --write "ap-monitoraggio"
```

- `--bssid "$ap-bssid"` e' la l'indirizzo MAC dell'AP ricavato.
- `--channel "$ap-ch"` e' la il canale di ascolto dell'AP ricavato.
- `--write "ap-monitor"` e' il prefisso dei nomi dei file in cui saranno salvati da ora in poi le informazioni catturate.

Individua un client connesso all'AP.

> Per individuare l'_indirizzo MAC_ di un client cerca nella *tabella in basso* e nella colonna `BSSID` l'_indirizzo MAC_ dell'AP e annota lo`STATION` associato.

Apri una nuova _tab_ terminale `SHIFT + SUPER + ENTER`. Da ora in poi le tab del terminale verranno identificate rispettivamente con `tab-1`  e `tab-2`.

In `tab-2`, salva l'indirizzo MAC del client individuato

``` shell
echo 'export client-bssid="XX:XX:XX:XX:XX:XX" >> ~/.bashrc'
source ~/.bashrc
```

> Sostituisci `XX:XX:XX:XX:XX:XX` con l'indirizzo MAC del *client* ricavato.

Non chiudere la `tab-1`, attualmente il programma `airodump-ng` sta monitorando l'AP. Quello che ti interessa ora e' catturare il handshake tra l'AP e il client. Per rendere possibile l'handshake devi far disconnettere il client dall'AP affinché si riconnetta inviando dei pacchetti di de-autenticazione. E' importante che tu sia il più vicino possibile all'AP. Se la tua scheda di rete e' debole ti conviene essere nella stessa stanza dell'AP. Per sapere se tu sia abbastanza vicino, la voce associata al `BSSID` dell'AP nella colonna `PWR` non deve essere superiore a `-50` con `0` massima raggiungibilità e `-99` irraggiungibile.

In `tab-2`, disconetti il client dall'AP

``` shell
aireplay-ng wlan0mon --deauth 50 -a $ap-bssid -c $client-bssid
```

- `--deauth 50` e' il numero di pacchetti di de-autenticazione che verranno inviati, `50` sono sufficienti.
- `-a $ap-bssid` e' il `BBSID` dell'AP
- `-c $client-bssid` e' il `BSSID` del client.

> ❗ Cosi facendo disconetterai il client dall'AP, assicurati che si riconnetta controllando `tab-1`. In `tab-1` in alto nella prima riga verrà mostrato quando l'handshake e' stato catturato, a quel punto puoi anche interrompere il programma `airodump-ng` e disattivare la _modalita promiscua_ perche le informazioni sono salvate nei file `ap-monitoraggio*`. Volendo puoi anche utilizzare un altro computer con CPU migliore.

Esegui il _crack_ della chiave attraverso il _bruteforce_

``` shell
aircrack-ng monitoraggio-01.cap -w ./dizionario-ita.txt
```

- `monitoraggio-01.cap` e' il file che contiene la chiave.
- `w ./dizionario-ita.txt` e' il percorso al dizionario.

> In Parrot Sec OS sono prosenti dei dizionari in `/usr/share/wordlist/`. Copia il dizionario in `~/challenge-5` per poi utilizzarlo con `aircrack-ng`. Se il file e' un archivio `.gz` utilizzia il comando `gunzip nome-file.gz` per estrarre il file.

Una volta trovata la password accedi alla WiFi.

## Riassunto

## Challenge

Esegui l'audit per la tua rete WiFi di casa che utilizza una chiave _WPA2_. Cerca su GitHub i migliori dizionari italiani da pen test e verifica che la tua WiFi sia sicura. Se il dizionario e' grande preparati a lasciare attivo il cracking tutta la notte.

> NB. Una volta catturato l'handshake puoi anche allontanarti dall'AP ed eseguire il crack su un computer più potente, la chiave e' nel file `ap-monitoraggio*.cap`.
