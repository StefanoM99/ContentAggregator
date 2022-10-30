# ContentAggregator

__Componenti del gruppo__:
- [Luca Di Matteo (1655150)](https://github.com/dimatteoluca);
- [Antonino Foti (1799048)](https://github.com/antonysmart);
- [Stefano Mazziotta (1793017)](https://github.com/StefanoM99).

__Descrizione__:
ContentAggregator è un’applicazione che punta ad aggregare contenuti fruibili da differenti piattaforme online. I contenuti 
identificabili tramite URL, possono essere di diversa tipologia (video, immagini, articoli, ecc.) e di diversa categoria (notizie, 
cucina, sport, tecnologia, ecc.). Possono essere filtrati in base alla tipologia, alla categoria e al luogo di interesse.
L’app prevede tre diversi __ruoli__:
- <u>utente non registrato</u>: può visualizzare parte dei contenuti senza poterci interagire; può registrarsi
al servizio attraverso il servizio stesso oppure mediante Google o Twitter (tramite __OAuth__);
- <u>utente registrato</u>: ha la possibilità di modificare le informazioni del proprio profilo e di eliminarlo;
può creare post, visualizzabili nella home e nella propria pagina profilo, e interagire con essi
attraverso operazioni di modifica ed eliminazione; può inoltre interagire con i post di qualsiasi
utente mediante le operazioni di aggiunta ai preferiti (che li renderà visibili nella propria pagina di
profilo), segnalazione e commento;
- <u>admin</u>: ha la possibilità di visualizzare i post segnalati e di eliminarli.

L’app prevede la possibilità di effettuare una ricerca degli utenti registrati e l’interazione tra essi
mediante l’operazione “segui”, che renderà i post dell’utente seguito visualizzabili nella propria
home page.
È inoltre presente un help-bot col quale è possibile interagire per accedere a informazioni di
carattere generale.

__API esterne__:
- Twitter (interazione tweet);
- OpenWeather (meteo);
- News;
- Google Safe Browsing (affidabilità link).

## USER STORIES

1. Come utente registrato, voglio creare un post, da inserire al feed;
1. Come utente registrato, voglio visualizzare un post nel feed;
1. Come utente registrato, voglio modificare un post del feed;
1. Come utente registrato, voglio eliminare un post del feed;
1. Come utente registrato, voglio mettere “preferito” ad un post del feed;
1. Come utente registrato, voglio segnalare un post del feed;
1. Come utente registrato o non registrato, voglio visualizzare un articolo (NewsAPI) nel feed;
1. Come utente registrato, voglio mettere “preferito” ad un articolo (NewsAPI) del feed;
1. Come utente registrato, voglio segnalare un articolo (NewsAPI) del feed;
1. Come utente registrato o non registrato, voglio visualizzare una playlist (Spotify API) nel feed;
1. Come utente registrato, voglio mettere “preferito” ad una playlist (Spotify API) del feed;
1. Come utente registrato, voglio segnalare una playlist (Spotify API) del feed;
1. Come utente registrato o non registrato, voglio visualizzare il meteo (OpenWeather API) nel feed;
1. Come admin, voglio visualizzare post segnalato;
1. Come admin, voglio eliminare post segnalato;
1. Come admin, voglio eliminare gli altri account;
1. Come utente registrato, voglio aggiungere un commento collegato ad un post od un articolo (NewsAPI) del feed;
1. Come utente registrato o non registrato, voglio selezionare la categoria (notizie, cucina, sport, tecnologia, ecc.) degli articoli (NewsAPI) del feed;
1. Come utente registrato o non registrato, voglio selezionare la tipologia dei contenuti del feed;
1. Come utente registrato o non registrato, voglio selezionare il luogo geografico degli articoli (NewsAPI) del feed;
1. Come utente registrato o non registrato, voglio selezionare il luogo geografico del meteo (OpenWeather API) del feed;
1. Come utente registrato, voglio accedere all’help-bot (informazioni, contatti);
1. Come utente non registrato, voglio creare un profilo locale;
1. Come utente non registrato, voglio creare un profilo con OAuth Google API;
1. Come utente non registrato, voglio creare un profilo con OAuth Twitter API;
1. Come utente registrato, voglio modificare il nome;
1. Come utente registrato, voglio modificare il cognome;
1. Come utente registrato, voglio modificare l’immagine di profilo;
1. Come utente registrato, voglio modificare lo username;
1. Come utente registrato, voglio modificare la password;
1. Come utente registrato, voglio eliminare l’account;
1. Come utente registrato, voglio visualizzare i post creati nella pagina profilo;
1. Come utente registrato, voglio eliminare i post creati dalla pagina profilo;
1. Come utente registrato, voglio visualizzare i post modificati nella pagina profilo;
1. Come utente registrato, voglio eliminare i post modificati dalla pagina profilo;
1. Come utente registrato, voglio visualizzare i post “preferiti” nella pagina profilo;
1. Come utente registrato, voglio eliminare i post “preferiti” dalla pagina profilo;
1. Come utente registrato, voglio visualizzare i post segnalati nella pagina profilo;
1. Come utente registrato, voglio eliminare i post segnalati dalla pagina profilo;
1. Come utente registrato, voglio visualizzare gli articoli (NewsAPI) “preferiti” nella pagina profilo;
1. Come utente registrato, voglio eliminare gli articoli (NewsAPI) “preferiti” dalla pagina profilo;
1. Come utente registrato, voglio visualizzare gli articoli (NewsAPI) segnalati nella pagina profilo;
1. Come utente registrato, voglio eliminare gli articoli (NewsAPI) segnalati dalla pagina profilo;
1. Come utente registrato, voglio visualizzare le playlist (Spotify API) “preferiti” nella pagina profilo;
1. Come utente registrato, voglio eliminare le playlist (Spotify API) “preferiti” dalla pagina profilo; 
1. Come utente registrato, voglio visualizzare le playlist (Spotify API) segnalati nella pagina profilo;
1. Come utente registrato, voglio eliminare le playlist (Spotify API) segnalati dalla pagina profilo;
1. Come utente registrato e non, voglio ricercare utenti registrati;
1. Come utente registrato e non, voglio visualizzare la pagina profilo degli utenti;
1. Come utente registrato, voglio visualizzare gli utenti registrati seguiti;

## COMANDI UTILI

```bash
bundle install
```

```bash
EDITOR="code --wait" bin/rails credentials:edit
```

```bash
rails db:migrate
```

```bash
rails server
```

```bash
cucumber
```

```bash
cucumber --tags @user
```

```bash
rspec
```