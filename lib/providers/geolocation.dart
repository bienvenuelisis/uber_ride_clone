import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:location/location.dart';

///Provider that holds the location.
final locationProvider = Provider((ref) => Location()..enableBackgroundMode());

///Provider that holds the location stream.
final locationStreamProvider = StreamProvider<LocationData>((ref) {
  ref.onDispose(() {});

  return ref.watch(locationProvider).onLocationChanged;
});

///Provider that holds the location service enabled.
final locationServiceProvider = FutureProvider.autoDispose<bool>(
  (ref) => ref.watch(locationProvider).serviceEnabled(),
);

///Provider that holds the location data.
final locationDataProvider = FutureProvider.autoDispose<LocationData?>(
  (ref) => ref.watch(locationProvider).getLocation(),
);
