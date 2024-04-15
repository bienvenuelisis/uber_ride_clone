import 'package:flutter/material.dart';
import 'package:uber_ride_clone/presentation/config/sizes.dart';
import 'package:uber_ride_clone/presentation/themes/colors/colors_palette.dart';

///Widget that shown result of a location search.
class LocationSearchResultTile extends StatelessWidget {
  ///Default Constructor
  const LocationSearchResultTile({
    required this.place,
    required this.location,
    required this.leading,
    this.loading = false,
    super.key,
  });

  ///Place type icon data
  final Widget leading;

  ///Location reference
  final String location;

  ///Location name
  final String place;

  /// Is loading
  final bool loading;

  @override
  Widget build(BuildContext context) {
    final tile = SizedBox(
      height: AppSizes.h_52,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        horizontalTitleGap: 0,
        minLeadingWidth: AppSizes.h_32,
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            leading,
          ],
        ),
        title: Text(
          place,
          style: const TextStyle(
            fontSize: AppSizes.h_12,
            color: ColorsPalette.listTilePrimaryText,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          location,
          style: const TextStyle(
            fontSize: AppSizes.h_12,
            color: ColorsPalette.listTileSecondaryText,
            fontWeight: FontWeight.w300,
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: AppSizes.h_12,
        ),
      ),
    );

    return loading
        ? Stack(
            children: [
              tile,
              const Center(
                child: CircularProgressIndicator(),
              ),
            ],
          )
        : tile;
  }
}
