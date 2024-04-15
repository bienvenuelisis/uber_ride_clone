import 'package:flutter/material.dart';
import 'package:uber_ride_clone/presentation/config/sizes.dart';
import 'package:uber_ride_clone/presentation/ui/screens/home/components/recent_location_tile.dart';

///last location tile.
class RecentLocationsTiles extends StatelessWidget {
  ///Default Constructor
  const RecentLocationsTiles({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.h_24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            'Recent locations',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          SizedBox(height: 10),
          RecentLocationTile(
            title: 'Dhawalgirl Apartments',
            subtitle: 'Budh Vlhat, Noida, Utlar Pradesh',
          ),
          SizedBox(height: 10),
          RecentLocationTile(
            title: 'JSS Academy of Technical Education, Noida',
            subtitle: 'C-20/1, C Block, Phase 2, Industrial Authority of India',
          ),
        ],
      ),
    );
  }
}
