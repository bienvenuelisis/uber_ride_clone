import '../../models/duration_value.dart';
import '../directions/shortest_leg.dart';

///Get the shortest route leg duration according to Google Maps between this two points.
///
///@throw [DirectionsException].
///
/// Example:
///
/// ```dart
/// import "package:google_maps_directions/google_maps_directions.dart" as gmd;
///
/// int duration = await gmd.duration(9.2460524, 1.2144565, 6.1271617, 1.2345417);
/// print(duration.seconds);//12051
/// print(duration.text);//"3 hours 21 mins"
/// ```
/// {@end-tool}
Future<DurationValue> duration(
  double lat1,
  double lng1,
  double lat2,
  double lng2, {
  String? googleAPIKey,
}) async {
  return (await shortestLeg(
    lat1,
    lng1,
    lat2,
    lng2,
    googleAPIKey: googleAPIKey,
  ))
      .duration;
}

///Get the shortest route leg duration in seconds according to Google Maps between this two points.
///
///@throw [DirectionsException].
///
/// Example:
///
/// ```dart
/// import "package:google_maps_directions/google_maps_directions.dart" as gmd;
///
/// int durationSeconds = await gmd.durationInSeconds(9.2460524, 1.2144565, 6.1271617, 1.2345417);
/// print(durationSeconds);//12051
/// ```
/// {@end-tool}
Future<int> durationInSeconds(
  double lat1,
  double lng1,
  double lat2,
  double lng2, {
  String? googleAPIKey,
}) async {
  return (await duration(
    lat1,
    lng1,
    lat2,
    lng2,
    googleAPIKey: googleAPIKey,
  ))
      .seconds;
}

///Get the shortest route duration as a text according to Google Maps between this two points.
///
///@throw [DirectionsException].
///
/// Example:
///
/// ```dart
/// import "package:google_maps_directions/google_maps_directions.dart" as gmd;
///
/// int durationText = await gmd.durationText(9.2460524, 1.2144565, 6.1271617, 1.2345417);
/// print(durationText);//"3 hours 21 mins"
/// ```
/// {@end-tool}
Future<String> durationText(
  double lat1,
  double lng1,
  double lat2,
  double lng2, {
  String? googleAPIKey,
}) async {
  return (await duration(
    lat1,
    lng1,
    lat2,
    lng2,
    googleAPIKey: googleAPIKey,
  ))
      .text;
}
