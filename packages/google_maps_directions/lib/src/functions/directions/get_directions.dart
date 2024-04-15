import 'package:google_maps_directions/src/gmd.dart';

import '../../models/address_point.dart';
import '../../models/directions.dart';
import '../../repositories/directions_repository.dart';

///Get the shortest route according to Google Maps between this two points.
///
///@throw [DirectionsException].
Future<Directions> getDirections(
  double lat1,
  double lng1,
  double lat2,
  double lng2, {
  String? googleAPIKey,
  String? mode,
  String? language,
}) async {
  return await DirectionsRepository().get(
    origin: AddressPoint(lat: lat1, lng: lng1),
    destination: AddressPoint(lat: lat2, lng: lng2),
    googleAPIKey: googleAPIKey ?? GoogleMapsDirections.googleApiKey,
    mode: mode,
    language: language,
  );
}
