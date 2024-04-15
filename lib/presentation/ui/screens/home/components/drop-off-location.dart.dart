import 'package:flutter/material.dart';
import 'package:uber_ride_clone/core/config/permissions.dart';
import 'package:uber_ride_clone/core/extensions/navigator.dart';
import 'package:uber_ride_clone/presentation/config/sizes.dart';
import 'package:uber_ride_clone/presentation/ui/screens/destination_picker/index.dart';
import 'package:uber_ride_clone/presentation/ui/screens/manage_permissions/index.dart';

///Input for search ride location
class DropOffLocation extends StatefulWidget {
  ///Default Constructor
  const DropOffLocation({
    super.key,
  });

  @override
  State<DropOffLocation> createState() => _DropOffLocationState();
}

class _DropOffLocationState extends State<DropOffLocation> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.h_16),
      child: TextFormField(
        // ignore: discarded_futures
        onTap: () => context.pickLocation(),
        readOnly: true,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          constraints: const BoxConstraints(
            maxHeight: AppSizes.h_60,
          ),
          fillColor: Colors.grey[200],
          filled: true,
          suffixIconConstraints: const BoxConstraints(
            maxWidth: AppSizes.h_100,
            minHeight: AppSizes.h_24,
          ),
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.black,
          ),
          suffixIcon: Container(
            margin: const EdgeInsets.only(
              right: 10,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 4,
            ),
            color: Colors.white,
            child: const DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(AppSizes.r_24),
                ),
              ),
              child: Icon(
                Icons.today,
                size: 20,
                color: Colors.black,
              ),
            ),
          ),
          hintText: 'Enter drop-off location',
          hintStyle: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
              style: BorderStyle.none,
              width: 0,
            ),
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
        ),
      ),
    );
  }
}

///
extension BuildContextExtension on BuildContext {
  ///User want to start a ride.
  Future<void> pickLocation() async {
    ///Test if user has already accept location permissions, in order
    ///to automatically set his starting point.
    if (!await PermissionsConfig.location.granted() && mounted) {
      ///When closing the [ManagePermissionScreen] it must return a bool
      ///true value when the user accept the permissions requested.
      final granted = await pushToWithAnimation<bool>(
        const ManagePermissionScreen(
          // ignore: avoid_redundant_argument_values
          permissions: PermissionsConfig.location,
        ),
        bottomToTop: true,
      );

      ///If user accept the permissions, we push the [DestinationPicker].
      if (granted is bool && granted) {
        if (mounted) {
          await pushTo(
            const DestinationPicker(),
          );
        }
      }

      //TODO If user don't accept the permissions, we...
      return;
    }

    if (mounted) {
      await pushToWithAnimation(
        const DestinationPicker(),
        bottomToTop: true,
      );
    }
  }
}
