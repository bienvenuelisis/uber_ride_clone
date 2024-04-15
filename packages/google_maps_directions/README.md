<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

# Get directions shortest route/leg between two points & calculate distances, durations with Google_Maps Directions API

Documentation française accessible [ici](https://github.com/bienvenuelisis/google_maps_directions/blob/main/README-FR.md).

## Features

- Get directions between two points.
- Calculate distance or duration (corresponding to shortest route distance /duration evaluation) between two points.
- Get shortest route between/leg two points.

## Getting started

- AddressPoint : Object with latitude and longitude.
- DirectionRoute : Path on foot, motorcycle, train, or car between two points.

## Usage

You need to have a valid Google Maps Routes API Key.

```dart
const String googleAPIKey = "GOOGLE_API_KEY";

//You can init the Package with this API_Key so you don't have to pass it as an argument to it's methods.

GoogleMapsDirections.init(googleAPIKey: googleAPIKey);
```

### Directions

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

You can draw a route between the two addresses on a Map using [google_maps_flutter](https://pub.dev/packages/google_maps_flutter) and [flutter_polyline_points](https://pub.dev/packages/flutter_polyline_points) packages.

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

You can also give indications for each stage of a route. A more complete demonstration is provided in [example directory](github.dev/bienvenuelisis/google_maps_directions/tree/main/example).

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

DistanceValue distanceBetween = await gmd.distance(9.2460524, 1.2144565, 6.1271617, 1.2345417, googleAPIKey : googleAPIKey); //gmd.distance(9.2460524, 1.2144565, 6.1271617, 1.2345417) or without passing the API_KEY if the plugin is already initialized with it's value.

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

## Issues | Features requests

Feel free to submit issues, suggestions or features requests on this [package issues tracker](https://github.com/bienvenuelisis/google_maps_directions/issues).
