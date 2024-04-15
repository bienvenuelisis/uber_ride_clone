import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_directions/google_maps_directions.dart' as gmd;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uber_ride_clone/presentation/ui/screens/maps/providers/destination_place_id_provider.dart';
import 'package:uber_ride_clone/presentation/ui/screens/ride_details/components/google_maps_mixins.dart';
import 'package:uber_ride_clone/presentation/ui/screens/ride_details/services/get_place_details_from_id.dart';
import 'package:uber_ride_clone/providers/geolocation.dart';

///Screen with Map showing information about ride and main road between origin
///and destination.
class RideConfirmPlanMapScreen extends ConsumerStatefulWidget {
  ///Default Constructor
  const RideConfirmPlanMapScreen({
    super.key,
  });

  @override
  ConsumerState<RideConfirmPlanMapScreen> createState() =>
      _RideConfirmPlanMapScreenState();
}

class _RideConfirmPlanMapScreenState
    extends ConsumerState<RideConfirmPlanMapScreen>
    with GoogleMapsControllerMixin {
  late LatLng? _departure;
  late LatLng? _destination;
  late ValueNotifier<GoogleMapController?> _mapControllerNotifier;
  late gmd.DirectionRoute? _shortestRoute;

  @override
  void dispose() {
    /// Remove listeners
    _mapControllerNotifier.removeListener(_animateCameraToDeparture);

    super.dispose();
  }

  @override
  void initState() {
    _mapControllerNotifier = ValueNotifier(null);
    _departure = null;
    _destination = null;
    _shortestRoute = null;

    ///When map controller is set animate to departure camera position.
    _mapControllerNotifier.addListener(_animateCameraToDeparture);

    super.initState();

    // ignore: discarded_futures
    _loadDepartureDestination();
  }

  @override
  GoogleMapController get mapController => _mapControllerNotifier.value!;

  GoogleMapController get controller => _mapControllerNotifier.value!;
  LatLng? get departure => _departure;
  LatLng get departureSafe => _departure!;
  LatLng? get destination => _destination;
  LatLng get destinationSafe => _destination!;
  AsyncValue<bool> get locationService => ref.watch(locationServiceProvider);
  bool get locationServiceEnabled =>
      locationService.hasValue && locationService.value!;

  gmd.DirectionRoute? get route => _shortestRoute;
  gmd.DirectionRoute get routeSafe => _shortestRoute!;

  set controller(GoogleMapController controller) {
    setState(() {
      _mapControllerNotifier.value = controller;
    });
  }

  void _animateCameraToDeparture() {
    if (_mapControllerNotifier.value == null) {
      return;
    }

    if (departure != null) {
      unawaited(
        controller.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: departureSafe,
              zoom: 14,
            ),
          ),
        ),
      );
    }
  }

  Future<void> _findDestinationLocation() async {
    final placeId = ref.read(destinationPlaceIdProvider);

    if (placeId == null) {
      return;
    }

    final destination = ref.read(
      getPlaceDetailsFromId(
        placeId,
      ).future,
    );

    // ignore: cascade_invocations
    final destinationDetails = await destination;

    if (destinationDetails == null ||
        destinationDetails.result == null ||
        destinationDetails.result!.geometry == null ||
        destinationDetails.result!.geometry!.location == null) {
      return;
    }

    setState(() {
      _destination = LatLng(
        destinationDetails.result!.geometry!.location!.lat!,
        destinationDetails.result!.geometry!.location!.lng!,
      );
    });

    await _findShortestRoute();
  }

  Future<void> _findShortestRoute() async {
    _shortestRoute = await gmd.shortestRoute(
      departureSafe.latitude,
      departureSafe.longitude,
      destinationSafe.latitude,
      destinationSafe.longitude,
    );

    if (context.mounted) {
      if (_mapControllerNotifier.value == null) {
        _mapControllerNotifier.addListener(() {
          drawMarkersAndRouteOnMap(
            pickUp: departureSafe,
            destination: destinationSafe,
            polylinePoints: _shortestRoute!.overviewPolyline.points,
          );
        });
      } else {
        drawMarkersAndRouteOnMap(
          pickUp: departureSafe,
          destination: destinationSafe,
          polylinePoints: _shortestRoute!.overviewPolyline.points,
        );
      }
    }
  }

  Future<void> _loadDepartureDestination() async {
    final actualLocation = await ref.read(locationProvider).getLocation();

    setState(() {
      _departure = LatLng(
        actualLocation.latitude!,
        actualLocation.longitude!,
      );
    });

    await _findDestinationLocation();
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      myLocationButtonEnabled: locationServiceEnabled,
      myLocationEnabled: locationServiceEnabled,
      onMapCreated: (controller) {
        this.controller = controller;
      },
      initialCameraPosition: const CameraPosition(target: LatLng(0, 0)),
      polylines: Set.of(polylines),
      markers: Set.of(markers),
      circles: Set.of(circles),
    );
  }
}
