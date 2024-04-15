import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uber_ride_clone/core/extensions/build_context.dart';
import 'package:uber_ride_clone/presentation/config/sizes.dart';
import 'package:uber_ride_clone/presentation/themes/colors/app_colors.dart';
import 'package:uber_ride_clone/presentation/ui/screens/ride_details/components/ride_choices.dart';
import 'package:uber_ride_clone/presentation/ui/screens/ride_details/providers/ride_choice_provider.dart';

/// Ride Confirmation Plan Screen
class RideConfirmPlanScreen extends StatefulWidget {
  ///Default Constructor
  const RideConfirmPlanScreen({
    super.key,
  });

  @override
  State<RideConfirmPlanScreen> createState() => _RideConfirmPlanScreenState();
}

class _RideConfirmPlanScreenState extends State<RideConfirmPlanScreen> {
  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: context.appColors.background,
      child: SizedBox(
        height: context.height * 0.4,
        width: context.width,
        child: Column(
          children: [
            const SizedBox(
              height: AppSizes.h_8,
            ),
            Center(
              child: SizedBox(
                width: 100,
                child: Divider(
                  color: Colors.grey[800],
                  height: 3,
                  thickness: 3,
                ),
              ),
            ),
            const Spacer(),
            const SizedBox(
              child: RideChoices(),
            ),
            const SizedBox(
              height: AppSizes.h_20,
            ),
            SizedBox(
              width: context.width * 0.9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(
                        5,
                      ),
                      border: Border.all(width: 0.5),
                    ),
                    width: context.width * 0.6,
                    height: 40,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.money,
                              color: Colors.green,
                            ),
                            Text('Pay with cash'),
                          ],
                        ),
                        Icon(Icons.arrow_forward_ios),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        5,
                      ),
                      border: Border.all(width: 0.5),
                    ),
                    width: context.width * 0.2,
                    height: 40,
                    child: const Padding(
                      padding: EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('10% off'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: context.width,
              child: Center(
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: AppSizes.h_16,
                  ),
                  child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: _confirm,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                        ),
                        child: SizedBox(
                          width: context.width * 0.7,
                          child: Center(
                            child: Consumer(
                              builder: (context, ref, child) {
                                return Text(
                                  '''Confirm ${ref.watch(ridePlanSelectedProvider)}''',
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _confirm() async {
    // await context.pushTo(
    //   const RideWaitingForDriverScreen(),
    // );
  }
}
