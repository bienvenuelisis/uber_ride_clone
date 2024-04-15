import 'package:flutter/material.dart';
import 'package:uber_ride_clone/core/extensions/build_context.dart';
import 'package:uber_ride_clone/presentation/config/sizes.dart';

///Widget that shown when loading results of a location search.
class LocationSearchPlaceholderTile extends StatelessWidget {
  ///Default Constructor
  const LocationSearchPlaceholderTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      horizontalTitleGap: 0,
      minLeadingWidth: AppSizes.h_32,
      leading: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.location_on_sharp,
            size: AppSizes.h_16,
          ),
        ],
      ),
      title: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: context.width,
            height: AppSizes.h_12,
            color: Colors.white,
          ),
          const SizedBox(height: 8),
          Container(
            width: context.width * 0.5,
            height: AppSizes.h_8,
            color: Colors.white,
          ),
        ],
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: AppSizes.h_12,
      ),
    );
  }
}
