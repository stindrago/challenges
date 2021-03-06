[dir-challenge-1]: ./challenge-1
[dir-challenge-2]: ./challenge-2
[dir-challenge-3]: ./challenge-3
[dir-challenge-4]: ./challenge-4
[cve-2021-3156]: http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-3156
[dir-challenge-5]: ./challenge-5
[dir-challenge-6]: ./challenge-6
[aoc]: https://adventofcode.com

# Challenges

Benvenuto a **Challenges** la nuova modalità di acquisizione di super-poteri informatici 😎.

**Challenges** garantisce follia pura per rendere il tuo tempo libero un vero incubo.

La difficoltà delle _challenge_ sono misurate in _mal di testa_ 🤕. Più _mal di testa_ sono assegnati alla challenge e più sara probabile che ti arrenda.

## Challenge Disponibili

| Challenge                                                                             | Difficoltà&nbsp;&nbsp;&nbsp; |
|---------------------------------------------------------------------------------------|-----------------------------:|
| [Challenge 1][dir-challenge-1] - Crea una macchina virtuale Ubuntu Server             |                           🤕 |
| [Challenge 2][dir-challenge-2] - Naviga nella shell                                   |                         🤕🤕 |
| [Challenge 3][dir-challenge-3] - Utilizza git e Gitlab                                |                         🤕🤕 |
| [Challenge 4][dir-challenge-4] - Privilege escalation: [CVE-2021-3156][cve-2021-3156] |                     🤕🤕🤕🤕 |
| [Challenge 5][dir-challenge-5] - WiFi penetration in modalita promiscua               |                   🤕🤕🤕🤕🤕 |
| [Challenge 6][dir-challenge-6] - [2021-05-08] [Advent Of Code][aoc]                   |                       🤕➕➕ |

## Partecipa Alla Challenge

Se vuoi partecipare alla challenge e pubblicare i tuoi risultati segui le prossime istruzioni.

1. Fai il _fork_ di questo progetto.
2. Inserisci i file in una nuova cartella `challenge-N/deliverable/gitlab-username/`, con `gitlab-username` il tuo nome utente Gitlab.
3. Invia una _merge request_ per condividere la soluzione.

> Sei non sai come si fa leggi la [challenge-3][dir-challenge-3].

Per vedere i risultati dei altri partecipanti, visita la directory `challenge-N/deliverable/`.

## Crea Una Nuova Challenge

Se hai intenzione di collaborare e creare una nuova challenge da aggiungere al _roster_ devi seguire alcune linee guida.

Per prima cosa, fai il fork di questo progetto.

Crea una nuova directory `challenge-N` e reclama la challenge. Ora sta a te descriverla e renderla pubblica attraverso una merge request.

La spiegazione della challenge deve avvenire nel file `README.md` all'interno di una directory `challenge-N`.

All'interno della stessa directory devono essere presenti 3 sottodirectory:

- `sandbox/`: con una sottodirectory per ogni partecipante, costituisce un parco giochi dove il partecipante può sperimentare.
- `deliverable/`: con una sottodirectory per ogni partecipante, contiene l'output prodotto dal partecipante stesso.
- `assets/`: contiene materiale di base predisposto da chi imposta la `challenge`.

In ciascuno di queste directory deve essere presente un file `.placeholder` per aggiungere anche le directory vuote. 
