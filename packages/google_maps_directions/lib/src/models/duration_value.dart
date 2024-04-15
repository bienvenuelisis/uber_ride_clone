import 'package:equatable/equatable.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class DurationValue extends Equatable {
  const DurationValue({
    required this.text,
    required this.seconds,
  });

  factory DurationValue.fromJson(Map<String, dynamic> json) => DurationValue(
        text: json["text"],
        seconds: json["value"],
      );

  final int seconds;
  final String text;

  @override
  List<Object> get props => [seconds, text];

  @override
  bool get stringify => true;

  Duration get value => Duration(seconds: seconds);

  DurationValue copyWith({
    String? text,
    int? seconds,
  }) =>
      DurationValue(
        text: text ?? this.text,
        seconds: seconds ?? this.seconds,
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "value": seconds,
      };
}
