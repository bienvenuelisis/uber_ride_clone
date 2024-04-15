import 'package:flutter/material.dart';
import 'package:uber_ride_clone/presentation/config/sizes.dart';
import 'package:uber_ride_clone/presentation/themes/colors/colors_palette.dart';

///Saved places tile
class SavedPlacesTile extends StatelessWidget {
  ///Default Constructor
  const SavedPlacesTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const ColoredBox(
      color: Colors.white,
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(
          horizontal: AppSizes.h_8,
        ),
        horizontalTitleGap: 0,
        minLeadingWidth: AppSizes.h_32,
        leading: Padding(
          padding: EdgeInsets.only(right: 8),
          child: Icon(
            Icons.bookmark,
            size: 24,
          ),
        ),
        title: Text(
          'Saved places',
          style: TextStyle(
            fontSize: 14,
            color: ColorsPalette.listTilePrimaryText,
            fontWeight: FontWeight.bold,
          ),
          maxLines: 1,
        ),

        dense: true,
        // visualDensity: VisualDensity.compact,
      ),
    );
  }
}
