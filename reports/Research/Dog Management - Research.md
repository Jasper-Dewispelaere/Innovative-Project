# Dog Management - Research

## Hoe werkt de App?

### Hoe voer je de app uit?

*Ik ga er van uit dat u het project al gecloned hebt en lokaal ergens hebt staan en het project in Visual Studio Code open staat.*

Als eerste ga je de api moeten starten, waarvoor je NodeJs nodig hebt. Als je NodeJS nog niet zou hebben kan je het via deze link https://nodejs.org/en downloaden.
Na het installeren van NodeJs kan je in de terminal van uw **Visual Studio Code** de api starten, maar eerst zien als je wel in de map zit van het api project. Als dit niet het geval is kan je via dit commando `cd .\src\dog_api\` naar de juiste folder navigeren. 
Vanaf je in de juiste folder zit kan je het commando `npm start` uitvoeren en zou u dit scherm te zien moeten krijgen: ![Api_start](https://i.imgur.com/duYUcy9.png) Dit wil zeggen dat de api actief is en aanspreekbaar is voor de app, je kan dit testen door in de browser naar http://localhost:5001/api/dogs te surfen.

Nu dat de api actief is kunnen we de Flutter app uitvoeren en ook gebruiken, je gaat alleen in de code een kleine aanpassing moeten doen. In het bestand "**dog_apiservice.dart**" ga je het IP-adres van de baseUrl moeten vervangen door uw eigen IP-adres, dat je kan opvragen in je **command Prompt** met **ipconfig**. Zodat de app verbinding met de api kan maken.
Als je Flutter nog niet op je pc aanwezig is kan je dit downloaden via deze link: https://docs.flutter.dev/get-started/install alsook in **Visual Studio Code** ga je de extension **Flutter** en **Dart** nodig hebben. 
Vanaf nu kan je de Flutter app runnen maar waar wil je het deployen? Rechts onderaan in **Visual Studio Code** staat de geselecteerde platform waarop je de app zal deployen.
![flutter_devices](https://i.imgur.com/QBKiUku.png)

Voor Desktop kan u gemakkelijk **Edge** of **Chrome** gebruiken voor de app te tonen. Maar de app is natuurlijk gemaakt voor mobiele devices daarvoor is een emulator zeer handig, die kan u via **Android Studio** gebruiken. 
Via deze link https://developer.android.com/studio kan u dit downloaden en gebruiken.
Voor een lokaal Android toestel gaat u deze via een usb kabel aan de pc moeten hangen en USB debugging in de developer settings moeten aanzetten.

Van zodra dit allemaal goed staat kan u via de **main.dart** file rechtsboven op de start knop klikken 
![flutter_run](https://i.imgur.com/mqP3Z8W.png)

Of via de terminal in **Visual Studio Code** het commando `flutter run` uitvoeren (let wel op dat je in de juiste folder zit in de terminal **\src\dog_management**).

### Flutter - app

Van zodra je de app opent zal je een pagina krijgen met alle honden die aanwezig zijn op de app en die vanuit de api opgehaald worden. Je kan dan doorklikken naar elke individuele hond om dan de informatie en wandelingen van die specifieke hond te krijgen, alsook de hond aanpassen en verwijderen indien u dit wenst te doen.
Op de wandeling pagina kan u ook voor elke hond bijhouden wanneer u bent gaan wandelen met de hond, waarbij je de wandeling een naam, datum, tijd en hoeveel km kan ingeven.

Via de Homepage kan u ook op een knop drukken om zo een hond toe te voegen met een formulier dat u dan invult met de juiste gegevens, het formulier is ook voorzien op validatie zodat alles wat moet ingevuld worden ook gecontroleerd wordt als het is ingevuld door de gebruiker. 

Alles van informatie, toevoegen, bewerken en verwijderen van de honden staat in een zelfgemaakte NodeJS api (meer info [hieronder](#NodeJS - api)), de Flutter app maakt zelf de responses en de requests naar de api en zet alles dan ook om naar de juist data.

#### Technische kant 

Flutter is een open source framework door Google voor het maken van multi-platform applicaties, en werkt met verschillende widgets om de pagina's op te bouwen.




### NodeJS - api



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
- https://stackoverflow.com/
  - Heeft ook geholpen voor bepaalde problemen op te lossen





### NodeJS - api

- https://nodejs.org/docs/latest/api/
  - algemene documentatie node js
- https://www.tutorialspoint.com/nodejs/nodejs_restful_api.htm
  - korte maar hulpvolle tutorial voor de basis van de API
- https://www.youtube.com/watch?v=4Z02Lgx4nS0
  - Vanilla CRUD nodejs api, deze tutorial grotendeels gevolgd voor het opzetten van de api
