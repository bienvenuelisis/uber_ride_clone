import 'package:flutter/material.dart';
import 'package:uber_ride_clone/presentation/config/sizes.dart';
import 'package:uber_ride_clone/presentation/themes/colors/colors_palette.dart';

///last location tile.
class RecentLocationTile extends StatelessWidget {
  ///Default Constructor
  const RecentLocationTile({
    required this.title,
    required this.subtitle,
    this.leadingIcon,
    this.leading,
    super.key,
  });

  /// Subtitle
  final String subtitle;

  /// Title
  final String title;

  ///
  final IconData? leadingIcon;

  ///
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSizes.h_8,
        ),
        horizontalTitleGap: 0,
        minLeadingWidth: AppSizes.h_32,
        leading: leading ??
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Icon(
                leadingIcon ?? Icons.location_on_rounded,
                size: 24,
              ),
            ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            color: ColorsPalette.listTilePrimaryText,
            fontWeight: FontWeight.bold,
          ),
          maxLines: 1,
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(
            fontSize: AppSizes.h_12,
            color: ColorsPalette.listTileSecondaryText,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: AppSizes.h_12,
        ),
        dense: true,
        // visualDensity: VisualDensity.compact,
      ),
    );
  }
}
