import 'package:flutter/material.dart';
import 'package:uber_ride_clone/presentation/themes/colors/app_colors.dart';

///App theme.
class AppTheme {
  /// Light theme
  static final light = ThemeData.light().copyWith(
    extensions: [
      AppColors.light,
    ],
  );

  /// Dark theme
  static final dark = ThemeData.dark().copyWith(
    extensions: [
      AppColors.dark,
    ],
  );
}
