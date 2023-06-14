# Dog management App met Flutter en Node.js API

## Project Beschrijving
### Wat is het?

Een app waarbij je de informatie en alles errond van je hond(en) gemakkelijk kan bijhouden, een soort van digitale honden identiteitskaart.
Zoals: naam, ras, wanneer geboren, medische informatie, foto's. 
Op de app kan je ook bijhouden wanneer je bent gaan wandelen met de hond(en), die je dan kan bijhouden op een kalender en een wekelijks overzicht.

### Hoe kom je hierbij?

Ik heb zelf thuis honden en al die hun belangrijke informatie die je soms in nood nodig hebt staat op papier en heb je bijna nooit op zak bij, want je weet nooit als er iets gebeurt en je het nodig hebt. 
Alsook de wandelingen zijn handig om zo bij te houden zodat je een snel en duidelijk overzicht hebt hoe vaak ze al zijn buiten geweest.
De app zal ook in verbinding staan met Firebase die alle informatie van de honden zal bijhouden en ook zal doorgeven naar de app.

### Welke technologie?

Ik heb gekozen om de app te ontwikkelen met flutter een open source framework door Google waarbij je gemakkelijk en mooie multi-platform applicaties kan ontwikkelen, is ook heel gemakkelijk om te deployen op verschillende platformen.
Alsook een Node.js API die alle informatie van de honden bijhoudt. Maar na het werken met Node JS toch besloten om met Firebase aan de slag te gaan, Node.js API was heel basic en had weinig mogelijkheden plus elke keer je het project wilt gebruiken moet je de API ook aanleggen en het IP adres instellen, in Firebase is altijd alles actief en bereikbaar zonder moeilijkheden waardoor je niet vast hangt aan de API die wel of niet actief is.

## Extra info


Flutter app kan je gewoon uitvoeren zolang je een werkend apparaat of emulator tot je beschikking hebt, alle data komt vanuit de Firebase dus is altijd actief.
Extra benodigheden voor het uitvoeren van de applicatie en het opzetten van flutter of de Node.JS API (als u deze versie ook wilt zien en testen) is terug te vinden in de **Research** folder onder de **Reports** folder.

## Uiteindelijke Doelen Demo/Prototype

- Honden kunnen toevoegen + informatie
- Honden informatie kunnen aanpassen
- Wandelingen bijhouden
- Foto's toevoegen, verwijderen
- Werkende API


## Roadmap/ Planning

**Week 13/02 - 19/02:** Inspiratie dag + Pitch dag, voorbereidend werk en research flutter

**20/02 - 24/05:** 

- Flutter researchen, documentatie erover bijhouden
- Applicatie coderen (pagina's aanmaken en functioneel maken)
- Alles documenteren en bijhouden in een markdown file

**25/05:** Klassikale review
**26/05 - (Eindpresentatie datum):** Laatste delen afwerken en voorbereiding eindpresentatie


## Bronnenlijst

- - ### Flutter - app
  
    - https://docs.flutter.dev/
      - Meeste informatie van de officiële documentatie gevonden
    - https://www.youtube.com/watch?v=C-fKAzdTrLU
      - Basis flutter tutorial die bij de start van het project een goeie basis was
    - https://docs.flutter.dev/cookbook/persistence/reading-writing-files
      - App data bijhouden zonder database -> uitendelijk toch overgeschakeld naar een api 
    - https://docs.flutter.dev/cookbook/networking/fetch-data & https://docs.flutter.dev/cookbook/networking/send-data
      - Beide goeie basis om data op te halen van de API en een request terug te sturen
    - https://pub.dev/packages/open_street_map_search_and_pick
      - package voor de open_street_map, waarin ook de documentatie staat
    - https://www.youtube.com/watch?v=Bw6zc1nncyA
      - tutorial voor de stopwatch op de wandeling pagina
  
  
    - https://stackoverflow.com/
      - Heeft ook geholpen voor bepaalde problemen op te lossen
  
    ### Firebase - cloud service
  
    - https://firebase.google.com/docs/firestore/query-data/get-data
      - Firebase get data
  
    - https://firebase.google.com/docs/firestore/manage-data/add-data
      - Firebase add data
  
    - https://firebase.google.com/docs/firestore/manage-data/delete-data
      - Firebase delete data
  
  
    ### NodeJS - api
  
    - https://nodejs.org/docs/latest/api/
      - algemene documentatie node js
    - https://www.tutorialspoint.com/nodejs/nodejs_restful_api.htm
      - korte maar hulpvolle tutorial voor de basis van de API
    - https://www.youtube.com/watch?v=4Z02Lgx4nS0
      - Vanilla CRUD nodejs api, deze tutorial grotendeels gevolgd voor het opzetten van de api
