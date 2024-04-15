import 'package:flutter/material.dart';
import 'package:uber_ride_clone/core/config/permissions.dart';
import 'package:uber_ride_clone/core/extensions/navigator.dart';
import 'package:uber_ride_clone/presentation/config/sizes.dart';
import 'package:uber_ride_clone/presentation/ui/screens/destination_picker/index.dart';
import 'package:uber_ride_clone/presentation/ui/screens/manage_permissions/index.dart';

///Input for search ride location
class SearchRideDestination extends StatefulWidget {
  ///Default Constructor
  const SearchRideDestination({
    super.key,
  });

  @override
  State<SearchRideDestination> createState() => _SearchRideDestinationState();
}

class _SearchRideDestinationState extends State<SearchRideDestination> {
  ///User want to start a ride.
  Future<void> _pickLocation() async {
    ///Test if user has already accept location permissions, in order
    ///to automatically set his starting point.
    if (!await PermissionsConfig.location.granted() && mounted) {
      ///When closing the [ManagePermissionScreen] it must return a bool
      ///true value when the user accept the permissions requested.
      final granted = await context.pushToWithAnimation<bool>(
        const ManagePermissionScreen(
          // ignore: avoid_redundant_argument_values
          permissions: PermissionsConfig.location,
        ),
        bottomToTop: true,
      );

      ///If user accept the permissions, we push the [DestinationPicker].
      if (granted is bool && granted) {
        if (mounted) {
          await context.pushTo(
            const DestinationPicker(),
          );
        }
      }

      //TODO If user don't accept the permissions, we...
      return;
    }

    if (context.mounted) {
      await context.pushToWithAnimation(
        const DestinationPicker(),
        bottomToTop: true,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.h_16),
      child: TextFormField(
        onTap: _pickLocation,
        readOnly: true,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          constraints: const BoxConstraints(
            maxHeight: AppSizes.h_52,
          ),
          fillColor: Colors.grey[200],
          filled: true,
          suffixIconConstraints: const BoxConstraints(
            maxWidth: AppSizes.h_100,
            minHeight: AppSizes.h_32,
          ),
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.black,
          ),
          suffixIcon: Container(
            margin: const EdgeInsets.symmetric(horizontal: AppSizes.h_8),
            child: const DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(AppSizes.r_24),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.access_time_filled_sharp,
                    size: AppSizes.h_16,
                    color: Colors.black,
                  ),
                  Text(
                    'Now',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: AppSizes.h_12,
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ),
          hintText: 'Where to?',
          hintStyle: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(AppSizes.r_24)),
          ),
        ),
      ),
    );
  }
}
