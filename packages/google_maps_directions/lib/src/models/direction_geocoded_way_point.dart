import 'package:equatable/equatable.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class DirectionGeocodedWaypoint extends Equatable {
  const DirectionGeocodedWaypoint({
    required this.geocoderStatus,
    required this.placeId,
    required this.types,
  });

  factory DirectionGeocodedWaypoint.fromJson(Map<String, dynamic> json) =>
      DirectionGeocodedWaypoint(
        geocoderStatus: json["geocoder_status"],
        placeId: json["place_id"],
        types: List<String>.from(json["types"].map((x) => x)),
      );

  final String geocoderStatus;
  final String placeId;
  final List<String> types;

  @override
  List<Object> get props => [geocoderStatus, placeId, types];

  @override
  bool get stringify => true;

  DirectionGeocodedWaypoint copyWith({
    String? geocoderStatus,
    String? placeId,
    List<String>? types,
  }) =>
      DirectionGeocodedWaypoint(
        geocoderStatus: geocoderStatus ?? this.geocoderStatus,
        placeId: placeId ?? this.placeId,
        types: types ?? this.types,
      );

  Map<String, dynamic> toJson() => {
        "geocoder_status": geocoderStatus,
        "place_id": placeId,
        "types": List<dynamic>.from(types.map((x) => x)),
      };
}
