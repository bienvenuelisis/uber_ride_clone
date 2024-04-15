import 'package:flutter/material.dart';
import 'package:uber_ride_clone/core/extensions/build_context.dart';
import 'package:uber_ride_clone/core/extensions/navigator.dart';
import 'package:uber_ride_clone/presentation/ui/commons/layouts/safe_area_with_top_background.dart';
import 'package:uber_ride_clone/presentation/ui/screens/ride_details/components/ride_confirm_plan_map_screen.dart';
import 'package:uber_ride_clone/presentation/ui/screens/ride_details/components/ride_confirm_plan_screen.dart';

///Screen for details of a ride.
class RideDetailsScreen extends StatefulWidget {
  ///Default constructor
  const RideDetailsScreen({super.key});

  @override
  State<RideDetailsScreen> createState() => _RideDetailsScreenState();
}

class _RideDetailsScreenState extends State<RideDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeAreaWithTopBackground(
      child: Material(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => context.pop(),
                    child: const Icon(
                      Icons.arrow_back_rounded,
                      size: 20,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    'Select your ride',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: context.height * 0.5,
              width: context.width,
              child: const RideConfirmPlanMapScreen(),
            ),
            const RideConfirmPlanScreen(),
          ],
        ),
      ),
    );
  }
}
