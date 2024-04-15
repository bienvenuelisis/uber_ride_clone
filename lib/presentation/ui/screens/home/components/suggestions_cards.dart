import 'package:flutter/material.dart';
import 'package:uber_ride_clone/gen/assets.gen.dart';
import 'package:uber_ride_clone/presentation/config/sizes.dart';
import 'package:uber_ride_clone/presentation/themes/colors/colors_palette.dart';

///Ride Option
class RideOption {
  ///Default Constructor
  const RideOption({
    required this.imageAsset,
    required this.title,
    this.info,
  });

  ///Image Asset
  final String imageAsset;

  ///Subtitle
  final String? info;

  ///Title
  final String title;

  ///List of ride options
  static List<RideOption> get all => [
        RideOption(
          imageAsset: Assets.images.ride.path,
          title: 'Ride',
        ),
        RideOption(
          imageAsset: Assets.images.wheels2.path,
          title: '2 Wheels',
        ),
        RideOption(
          imageAsset: Assets.images.package.path,
          title: 'Package',
        ),
        RideOption(
          imageAsset: Assets.images.rentalCars.path,
          title: 'Rental Cars',
          info: 'Promo',
        ),
      ];
}

///Ride options cards
class SuggestionsCards extends StatelessWidget {
  ///Default Constructor
  const SuggestionsCards({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.h_16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const SizedBox(
            height: 10,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Suggestions',
                style: TextStyle(
                  fontSize: AppSizes.h_16,
                  color: ColorsPalette.sectionTitleText,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: RideOption.all.map(RideOptionCard.new).toList(),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

///Ride option card
class RideOptionCard extends StatelessWidget {
  ///Default Constructor
  const RideOptionCard(
    this.rideOption, {
    super.key,
  });

  ///Ride Option
  final RideOption rideOption;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        right: 12,
      ),
      width: AppSizes.h_70,
      height: AppSizes.h_70,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: const BorderRadius.all(
          Radius.circular(AppSizes.r_8),
        ),
      ),
      alignment: Alignment.center,
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          minHeight: AppSizes.h_70,
          minWidth: AppSizes.h_70,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              rideOption.imageAsset,
              width: AppSizes.h_36,
              fit: BoxFit.contain,
            ),
            const SizedBox(
              height: AppSizes.h_4,
            ),
            Text(
              rideOption.title,
              style: const TextStyle(
                fontSize: AppSizes.h_12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
