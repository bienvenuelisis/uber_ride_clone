import 'package:google_maps_directions/src/gmd.dart';
import 'package:google_maps_directions/src/models/direction_route.dart';

import 'get_directions.dart';

///Get the shortest route according to Google Maps between this two points.
///
///@throw [DirectionsException].
Future<DirectionRoute> shortestRoute(
  double lat1,
  double lng1,
  double lat2,
  double lng2, {
  String? googleAPIKey,
}) async {
  return (await getDirections(
    lat1,
    lng1,
    lat2,
    lng2,
    googleAPIKey: googleAPIKey ?? GoogleMapsDirections.googleApiKey,
  ))
      .shortestRoute;
}
