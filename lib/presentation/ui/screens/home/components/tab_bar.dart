import 'package:flutter/material.dart';
import 'package:uber_ride_clone/gen/assets.gen.dart';
import 'package:uber_ride_clone/presentation/config/sizes.dart';
import 'package:uber_ride_clone/presentation/themes/colors/colors_palette.dart';

///Home Tab Bar
class HomeTabBar extends StatefulWidget implements PreferredSizeWidget {
  ///Default constructor
  const HomeTabBar({
    super.key,
  });

  @override
  State<HomeTabBar> createState() => _HomeTabBarState();

  @override
  Size get preferredSize => const Size.fromHeight(AppSizes.h_48);
}

class _HomeTabBarState extends State<HomeTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  void onItemSelected() {
    setState(() {});
  }

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(onItemSelected);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.removeListener(onItemSelected);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: _tabController,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.h_40,
      ).copyWith(top: AppSizes.h_8),
      indicatorColor: Colors.black,
      indicatorWeight: AppSizes.h_4,
      indicatorPadding: const EdgeInsets.only(
        left: AppSizes.h_48,
        right: AppSizes.h_24,
      ),
      tabs: [
        TabBarItem(
          imageAsset: Assets.images.ride.path,
          title: 'Rides',
          selected: _tabController.index == 0,
        ),
        TabBarItem(
          imageAsset: Assets.images.delivery.path,
          title: 'Delivery',
          selected: _tabController.index == 1,
        ),
      ],
    );
  }
}

///Tab Bar Item
class TabBarItem extends StatelessWidget {
  ///Constructor
  ///(imageAsset, title, selected=false)
  const TabBarItem({
    required this.imageAsset,
    required this.title,
    super.key,
    this.selected = false,
  });

  ///Image Asset for
  final String imageAsset;

  ///Tab Bar Item title
  final String title;

  ///Indicates if the tab bar is selected
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset(
          imageAsset,
          height: AppSizes.h_36,
        ),
        Text(
          title,
          style: TextStyle(
            color: selected
                ? ColorsPalette.selectedTabText
                : ColorsPalette.tabText,
            fontSize: AppSizes.h_16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
