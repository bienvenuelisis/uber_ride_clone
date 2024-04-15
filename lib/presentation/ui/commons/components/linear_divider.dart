import 'package:flutter/material.dart';
import 'package:uber_ride_clone/core/extensions/build_context.dart';

///Linear Horizontal Divider
class LinearHorizontalDivider extends StatelessWidget {
  ///Default Constructor
  const LinearHorizontalDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: context.width,
        child: Divider(
          color: Colors.grey[300],
          height: 2,
          thickness: 0.6,
        ),
      ),
    );
  }
}
