import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import 'package:uber_ride_clone/presentation/themes/colors/colors_palette.dart';

part 'app_colors.tailor.dart';

@tailor
class _$AppColors {
  static List<Color> background = [
    ColorsPalette.background,
    ColorsPalette.backgroundDark,
  ];

  // final Color primary;
  // final Color onPrimary;
  // final Color secondary;
  // final Color onSecondary;
  // final Color error;
  // final Color onError;
  // final Color onBackground;
  // final Color surface;
  // final Color onSurface;
}

///ThemeExtensions on ThemeData
extension ThemeDataExtensions on ThemeData {
  /// Get the current app colors.
  AppColors get colors => extension<AppColors>() ?? AppColors.light;
}

///ThemeExtensions on BuildContext
extension ThemeOnBuildContextExtension on BuildContext {
  /// Get the current app theme on current context.
  ThemeData get theme => Theme.of(this);

  /// Get the text theme on current context.
  TextTheme get textTheme => theme.textTheme;

  /// Get the color scheme on current context.
  ColorScheme get colorScheme => theme.colorScheme;
}
