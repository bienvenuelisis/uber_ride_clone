import 'package:flutter/material.dart';
import 'package:uber_ride_clone/data/models/ride_plan.dart';
import 'package:uber_ride_clone/presentation/config/sizes.dart';
import 'package:uber_ride_clone/presentation/themes/colors/colors_palette.dart';

///Ride Plan Card
class RidePlanCard extends StatelessWidget {
  ///Default Constructor:
  const RidePlanCard(
    this.ridePlan, {
    super.key,
  });

  ///Ride Plan
  final RidePlan ridePlan;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          constraints: const BoxConstraints(
            minHeight: AppSizes.h_100,
            minWidth: AppSizes.h_200,
          ),
          height: AppSizes.h_120,
          width: AppSizes.h_200,
          margin: const EdgeInsets.only(
            right: AppSizes.h_12,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSizes.r_16),
            color: ridePlan.color,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppSizes.r_16),
            child: Image.asset(
              ridePlan.imageAsset,
              fit: BoxFit.fitWidth,
              height: AppSizes.h_100,
              width: AppSizes.h_200,
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  ridePlan.title,
                  style: const TextStyle(
                    fontSize: AppSizes.h_16,
                    fontWeight: FontWeight.bold,
                    color: ColorsPalette.largeCardActionnablePrimaryText,
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_rounded,
                  size: AppSizes.h_16,
                ),
              ],
            ),
            Text(
              ridePlan.subTitle,
              style: const TextStyle(
                fontSize: AppSizes.h_12,
                color: ColorsPalette.largeCardActionnableSecondaryText,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
