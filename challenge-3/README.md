[challenge-4]: ../challenge-4/
[download-git-mac-os]: http://git-scm.com/download/mac
[download-git-windows]: http://msysgit.github.io/
[download-git-gnu-linux]: http://git-scm.com/book/en/Getting-Started-Installing-Git
[website-gitlab]: https://gitlab.com
[challenges]: https://gitlab.com/pdpfsug/mkspace/challenges
[gitlab-new-project]: https://gitlab.com/projects/new
[image-branching]: https://rogerdudler.github.io/git-guide/img/branches.png

# Challenge 4 - Utilizza git e GitLab

## In Questa Challenge

- Installa git.
- Utilizza git da riga di comando.
- Utilizza una piattaforma git, [GitLab][website-gitlab].
- Git workflow.
- Fai il fork di un repository.
- Invia una _Merge Requst/Pull Request_.
- Versiona i file di configurazione, _dotfiles_.

## Introduzione

Git è un software di controllo di versione creato da _Linus Torvalds_, lo stesso che ha creato il kernel _Linux_.

Sapevi che _git_ nello slang americano significa _idiota_? Eh si. E' nato con l'intento di facilitare lo sviluppo del kernel Linux. Quando molti altri sviluppatori hanno iniziato ad utilizzarlo ha avuto un successo enorme, sopratutto con l'avvenuto di piattaforme come GitHub, Bitbucket e GitLab.

In questa challenge tratteremo anche GitLab. Sanno tutti che e' un software migliore di GitHub con più strumenti. Oltre a questo ha anche una versione community open source configurabile sul proprio server.

Git e' presente per la maggior parte dei sistemi operativi
 - [MacOS][download-git-mac-os]
 - [Windows][download-git-windows]
 - [Distribuzioni GNU/Linux][download-git-gun-linux]

## Git Da Linea Di Comando

Verifica se _git_ e' gia installato sulla tua macchina

``` shell
git --version
```

Altrimenti installalo su ubuntu

``` shell
sudo apt-add-repository ppa:git-core/ppa
sudo apt update
sudo apt install git
```

Hai bisogno di configurare git con le tue informazioni personali _nome_ ed _email_, queste informazioni vengono salvate solo sulla tua macchina. Sono indispensabili affinché git conosca l'autore del commit.

Configura il nome

``` shell
git config --global user.name "Costin Dragoi"
```

Configura l'email

``` shell
git config --global user.email "csdcostin@gmail.com"
```

Configura l'editor. Servirà quando editerai i commit

``` shell
git config --global core.editor "emacs" 
```

> Sostituici i campi tra `"` con i tuoi dati.


Visualizza le configurazioni

``` shell
git config --global --list
```

Con `--global` applichi le configurazioni a tutti i repositori.

## GitLab

Prima di tutto registrati su [GitLab][website-gitlab].

Genera una chiave SSH

``` shell
ssh-keygen -t ed25519 -C "ubuntu:csdcostin@gmail.com"
```

Premi sempre `invio`.

Il `-t` indica l'algoritmo di cifratura e `-C` il commento verrà appeso al file con la chiave pubblica. Il commento serve ad identificare la chiave in caso ne avessi più di una.

Ora copia la chiave pubblica generata nella clipboard

``` shell
xclip -sel clip < ~/.ssh/id_ed25519.pub
```

Inserisci la chiave in GitLab

1. Accedi a GitLab.
2. Clicca sul tuo avatar in alto a destra.
3. Vai in _impostazioni_.
3. Nel menù a sinistra seleziona _Chiavi SSH_
4. Segui la descrizione sulla pagina per aggiungere la chiave.

Verifica la connessione

``` shell
ssh -T git@gitlab.example.com
```

Se funziona riceverai questo messaggio

``` shell
The authenticity of host 'gitlab.example.com (35.231.145.151)' can't be established.
ECDSA key fingerprint is SHA256:HbW3g8zUjNSksFbqTiUWPWg2Bq1x8xdGUrliXFzSnUw.
Are you sure you want to continue connecting (yes/no)?
```

Digita `yes`

```
Warning: Permanently added 'gitlab.example.com' (ECDSA) to the list of known hosts.
```

## Git Workflow

### Crea Primo Progetto GitLab

1. Crea un [nuovo blank project][gitlab-new-project].
2. Inserisci in _Project slug_ `primo-repo`, il titolo verrà automaticamente aggiornato.
2. Assegna il _Visibility Level_ a `Pubblico`.
3. Clicca su _Create Project_.

