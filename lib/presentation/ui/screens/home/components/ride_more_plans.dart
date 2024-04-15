import 'package:flutter/material.dart';
import 'package:uber_ride_clone/data/models/ride_plan.dart';
import 'package:uber_ride_clone/presentation/config/sizes.dart';
import 'package:uber_ride_clone/presentation/themes/colors/colors_palette.dart';
import 'package:uber_ride_clone/presentation/ui/screens/home/components/ride_plan_card.dart';

///Ride second sections of plans
class RideMorePlans extends StatelessWidget {
  ///Default Constructor
  const RideMorePlans({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.h_16),
      child: Column(
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'More ways to use Uber',
              style: TextStyle(
                fontSize: AppSizes.h_16,
                color: ColorsPalette.sectionTitleText,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          const SizedBox(
            height: AppSizes.h_12,
          ),
          SizedBox(
            height: AppSizes.h_160,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                final ridePlan = RidePlan.all[index];

                return RidePlanCard(ridePlan);
              },
              itemCount: RidePlan.all.length,
            ),
          ),
        ],
      ),
    );
  }
}
