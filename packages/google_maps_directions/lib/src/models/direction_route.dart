// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'direction_leg_polyline.dart';
import 'direction_route_bounds.dart';
import 'direction_route_leg.dart';

class DirectionRoute extends Equatable {
  const DirectionRoute({
    required this.bounds,
    required this.copyrights,
    required this.legs,
    required this.overviewPolyline,
    required this.summary,
    required this.warnings,
    required this.waypointOrder,
  });

  factory DirectionRoute.fromJson(Map<String, dynamic> json) => DirectionRoute(
        bounds: DirectionRouteBounds.fromJson(json["bounds"]),
        copyrights: json["copyrights"],
        legs: List<DirectionRouteLeg>.from(
            json["legs"].map((x) => DirectionRouteLeg.fromJson(x))),
        overviewPolyline:
            DirectionLegPolyline.fromJson(json["overview_polyline"]),
        summary: json["summary"],
        warnings: List<dynamic>.from(json["warnings"].map((x) => x)),
        waypointOrder: List<dynamic>.from(json["waypoint_order"].map((x) => x)),
      );

  final DirectionRouteBounds bounds;
  final String copyrights;
  final List<DirectionRouteLeg> legs;
  final DirectionLegPolyline overviewPolyline;
  final String summary;
  final List<dynamic> warnings;
  final List<dynamic> waypointOrder;

  @override
  List<Object> get props {
    return [
      bounds,
      copyrights,
      legs,
      overviewPolyline,
      summary,
      warnings,
      waypointOrder,
    ];
  }

  @override
  bool get stringify => true;

  DirectionRouteLeg get shortestLeg => (legs
        ..sort((l1, l2) => l1.distanceInMeters.compareTo(l2.distanceInMeters)))
      .first;

  DirectionRoute copyWith({
    DirectionRouteBounds? bounds,
    String? copyrights,
    List<DirectionRouteLeg>? legs,
    DirectionLegPolyline? overviewPolyline,
    String? summary,
    List<dynamic>? warnings,
    List<dynamic>? waypointOrder,
  }) =>
      DirectionRoute(
        bounds: bounds ?? this.bounds,
        copyrights: copyrights ?? this.copyrights,
        legs: legs ?? this.legs,
        overviewPolyline: overviewPolyline ?? this.overviewPolyline,
        summary: summary ?? this.summary,
        warnings: warnings ?? this.warnings,
        waypointOrder: waypointOrder ?? this.waypointOrder,
      );

  Map<String, dynamic> toJson() => {
        "bounds": bounds.toJson(),
        "copyrights": copyrights,
        "legs": List<dynamic>.from(legs.map((x) => x.toJson())),
        "overview_polyline": overviewPolyline.toJson(),
        "summary": summary,
        "warnings": List<dynamic>.from(warnings.map((x) => x)),
        "waypoint_order": List<dynamic>.from(waypointOrder.map((x) => x)),
      };
}
