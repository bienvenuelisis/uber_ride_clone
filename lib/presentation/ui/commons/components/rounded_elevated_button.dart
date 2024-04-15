import 'package:flutter/material.dart';
import 'package:uber_ride_clone/core/extensions/build_context.dart';

///Rounded Elevated Button
class RoundedElevatedButton extends StatelessWidget {
  ///Default Constructor
  const RoundedElevatedButton({
    required this.text,
    super.key,
    this.onPressed,
    this.style,
    this.height,
    this.loading = false,
    this.radius,
    this.padding,
    this.heightPercent,
    this.color,
    this.textColor,
  });

  ///Action on press
  final void Function()? onPressed;

  ///Foreground color
  final Color? color;

  ///Button height
  final double? height;

  ///Height pourcent of the screen
  final double? heightPercent;

  ///Loading
  final bool loading;

  ///Padding
  final EdgeInsets? padding;

  ///Radius
  final double? radius;

  ///Text style
  final TextStyle? style;

  ///Text
  final String text;

  ///Text color
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(8),
      child: loading
          ? Container(
              width: context.width,
              height: height,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(radius ?? 9),
              ),
              child: const Padding(
                padding: EdgeInsets.all(8),
                child: Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
              ),
            )
          : SizedBox(
              height: height,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: color,
                  elevation: 10,
                  foregroundColor: textColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(radius ?? 8),
                  ),
                ),
                onPressed: onPressed,
                child: Center(
                  child: Text(
                    text,
                    style: style?.copyWith(
                      color: textColor,
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
