import 'package:equatable/equatable.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class DirectionLegPolyline extends Equatable {
  const DirectionLegPolyline({
    required this.points,
  });

  factory DirectionLegPolyline.fromJson(Map<String, dynamic> json) =>
      DirectionLegPolyline(
        points: json["points"],
      );

  final String points;

  @override
  List<Object> get props => [points];

  @override
  bool get stringify => true;

  DirectionLegPolyline copyWith({
    String? points,
  }) =>
      DirectionLegPolyline(
        points: points ?? this.points,
      );

  Map<String, dynamic> toJson() => {
        "points": points,
      };
}
