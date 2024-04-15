// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'address_point_mixin.dart';

class AddressPoint extends Equatable with AddressPointMixin {
  const AddressPoint({
    required this.lat,
    required this.lng,
  });

  factory AddressPoint.fromJson(Map<String, dynamic> json) => AddressPoint(
        lat: json["lat"]?.toDouble(),
        lng: json["lng"]?.toDouble(),
      );

  final double lat;
  final double lng;

  @override
  List<Object> get props => [lat, lng];

  @override
  bool get stringify => true;

  AddressPoint copyWith({
    double? lat,
    double? lng,
  }) =>
      AddressPoint(
        lat: lat ?? this.lat,
        lng: lng ?? this.lng,
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
      };
}
