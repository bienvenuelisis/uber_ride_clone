// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class DistanceValue extends Equatable {
  const DistanceValue({
    required this.text,
    required this.meters,
  });

  factory DistanceValue.fromJson(Map<String, dynamic> json) => DistanceValue(
        text: json["text"],
        meters: json["value"],
      );

  final int meters;
  final String text;

  @override
  List<Object> get props => [text, meters];

  @override
  bool get stringify => true;

  DistanceValue copyWith({
    String? text,
    int? meters,
  }) =>
      DistanceValue(
        text: text ?? this.text,
        meters: meters ?? this.meters,
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "value": meters,
      };
}
