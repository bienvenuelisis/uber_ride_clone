import 'package:flutter/material.dart';
import 'package:uber_ride_clone/presentation/config/sizes.dart';
import 'package:uber_ride_clone/presentation/themes/colors/colors_palette.dart';

///last location tile.
class LastLocationTile extends StatelessWidget {
  ///Default Constructor
  const LastLocationTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.h_24),
      child: SizedBox(
        height: AppSizes.h_80,
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: AppSizes.h_8,
          ),
          horizontalTitleGap: 0,
          minLeadingWidth: AppSizes.h_32,
          leading: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(AppSizes.h_4),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: const BorderRadius.all(
                    Radius.circular(AppSizes.r_24),
                  ),
                ),
                child: const Icon(
                  Icons.location_on_sharp,
                  size: AppSizes.h_16,
                ),
              ),
            ],
          ),
          title: const Text(
            'Salon de Coiffure chez Ben',
            style: TextStyle(
              fontSize: AppSizes.h_16,
              color: ColorsPalette.listTilePrimaryText,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: const Text(
            'PG3Q+Q8J, Dakar',
            style: TextStyle(
              fontSize: AppSizes.h_12,
              color: ColorsPalette.listTileSecondaryText,
            ),
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            size: AppSizes.h_12,
          ),
        ),
      ),
    );
  }
}
