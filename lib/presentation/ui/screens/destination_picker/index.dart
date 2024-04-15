import 'package:flutter/material.dart';
import 'package:uber_ride_clone/core/extensions/build_context.dart';
import 'package:uber_ride_clone/core/extensions/navigator.dart';
import 'package:uber_ride_clone/presentation/config/sizes.dart';
import 'package:uber_ride_clone/presentation/ui/commons/components/linear_divider.dart';
import 'package:uber_ride_clone/presentation/ui/commons/layouts/safe_area_with_top_background.dart';
import 'package:uber_ride_clone/presentation/ui/screens/destination_picker/components/destination_location_search_field.dart';
import 'package:uber_ride_clone/presentation/ui/screens/destination_picker/components/destination_location_search_results.dart';
import 'package:uber_ride_clone/presentation/ui/screens/destination_picker/components/saved_places_tile.dart';
import 'package:uber_ride_clone/presentation/ui/screens/destination_picker/components/starting_location_details.dart';
import 'package:uber_ride_clone/presentation/ui/screens/destination_picker/components/vertical_dots.dart';
import 'package:uber_ride_clone/presentation/ui/screens/home/components/recent_location_tile.dart';

///Destination Picker, as a Bottom Sheet for Rider Home screen
class DestinationPicker extends StatefulWidget {
  ///Default Constructor
  const DestinationPicker({super.key});

  @override
  State<DestinationPicker> createState() => _DestinationPickerState();
}

class _DestinationPickerState extends State<DestinationPicker> {
  @override
  Widget build(BuildContext context) {
    return SafeAreaWithTopBackground(
      child: Material(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: AppSizes.h_4,
            horizontal: AppSizes.h_12,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                const _PlanYourRides(),
                const SizedBox(
                  height: 10,
                ),
                const _RideTabs(),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: context.width,
                  height: 100,
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Card(
                            child: SizedBox(
                              height: 40,
                              width: context.width - 100,
                              child: const StartingLocationDetails(),
                            ),
                          ),
                          Card(
                            child: SizedBox(
                              height: 40,
                              width: context.width - 100,
                              child: const DestinationLocationSearchField(),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: AppSizes.h_52,
                        height: 90,
                        child: VerticalDots(),
                      ),
                      const Icon(
                        Icons.refresh,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                const LinearHorizontalDivider(),
                const DestinationLocationSearchResults(),
                const LinearHorizontalDivider(),
                const SizedBox(height: 10),
                const Text(
                  'Recent locations',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 10),
                const RecentLocationTile(
                  title: 'Dhawalgirl Apartments',
                  subtitle: 'Budh Vlhat, Noida, Utlar Pradesh',
                ),
                const RecentLocationTile(
                  title: 'JSS Academy of Technical Education, Noida',
                  subtitle:
                      'C-20/1, C Block, Phase 2, Industrial Authority of India',
                ),
                const SizedBox(height: 10),
                const SavedPlacesTile(),
                const SizedBox(
                  height: AppSizes.h_12,
                ),
                const LinearHorizontalDivider(),
                const SizedBox(
                  height: AppSizes.h_4,
                ),
                // const SetLocationOnMap(),
                // const SizedBox(
                //   height: AppSizes.h_8,
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _PlanYourRides extends StatelessWidget {
  const _PlanYourRides();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => context.pop(),
          child: const Icon(
            Icons.arrow_back_rounded,
            size: AppSizes.h_20,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        const Text(
          'Plan your ride',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class _RideTabs extends StatelessWidget {
  const _RideTabs();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          child: SizedBox(
            width: 60,
            height: 27,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Now',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(
              Radius.circular(5),
            ),
            border: Border.all(),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(
              width: 60,
              height: 27,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Schedule',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
