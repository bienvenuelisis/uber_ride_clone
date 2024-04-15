// ignore_for_file: public_member_api_docs

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

mixin GoogleMapsControllerMixin {
  final List<Circle> _circles = [];
  final List<Marker> _markers = [];
  final List<Polyline> _polylines = [];

  List<Circle> get circles => _circles;
  GoogleMapController get mapController;
  List<Marker> get markers => _markers;
  List<Polyline> get polylines => _polylines;

  set circles(List<Circle> circles) {
    setState(() {
      _circles
        ..clear()
        ..addAll(circles);
    });
  }

  void drawMarkersAndRouteOnMap({
    required LatLng pickUp,
    required LatLng destination,
    required String polylinePoints,
  }) {
    final points = PolylinePoints()
        .decodePolyline(polylinePoints)
        .map((point) => LatLng(point.latitude, point.longitude))
        .toList();

    polylines = [
      Polyline(
        polylineId: PolylineId(
          '''${pickUp.latitude}-${pickUp.longitude}|${destination.latitude}-${destination.longitude}''',
        ),
        points: points,
        color: const Color.fromARGB(255, 95, 109, 237),
        jointType: JointType.round,
        width: 4,
        startCap: Cap.roundCap,
        endCap: Cap.roundCap,
        geodesic: true,
      ),
    ];

    circles = [
      Circle(
        circleId: CircleId(
          '${pickUp.latitude}-${pickUp.longitude}',
        ),
        strokeColor: Colors.green,
        strokeWidth: 3,
        radius: 12,
        center: pickUp,
        fillColor: Colors.green,
      ),
      Circle(
        circleId: CircleId(
          '${destination.latitude}-${destination.longitude}',
        ),
        strokeColor: Colors.purple,
        strokeWidth: 3,
        radius: 12,
        center: destination,
        fillColor: Colors.purple,
      ),
    ];

    markers = [
      Marker(
        markerId: MarkerId(
          '${pickUp.latitude}-${pickUp.longitude}',
        ),
        position: pickUp,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
        // infoWindow: InfoWindow(
        //   title: pickUp.placeId,
        //   snippet: 'My Location',
        // ),
      ),
      Marker(
        markerId: MarkerId(
          '${destination.latitude}-${destination.longitude}',
        ),
        position: destination,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        // infoWindow: InfoWindow(
        //   title: dest.placeId,
        //   snippet: 'Destination',
        // ),
      ),
    ];

    _animateCameraToShowRoute(
      pickUp: pickUp,
      destination: destination,
    );
  }

  set markers(List<Marker> markers) {
    setState(() {
      _markers
        ..clear()
        ..addAll(markers);
    });
  }

  set polylines(List<Polyline> polylines) {
    setState(() {
      _polylines
        ..clear()
        ..addAll(polylines);
    });
  }

  void setState(VoidCallback fn);

  void _animateCameraToShowRoute({
    required LatLng pickUp,
    required LatLng destination,
  }) {
    LatLngBounds bounds;

    if (pickUp.latitude > destination.latitude &&
        pickUp.longitude > destination.longitude) {
      bounds = LatLngBounds(
        southwest: destination,
        northeast: pickUp,
      );
    } else if (pickUp.longitude > destination.longitude) {
      bounds = LatLngBounds(
        southwest: LatLng(pickUp.latitude, destination.longitude),
        northeast: LatLng(
          destination.latitude,
          pickUp.longitude,
        ),
      );
    } else if (pickUp.latitude > destination.latitude) {
      bounds = LatLngBounds(
        southwest: LatLng(destination.latitude, pickUp.longitude),
        northeast: LatLng(pickUp.latitude, destination.longitude),
      );
    } else {
      bounds = LatLngBounds(
        southwest: pickUp,
        northeast: destination,
      );
    }

    unawaited(
      mapController.animateCamera(
        CameraUpdate.newLatLngBounds(bounds, 70),
      ),
    );
  }
}
