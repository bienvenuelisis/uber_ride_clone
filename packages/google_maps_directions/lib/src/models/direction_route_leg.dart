// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'address_point.dart';
import 'direction_leg_step.dart';
import 'distance_value.dart';
import 'duration_value.dart';

class DirectionRouteLeg extends Equatable {
  const DirectionRouteLeg({
    required this.distance,
    required this.duration,
    required this.endAddress,
    required this.endLocation,
    required this.startAddress,
    required this.startLocation,
    required this.steps,
    required this.trafficSpeedEntry,
    required this.viaWaypoint,
  });

  factory DirectionRouteLeg.fromJson(Map<String, dynamic> json) =>
      DirectionRouteLeg(
        distance: DistanceValue.fromJson(json["distance"]),
        duration: DurationValue.fromJson(json["duration"]),
        endAddress: json["end_address"],
        endLocation: AddressPoint.fromJson(json["end_location"]),
        startAddress: json["start_address"],
        startLocation: AddressPoint.fromJson(json["start_location"]),
        steps: List<DirectionLegStep>.from(
            json["steps"].map((x) => DirectionLegStep.fromJson(x))),
        trafficSpeedEntry:
            List<dynamic>.from(json["traffic_speed_entry"].map((x) => x)),
        viaWaypoint: List<dynamic>.from(json["via_waypoint"].map((x) => x)),
      );

  final DistanceValue distance;
  final DurationValue duration;
  final String endAddress;
  final AddressPoint endLocation;
  final String startAddress;
  final AddressPoint startLocation;
  final List<DirectionLegStep> steps;
  final List<dynamic> trafficSpeedEntry;
  final List<dynamic> viaWaypoint;

  @override
  List<Object> get props {
    return [
      distance,
      duration,
      endAddress,
      endLocation,
      startAddress,
      startLocation,
      steps,
      trafficSpeedEntry,
      viaWaypoint,
    ];
  }

  @override
  bool get stringify => true;

  int get distanceInMeters => distance.meters;

  DirectionRouteLeg copyWith({
    DistanceValue? distance,
    DurationValue? duration,
    String? endAddress,
    AddressPoint? endLocation,
    String? startAddress,
    AddressPoint? startLocation,
    List<DirectionLegStep>? steps,
    List<dynamic>? trafficSpeedEntry,
    List<dynamic>? viaWaypoint,
  }) =>
      DirectionRouteLeg(
        distance: distance ?? this.distance,
        duration: duration ?? this.duration,
        endAddress: endAddress ?? this.endAddress,
        endLocation: endLocation ?? this.endLocation,
        startAddress: startAddress ?? this.startAddress,
        startLocation: startLocation ?? this.startLocation,
        steps: steps ?? this.steps,
        trafficSpeedEntry: trafficSpeedEntry ?? this.trafficSpeedEntry,
        viaWaypoint: viaWaypoint ?? this.viaWaypoint,
      );

  Map<String, dynamic> toJson() => {
        "distance": distance.toJson(),
        "duration": duration.toJson(),
        "end_address": endAddress,
        "end_location": endLocation.toJson(),
        "start_address": startAddress,
        "start_location": startLocation.toJson(),
        "steps": List<dynamic>.from(steps.map((x) => x.toJson())),
        "traffic_speed_entry":
            List<dynamic>.from(trafficSpeedEntry.map((x) => x)),
        "via_waypoint": List<dynamic>.from(viaWaypoint.map((x) => x)),
      };
}
