import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uber_ride_clone/core/extensions/build_context.dart';
import 'package:uber_ride_clone/presentation/config/sizes.dart';
import 'package:uber_ride_clone/presentation/ui/screens/ride_details/providers/ride_choice_provider.dart';

///Ride Choice Card
class RideChoiceCard extends StatelessWidget {
  ///Default Constructor
  const RideChoiceCard({
    required this.imagePath,
    required this.label,
    required this.arriveTime,
    required this.arriveDistanceInMin,
    required this.action,
    required this.price,
    super.key,
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

  ///Price
  final double price;

  ///Price after discount
  final double? priceAfterDiscount;

  ///Number of passengers
  final int? passengersCount;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, ref, __) {
        final selectedPlanLabel = ref.watch(ridePlanSelectedProvider);

        final selected = selectedPlanLabel == label;

        return InkWell(
          onTap: () =>
              ref.read(ridePlanSelectedProvider.notifier).state = label,
          child: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: AppSizes.h_16,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: AppSizes.h_12,
              vertical: AppSizes.h_4,
            ),
            decoration: selected
                ? BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      AppSizes.r_24,
                    ),
                    border: Border.all(width: 2),
                  )
                : null,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(imagePath, height: AppSizes.h_60),
                const SizedBox(
                  width: AppSizes.h_12,
                ),
                SizedBox(
                  width: context.width * 0.6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(label),
                              if (passengersCount != null &&
                                  passengersCount! > 1)
                                Row(
                                  children: [
                                    const Icon(Icons.person),
                                    Text('$passengersCount'),
                                  ],
                                ),
                            ],
                          ),
                          const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.attach_money_outlined,
                                size: AppSizes.h_20,
                                color: Colors.amber,
                              ),
                              Text(
                                priceAfterDiscount == null
                                    ? '\$$price'
                                    : '\$$priceAfterDiscount',
                                style: const TextStyle(),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            '$arriveTime · $arriveDistanceInMin away',
                            style: const TextStyle(
                              fontSize: AppSizes.h_12,
                              color: Colors.grey,
                            ),
                          ),
                          const Spacer(),
                          if (priceAfterDiscount != null)
                            Text(
                              '\$$price',
                              style: const TextStyle(
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                        ],
                      ),
                      if (action && actionTitle != null && actionIcon != null)
                        SizedBox(
                          width: context.width * 0.2,
                          height: AppSizes.h_32,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.blue,
                            ),
                            onPressed: null,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  AppSizes.r_24,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(
                                    actionIcon,
                                    size: AppSizes.h_12,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    actionTitle!,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: AppSizes.h_12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      const SizedBox(
                        height: AppSizes.h_4,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
