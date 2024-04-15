// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'address_point.dart';

class DirectionRouteBounds extends Equatable {
  const DirectionRouteBounds({
    required this.northeast,
    required this.southwest,
  });

  factory DirectionRouteBounds.fromJson(Map<String, dynamic> json) =>
      DirectionRouteBounds(
        northeast: AddressPoint.fromJson(json["northeast"]),
        southwest: AddressPoint.fromJson(json["southwest"]),
      );

  final AddressPoint northeast;
  final AddressPoint southwest;

  @override
  List<Object> get props => [northeast, southwest];

  @override
  bool get stringify => true;

  DirectionRouteBounds copyWith({
    AddressPoint? northeast,
    AddressPoint? southwest,
  }) {
    return DirectionRouteBounds(
      northeast: northeast ?? this.northeast,
      southwest: southwest ?? this.southwest,
    );
  }

  Map<String, dynamic> toJson() => {
        "northeast": northeast.toJson(),
        "southwest": southwest.toJson(),
      };
}