### Crea un Repository

Inizializza il repository git

``` shell
mkdir ~/primo-repo                                                  # crea la directory repo nella home
cd ~/primo-repo/                                                    # cambia directory in `repo`
git init                                                            # inizializza il repository
```

### Inserisci il remote

Collega il repository git locale a al progetto creato su GitLab

``` shell
git remote add origin git@gitlab.com:stindrago/primo-repo.git
```

### Commit

Aggiungi le modifiche

``` shell
git add .
git commit -m "Inizializza repo"
```

Ora le tue modifiche sono state aggiunte in locale.

### Push

Invia le modifiche effettuate al repository remoto

``` shell
git push -u origin master
```

### Clona Repository

Una volta che hai creato il progetto puoi clonarlo su diverse macchine.
Clona il repository delle challenge, clicca sul pulsante blu _Clona_ e copia il testo sotto _Clone with SSH_.

``` shell
git clone git@gitlab.com:stindrago/pirmo-repo.git       # clona il repository
```

- `git@` indica l'utilizzo di un collegamento ssh
- `:stindrago` e' il nome utente.
- `/primo-repo.git` e' il percorso del repository.

> Se utilizzassi invece collegamento `https://` ad ogni aggiornamento del repository ti verrà chiesto di inserire le credenziali, noioso...

### Branching

I branch (ramo) vengono utilizzati per sviluppare funzionalità isolate l'una dall'altra. Il branch principale è il _master_ e viene creato quando crei il repository. Ci sono diversi workflow, ogni uno usa il branching in modo diverso.

[!branching][image-branching]

Crea due nuovi branch `feature-a` e `feature-b`. Git ti posiziona automaticamente nel branch creato.

``` shell
git checkout -b feature-a
git checkout -b feature-b
```

`checkout` e' la funzione per cambiare branch.
`-b` e' la funzione per aggiungere un nuovo branch.

Torna in `master`

``` shell
git checkout master
```

Visualizza tutti i branch del repository

``` shell
git branch
```

Elimina il branch `feature-a`

``` shell
git branch -d feature-a
```

Un branch non è disponibile per gli altri, per ora questi branch esistono solo in locale.
Per renderli disponibili nel proprio repository remoto devi fare il push

``` shell
git push origin feature-b
```

### Update e Merge

Aggiorna il tuo repository locale al commit più recente rispetto al repository remoto

``` shell
git pull
```

Git cosi fa il _fetch_ e il _merge_ in modo automatico.

Fai il merge del branch `feature-b` nel branch attivo `master`.

``` shell
git merge <branch>
```

> `git checkout master` per cambiare il branch attivo in `master`.

Git tenta di unire automaticamente le modifiche. Sfortunatamente, questo non è sempre possibile e certe volte avvengono conflitti. Sei responsabile di unire questi conflitti manualmente modificando i file mostrati da git. Dopo la modifica è necessario contrassegnarli come uniti con
`git add <file>`.

Prima di unire le modifiche, puoi visualizzarle in anteprima

``` shell
git diff feature-b master
```

### Tag

E' consigliato creare tag per le versioni software. Questo è indispensabile se il tuo software ha delle realease per il pubblico. Oltre a questo ti aiuta ad organizzare meglio i tuoi progetti.

Crea un nuovo tag `makerspace`

``` shell
git tag makerspace
```

Puoi connettere il tag ad un commit aggiungendo dopo il nome l'id del commit

``` shell
git tag makerspace b0c623b6b1
```

> Usa `git log` per trovare l'id del commit.

### Log

Visita la storia dei commit del repository

``` shell
git log
```

Visita solo la storia dei commit aggiunti da te

``` shell
git log --author="Costin"
```

## Fork

- TODO

## Merge Request

- TODO

## Inizia ad usare i dotfile

- TODO

## Riassunto

- TODO

## Challenge 4

- Fai il fork del repository [challenges][challenges].
- Crea una directory personale con l'username di gitlab in `challenge-3/deliverable/`.
- Crea un file `.gitkeep` in `challenge-3/sandbox/nome-utente-gitlab`.
- Aggiungi le modifiche al repository fork.
- Inizia una _Merge Request_ dal repository fork a quello padre [challenges][challenges].

> Come `nome-utente-gitlab` utilizza il tuo nome utente GitLab. 
