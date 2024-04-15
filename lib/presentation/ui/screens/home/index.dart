import 'package:flutter/material.dart';
import 'package:uber_ride_clone/presentation/ui/commons/layouts/safe_area_with_top_background.dart';
import 'package:uber_ride_clone/presentation/ui/screens/home/components/tab_bar.dart';
import 'package:uber_ride_clone/presentation/ui/screens/home/home_dot_navigation_bar.dart';
import 'package:uber_ride_clone/presentation/ui/screens/home/ride.dart';

///App Home Screen
class HomeScreen extends StatelessWidget {
  ///Default Constructor
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeAreaWithTopBackground(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: HomeTabBar(),
          body: RideHomeScreen(),
          bottomNavigationBar: HomeDotScreenNavigationBar(),
        ),
      ),
    );
  }
}
