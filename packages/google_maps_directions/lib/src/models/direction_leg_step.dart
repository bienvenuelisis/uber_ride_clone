// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'address_point.dart';
import 'direction_leg_polyline.dart';
import 'distance_value.dart';
import 'duration_value.dart';

class DirectionLegStep extends Equatable {
  const DirectionLegStep({
    required this.distance,
    required this.duration,
    required this.endLocation,
    required this.htmlInstructions,
    required this.polyline,
    required this.startLocation,
    required this.travelMode,
    this.maneuver,
  });

  factory DirectionLegStep.fromJson(Map<String, dynamic> json) =>
      DirectionLegStep(
        distance: DistanceValue.fromJson(json["distance"]),
        duration: DurationValue.fromJson(json["duration"]),
        endLocation: AddressPoint.fromJson(json["end_location"]),
        htmlInstructions: json["html_instructions"],
        polyline: DirectionLegPolyline.fromJson(json["polyline"]),
        startLocation: AddressPoint.fromJson(json["start_location"]),
        travelMode: json["travel_mode"],
        maneuver: json["maneuver"],
      );

  final DistanceValue distance;
  final DurationValue duration;
  final AddressPoint endLocation;
  final String htmlInstructions;
  final String? maneuver;
  final DirectionLegPolyline polyline;
  final AddressPoint startLocation;
  final String travelMode;

  @override
  List<Object> get props {
    return [
      distance,
      duration,
      endLocation,
      htmlInstructions,
      maneuver ?? "",
      polyline,
      startLocation,
      travelMode,
    ];
  }

  @override
  bool get stringify => true;

  DirectionLegStep copyWith({
    DistanceValue? distance,
    DurationValue? duration,
    AddressPoint? endLocation,
    String? htmlInstructions,
    DirectionLegPolyline? polyline,
    AddressPoint? startLocation,
    String? travelMode,
    String? maneuver,
  }) =>
      DirectionLegStep(
        distance: distance ?? this.distance,
        duration: duration ?? this.duration,
        endLocation: endLocation ?? this.endLocation,
        htmlInstructions: htmlInstructions ?? this.htmlInstructions,
        polyline: polyline ?? this.polyline,
        startLocation: startLocation ?? this.startLocation,
        travelMode: travelMode ?? this.travelMode,
        maneuver: maneuver ?? this.maneuver,
      );

  Map<String, dynamic> toJson() => {
        "distance": distance.toJson(),
        "duration": duration.toJson(),
        "end_location": endLocation.toJson(),
        "html_instructions": htmlInstructions,
        "polyline": polyline.toJson(),
        "start_location": startLocation.toJson(),
        "travel_mode": travelMode,
        "maneuver": maneuver,
      };
}
