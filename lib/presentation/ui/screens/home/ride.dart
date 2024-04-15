import 'package:flutter/material.dart';
import 'package:uber_ride_clone/presentation/config/sizes.dart';
import 'package:uber_ride_clone/presentation/ui/screens/home/components/ads_carousel_slider.dart';
import 'package:uber_ride_clone/presentation/ui/screens/home/components/current_location.dart';
import 'package:uber_ride_clone/presentation/ui/screens/home/components/drop-off-location.dart.dart';
import 'package:uber_ride_clone/presentation/ui/screens/home/components/recents_locations_tiles.dart';
import 'package:uber_ride_clone/presentation/ui/screens/home/components/ride_more_plans.dart';
import 'package:uber_ride_clone/presentation/ui/screens/home/components/suggestions_cards.dart';

///Home for Ride Screen & actions
class RideHomeScreen extends StatelessWidget {
  ///Default Constructor
  const RideHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: AppSizes.h_12),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CurrentLocation(),
            DropOffLocation(),
            RecentLocationsTiles(),
            SuggestionsCards(),
            // RidePlans(),
            RideMorePlans(),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSizes.h_16,
                vertical: AppSizes.h_24,
              ),
              child: AdsCarouselSlider(),
            ),
            SizedBox(
              height: AppSizes.h_24,
            ),
          ],
        ),
      ),
    );
  }
}
