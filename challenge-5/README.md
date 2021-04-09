[minecraft]: https://www.minecraft.net
[factorio]: https://www.factorio.com
[parrot-sec-os]: https://download.parrot.sh/parrot/iso/4.11/Parrot-security-4.11_amd64.iso.mirrorlist
[balena-etcher]: https://www.balena.io/etcher/

# Challenge 5 - WiFi Penetration

Benvenuto nella quinta challenge, difficoltà 🤕🤕🤕🤕🤕.
In questa challenge prenderai i panni di un agente di sicurezza informatica della rete.

**Questa challenge e' a solo scopo educativo, pertanto l'autore della challenge non si assume nessuna responsabilità per l'uso che i partecipanti faranno di questa conoscenza.**

## In Questa Challenge

- Installazione di Parrot OS su chiavetta USB.
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

``` org
#+draft: [2020-03-10T15:00]
```
