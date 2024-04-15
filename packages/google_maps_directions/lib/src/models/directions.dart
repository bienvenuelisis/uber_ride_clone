// ignore_for_file: public_member_api_docs, sort_constructors_first
// To parse this JSON data, do
//
//     final directions = directionsFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'direction_geocoded_way_point.dart';
import 'direction_route.dart';

Directions directionsFromJson(String str) =>
    Directions.fromJson(json.decode(str));

String directionsToJson(Directions data) => json.encode(data.toJson());

class Directions extends Equatable {
  const Directions({
    required this.geocodedWaypoints,
    required this.routes,
    required this.status,
  });

  factory Directions.fromJson(Map<String, dynamic> json) => Directions(
        geocodedWaypoints: List<DirectionGeocodedWaypoint>.from(
            json["geocoded_waypoints"]
                .map((x) => DirectionGeocodedWaypoint.fromJson(x))),
        routes: List<DirectionRoute>.from(
            json["routes"].map((x) => DirectionRoute.fromJson(x))),
        status: json["status"],
      );

  final List<DirectionGeocodedWaypoint> geocodedWaypoints;
  final List<DirectionRoute> routes;
  final String status;

  @override
  List<Object> get props => [geocodedWaypoints, routes, status];

  @override
  bool get stringify => true;

  bool get ok => status.toUpperCase() == "OK";
  DirectionRoute get shortestRoute => (routes
        ..sort((r1, r2) => r1.shortestLeg.distanceInMeters
            .compareTo(r2.shortestLeg.distanceInMeters)))
      .first;

  Directions copyWith({
    List<DirectionGeocodedWaypoint>? geocodedWaypoints,
    List<DirectionRoute>? routes,
    String? status,
  }) =>
      Directions(
        geocodedWaypoints: geocodedWaypoints ?? this.geocodedWaypoints,
        routes: routes ?? this.routes,
        status: status ?? this.status,
      );

  Map<String, dynamic> toJson() => {
        "geocoded_waypoints":
            List<dynamic>.from(geocodedWaypoints.map((x) => x.toJson())),
        "routes": List<dynamic>.from(routes.map((x) => x.toJson())),
        "status": status,
      };
}
