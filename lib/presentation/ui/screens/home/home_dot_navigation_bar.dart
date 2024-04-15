import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';

///Home Screen navigation bar
class HomeDotScreenNavigationBar extends StatelessWidget {
  ///Default Constructor
  const HomeDotScreenNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: CustomNavigationBar(
        opacity: 0,
        backgroundColor: Colors.black,
        borderRadius: const Radius.circular(24),
        elevation: 10,
        isFloating: true,
        selectedColor: Colors.white,
        unSelectedColor: Colors.white38,
        onTap: (_) {},
        items: [
          CustomNavigationBarItem(
            icon: const Icon(Icons.home),
            title: const Text(
              'Home',
              style: TextStyle(
                color: Colors.white38,
              ),
            ),
            selectedTitle: const Text(
              'Home',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          CustomNavigationBarItem(
            icon: const Icon(Icons.view_list_rounded),
            title: const Text(
              'Services',
              style: TextStyle(
                color: Colors.white38,
              ),
            ),
            selectedTitle: const Text(
              'Services',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          CustomNavigationBarItem(
            icon: const Icon(Icons.receipt),
            title: const Text(
              'Activity',
              style: TextStyle(
                color: Colors.white38,
              ),
            ),
            selectedTitle: const Text(
              'Activity',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          CustomNavigationBarItem(
            icon: const Icon(Icons.manage_accounts_rounded),
            title: const Text(
              'Account',
              style: TextStyle(
                color: Colors.white38,
              ),
            ),
            selectedTitle: const Text(
              'Account',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
