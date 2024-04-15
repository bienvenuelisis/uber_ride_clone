import 'package:flutter/material.dart';
import 'package:uber_ride_clone/presentation/themes/colors/app_colors.dart';

///Safe Area with Top Background Color according to actual theme.
class SafeAreaWithTopBackground extends StatelessWidget {
  ///Default Constructor
  const SafeAreaWithTopBackground({
    required this.child,
    super.key,
  });

  ///Child Widget
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: context.appColors.background,
      child: SafeArea(
        left: false,
        right: false,
        bottom: false,
        child: child,
      ),
    );
  }
}
