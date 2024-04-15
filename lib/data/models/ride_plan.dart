import 'package:flutter/widgets.dart';
import 'package:uber_ride_clone/gen/assets.gen.dart';

///Ride Plan model.
class RidePlan {
  ///Default Constructor
  const RidePlan({
    required this.imageAsset,
    required this.title,
    required this.subTitle,
    this.color,
  });

  ///Image Asset
  final String imageAsset;

  ///Title
  final String title;

  ///Subtitle
  final String subTitle;

  ///Color
  final Color? color;

  ///List of default ride plans
  static final List<RidePlan> all = [
    RidePlan(
      imageAsset: Assets.images.carPooling.path,
      title: 'Get a chauffeur',
      subTitle: 'Go where you want, pay per hour',
    ),
    RidePlan(
      imageAsset: Assets.images.carKeysRedBG.path,
      title: 'Easy car rentals',
      subTitle: 'Take the wheel and go where you want',
    ),
  ];

  ///List of more ride plans
  static final List<RidePlan> more = [
    RidePlan(
      imageAsset: Assets.images.carPooling.path,
      title: 'Get a chauffeur',
      subTitle: 'Go where you want, pay per hour',
    ),
    RidePlan(
      imageAsset: Assets.images.carKeysRedBG.path,
      title: 'Easy car rentals',
      subTitle: 'Take the wheel and go where you want',
    ),
  ];
}
