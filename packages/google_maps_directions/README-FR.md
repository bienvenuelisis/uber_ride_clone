# Obtenez les directions route/étape la plus courte entre deux points et calculez les distances, les durées avec Google Maps Directions API

## Fonctionnalités

- Obtenez les itinéraires entre deux points.
- Calculer la distance/durée (correspondant à l'évaluation de la distance/trajet de l'itinéraire le plus court) entre deux points.
- Obtenez  la plus courte entre deux points.

## Initialisation

- AddressPoint: Objet avec latitude et longitude.
- DirectionRoute: Itinéraire, chemin à pied, moto, en train ou en voiture entre deux points.

## Utilisation

Vous devez disposer d'une clé API Google Maps Routes valide.

```dart
const String googleAPIKey = "GOOGLE_API_KEY";

//Vous pouvez initialiser le package avec cette API_Key afin de ne pas avoir à le transmettre en tant qu'argument à ses méthodes.

GoogleMapsDirections.init(googleAPIKey: googleAPIKey);
```

### Itinéraires

```dart
import "package:google_maps_directions/google_maps_directions.dart" as gmd;

...

Directions directions = await getDirections(
        p1.lat,
        p1.lng,
        p2.lat,
        p2.lng,
        language: "fr_FR",
      );

DirectionRoute route = directions.shortestRoute;
```

Vous pouvez tracer un itinéraire entre les deux adresses sur une carte à l'aide des packages [google_maps_flutter](https://pub.dev/packages/google_maps_flutter) et [flutter_polyline_points](https://pub.dev/packages/flutter_polyline_points).

```dart
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_directions/google_maps_directions.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

...

DirectionRoute route = directions.shortestRoute;

List<LatLng> points = PolylinePoints().decodePolyline(route.overviewPolyline.points)
   .map((point) => LatLng(point.latitude, point.longitude))
                 .toList();

List<Polyline> polylines = [
 Polyline(
            width: 5,
            polylineId: PolylineId("UNIQUE_ROUTE_ID"),
            color: Colors.green,
            points: points,
          ),
];

...

@override
 Widget build(BuildContext context) {
    return Scaffold(
 body : GoogleMap(
              polylines: Set.of(polylines),
              ...
            ),
       );
}


```

Vous pouvez également donner des indications sur chaque étape d'un itinéraire. Une démonstration plus complète est fourni dans [le répertoire des exemples](https://github.dev/bienvenuelisis/google_maps_directions/tree/main/example).

```dart
import 'package:google_maps_directions/google_maps_directions.dart';

... 


DirectionRoute route = directions.shortestRoute;

DirectionLegStep firstRouteLegStep = route.shortestLeg.steps.first;
print(firstRouteLegStep.htmlInstructions); //At the roundabout, take the exit onto route National 1.
print(firstRouteLegStep.maneuver); //roundabout-right.


```

### Distance

```dart
import "package:google_maps_directions/google_maps_directions.dart" as gmd;

DistanceValue distanceBetween = await gmd.distance(9.2460524, 1.2144565, 6.1271617, 1.2345417, googleAPIKey : googleAPIKey); //gmd.distance(9.2460524, 1.2144565, 6.1271617, 1.2345417) ou sans passer l'API_KEY si le plugin est déjà initialisé avec sa valeur.

int meters = distanceBetween.meters // await gmd.distanceInMeters(9.2460524, 1.2144565, 6.1271617, 1.2345417, googleAPIKey : googleAPIKey);

String textInKmOrMeters = distanceBetween.text // await gmd.distanceText(9.2460524, 1.2144565, 6.1271617, 1.2345417, googleAPIKey : googleAPIKey);
```

### Duration

```dart
import "package:google_maps_directions/google_maps_directions.dart" as gmd;

DurationValue durationBetween = await gmd.duration(9.2460524, 1.2144565, 6.1271617, 1.2345417, googleAPIKey : googleAPIKey);

int seconds = durationBetween.seconds//await gmd.durationInSeconds(9.2460524, 1.2144565, 6.1271617, 1.2345417, googleAPIKey : googleAPIKey);

String durationInMinutesOrHours = gmd.durationBetween.text // await gmd.durationText(9.2460524, 1.2144565, 6.1271617, 1.2345417, googleAPIKey : googleAPIKey);
```
