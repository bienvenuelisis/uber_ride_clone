import 'package:flutter/material.dart';
import 'package:uber_ride_clone/gen/assets.gen.dart';

///Ride Choice Model
class RideChoiceModel {
  ///Default Constructor
  RideChoiceModel({
    required this.imagePath,
    required this.label,
    required this.arriveTime,
    required this.arriveDistanceInMin,
    required this.action,
    required this.price,
    this.actionTitle,
    this.actionIcon,
    this.priceAfterDiscount,
    this.passengersCount,
  });

  ///Ride Choice has special action button.
  final bool action;

  ///Action icon
  final IconData? actionIcon;

  ///Action title
  final String? actionTitle;

  ///Arrive distance in minutes
  final String arriveDistanceInMin;

  ///Arrive time
  final String arriveTime;

  ///Path asset of image representing the ride choice.
  final String imagePath;

  ///Label of the ride choice
  final String label;

  ///Number of passengers
  final int? passengersCount;

  ///Price
  final double price;

  ///Price after discount
  final double? priceAfterDiscount;

  ///All Ride Choices
  static List<RideChoiceModel> all = [
    RideChoiceModel(
      imagePath: Assets.images.ride.path,
      label: 'Uber Cab',
      arriveTime: '',
      arriveDistanceInMin: '3min',
      action: false,
      price: 182.56,
      priceAfterDiscount: 173.43,
    ),
  ];
}
