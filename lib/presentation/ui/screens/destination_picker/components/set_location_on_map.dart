import 'package:flutter/material.dart';
import 'package:uber_ride_clone/presentation/config/sizes.dart';

///Set location on map
class SetLocationOnMap extends StatelessWidget {
  ///Default Constructor
  const SetLocationOnMap({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(Icons.location_pin, size: AppSizes.h_16),
        SizedBox(
          width: AppSizes.h_16,
        ),
        Text(
          'Set location on map',
          style: TextStyle(
            fontSize: AppSizes.h_12,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
