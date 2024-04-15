import 'package:flutter/material.dart';
import 'package:uber_ride_clone/presentation/config/sizes.dart';

///Home Screen navigation bar
class HomeScreenNavigationBar extends StatelessWidget {
  ///Default Constructor
  const HomeScreenNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      selectedItemColor: Colors.black,
      type: BottomNavigationBarType.fixed,
      elevation: AppSizes.h_12,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(
          icon: Icon(Icons.view_list_rounded),
          label: 'Services',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.receipt), label: 'Activity'),
        BottomNavigationBarItem(
          icon: Icon(Icons.manage_accounts_rounded),
          label: 'Account',
        ),
      ],
    );
  }
}
