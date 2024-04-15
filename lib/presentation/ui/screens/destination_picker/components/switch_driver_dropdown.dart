import 'package:flutter/material.dart';
import 'package:uber_ride_clone/presentation/config/sizes.dart';

///Switch Rider Dropdown
class SwitchRiderDropdown extends StatelessWidget {
  ///Default Constructor
  const SwitchRiderDropdown({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSizes.h_120,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              border: Border.all(
                color: Colors.black45,
              ),
              borderRadius: BorderRadius.circular(
                AppSizes.r_8,
              ),
            ),
            child: Container(
              margin: const EdgeInsets.all(2),
              child: const Icon(
                Icons.person_2_sharp,
                size: AppSizes.h_12,
                color: Colors.grey,
              ),
            ),
          ),
          const Text(
            'Switch rider',
            style: TextStyle(
              fontSize: AppSizes.h_12,
              color: Colors.black87,
            ),
          ),
          const Icon(
            Icons.keyboard_arrow_down_sharp,
            size: AppSizes.h_16,
          ),
        ],
      ),
    );
  }
}
