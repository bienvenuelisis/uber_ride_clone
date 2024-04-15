import 'package:flutter/material.dart';

///Vertical Dots
class VerticalDots extends StatelessWidget {
  ///Default Constructor
  const VerticalDots({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Icon(Icons.arrow_downward_rounded),
        Dot(color: Colors.black38, size: 2),
        Dot(color: Colors.black38, size: 2),
        Dot(color: Colors.black38, size: 2),
        Dot(color: Colors.black38, size: 2),
        Icon(Icons.location_on),
      ],
    );
  }
}

///Rounded Container filled with color.
class Dot extends StatelessWidget {
  ///Default constructor
  const Dot({
    required this.color,
    required this.size,
    super.key,
  });

  ///Color of the dot
  final Color color;

  ///Size of the dot
  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size, // Adjust size here
      width: size, // Adjust size here
      child: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color, // Adjust color here
        ),
      ),
    );
  }
}
