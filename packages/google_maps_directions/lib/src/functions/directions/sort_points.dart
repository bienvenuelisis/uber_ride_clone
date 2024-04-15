import '../../models/address_point_mixin.dart';
import '../computation/distance.dart';

///Sort list of points from their distance to one point (ascendant or descendant)
///
///@throw [DirectionsException].
///
///
/// Example:
///
/// ```dart
/// import "package:google_maps_directions/google_maps_directions.dart" as gmd;
///
///List<LatLng> points = [LatLng(9.2460524, 1.2144565), LatLng(9.53535, 1.435353)];
///LatLng origin = LatLng(9.334344, 1.34347343);
///List<LatLng> pointsSorted = await gmd.sort(origin.lat, origin.lng, points);//by the closest from origin
/// ```
/// {@end-tool}
Future<List<T>> sort<T extends AddressPointMixin>(
  double originLat,
  double originLng,
  List<T> points, {
  String? googleAPIKey,
  bool asc = true,
}) async {
  List<_PointDistance<T>> distances = [];

  for (var point in points) {
    int d = await distanceInMeters(
      originLat,
      originLng,
      point.lat,
      point.lng,
      googleAPIKey: googleAPIKey,
    );

    distances.add(_PointDistance(point, d));
  }

  sort(_PointDistance d1, _PointDistance d2) =>
      d1.distance.compareTo(d2.distance);

  distances.sort(sort);

  return (asc ? distances : distances.reversed).map((pd) => pd.point).toList();
}

class _PointDistance<T extends AddressPointMixin> {
  _PointDistance(this.point, this.distance);

  final int distance;
  final T point;
}
