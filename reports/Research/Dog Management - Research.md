# Dog Management - Research

## Hoe werkt de App?

### Hoe voer je de app uit?

*Ik ga er van uit dat u het project al gecloned hebt en lokaal ergens hebt staan en het project in Visual Studio Code open staat.*

### Flutter en Firebase versie

Als je Flutter nog niet op je pc aanwezig is kan je dit downloaden via deze link: https://docs.flutter.dev/get-started/install alsook in **Visual Studio Code** ga je de extension **Flutter** en **Dart** nodig hebben. Firebase is automatisch verbonden met de app dus daarvoor hoeft u niks te doen.
Vanaf nu kan je de Flutter app runnen maar waar wil je de applicatie deployen? Rechts onderaan in **Visual Studio Code** staat de geselecteerde platform waarop je de app zal deployen.
![flutter_devices](https://i.imgur.com/QBKiUku.png)

Voor Desktop kan u gemakkelijk **Edge** of **Chrome** gebruiken voor de app te tonen. Maar de app is natuurlijk gemaakt voor mobiele devices daarvoor is een emulator zeer handig, die kan u via **Android Studio** gebruiken. 
Via deze link https://developer.android.com/studio kan u dit downloaden en gebruiken.
Voor een lokaal Android toestel gaat u deze via een usb kabel aan de pc moeten hangen en USB debugging in de developer settings moeten aanzetten.

Van zodra dit allemaal goed staat kan u via de **main.dart** file rechtsboven op de start knop klikken 
![flutter_run](https://i.imgur.com/mqP3Z8W.png)

Of via de terminal in **Visual Studio Code** het commando `flutter run` uitvoeren (let wel op dat je in de juiste folder zit in de terminal **\src\dog_management**).
En de app zou vanzelf het start scherm geven en is klaar voor gebruik.

### Node JS versie

***Deze versie werkt op de vanilla-api branch***
Als eerste ga je de api moeten starten, waarvoor je NodeJs nodig hebt. Als je NodeJS nog niet zou hebben kan je het via deze link https://nodejs.org/en downloaden.
Na het installeren van NodeJs kan je in de terminal van uw **Visual Studio Code** de api starten, maar eerst zien als je wel in de map zit van het api project. Als dit niet het geval is kan je via dit commando `cd .\src\dog_api\` naar de juiste folder navigeren. 
Vanaf je in de juiste folder zit kan je het commando `npm start` uitvoeren en zou u dit scherm te zien moeten krijgen: ![Api_start](https://i.imgur.com/duYUcy9.png) Dit wil zeggen dat de api actief is en aanspreekbaar is voor de app, je kan dit testen door in de browser naar http://localhost:5001/api/dogs te surfen.

Nu dat de api actief is kunnen we de Flutter app uitvoeren en ook gebruiken, je gaat alleen in de code een kleine aanpassing moeten doen. In het bestand "**dog_apiservice.dart**" ga je het IP-adres van de baseUrl moeten vervangen door uw eigen IP-adres, dat je kan opvragen in je **command Prompt** met **ipconfig**. Zodat de app verbinding met de api kan maken. (flutter tutorial staat hierboven, zorg wel dat je op de juiste branch zit (**vanilla-api** branch))

### Flutter - app

Van zodra je de app opent zal je een pagina krijgen met alle honden die aanwezig zijn op de app en die vanuit de Firebase opgehaald worden. Je kan dan doorklikken naar elke individuele hond om dan de informatie en wandelingen van die specifieke hond te krijgen, alsook de hond verwijderen indien u dit wenst te doen.
Op de wandeling pagina kan u een wandeling starten en dit volgen op de kaart samen met een timer hoelang je al aan het wandelen bent.

Via de Homepage kan u ook op een knop drukken om zo een hond toe te voegen met een formulier dat u dan invult met de juiste gegevens, het formulier is ook voorzien op validatie zodat alles wat moet ingevuld worden ook gecontroleerd wordt als het is ingevuld door de gebruiker. 

Alles van informatie, toevoegen en verwijderen van de honden staat in een FIrebase  (meer info [hieronder](#NodeJS - api)), de Flutter app maakt zelf de responses en de requests naar de api en zet alles dan ook om naar de juist data.

#### Technische kant 

Flutter is een open source framework door Google voor het maken van multi-platform applicaties, en werkt met verschillende widgets om de pagina's op te bouwen. Daarmee is de opbouw van de code met allemaal verschillende widgets. Mijn app is opgebouwd uit verschillende pagina's, model en een service class.

#### Pages

- **main.dart**
  - De root van alle pagina's, deze wordt altijd opgebouwd als je de app opstart.
- **home_page.dart**
  - Deze pagina wordt op geroepen op de **main.dart**, en staat in voor het tonen van de cards waarin alle honden te zien zijn. Vanaf je een hond aanklikt kom je uit op de **overview.dart.** Of je kan op de plus knop klikken om een hond toe te voegen op **add_dog.dart**.
- **overview.dart**
  - Vanaf je een hond aanklikt op de **home_page.dart** kom je op deze pagina terecht, op deze pagina krijg je een navigationbar te zien met info en walks. Standaard wordt de **dog_overview.dart** getoond.
- **dog_overview.dart**
  - Alle informatie van de geselecteerd hond krijg je hier te zien alsook de mogelijkheid om de hond te verwijderen.
- **walk_map.dart**
  - Toont de lokale kaart samen met een timer op een wandeling te tracken.
- **add_dog.dart**
  - Op deze pagina kan je een hond toevoegen met een formulier die voorzien is van validatie.

#### Model

- **dog.dart**
  - Gebruikt voor de api response met de juiste properties in te vullen.

#### Service

- **dog_apiservice.dart**
  - De hoofd service die alle verbindingen met de api aansturen en ontvangen
- **dog_firestoreservice.dart**
  - De service die instaat voor het ophalen van de data uit de firestore alsook het toevoegen en verwijderen van honden

- **dog_mockservice.dart**
  - Mock service die in het begin van het project gebruikt werd maar nu niet meer nodig is met de api

### Firebase - cloud service

Firebase is een backend cloud service waarin je al de data die je gebruikt kan bijhouden in databases (firestore). Firebase is ook gemakkelijk te integreren in een Flutter project en kan dan zo gemakkelijk gebruik maken van de database en andere services. 
Mijn Firebase staat vooral in voor het gebruik van data voor alle honden en afbeeldingen. 

### NodeJS - api

*Deze zal standaard altijd op poort 5001 draaien, dus http://localhost:5001/api/dogs om alle honden te bekijken*

De api heeft een JSON file genaamd **dogs.json** waarin alle data wordt bijgehouden, met de methodes maken we de verschillende endpoints (get, post, put en delete). In de **util** folder vinden we de bestanden **body-parser.js** en **write-to-file.js** deze zorgen ervoor dat inkomende data van de app terecht komt in de **dogs.json**. 

Maar waar alles echt gebeurd is in de **server.js** daar staan de endpoints ingesteld en ook het poort nummer van de server, deze staat in zodat de api draait en je ermee kunt verbinden.

## Bronnen

### Flutter - app

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
