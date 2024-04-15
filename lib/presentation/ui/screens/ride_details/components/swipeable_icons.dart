import 'package:flutter/material.dart';

/// Switch With icons that can be swiped.
class SwipableToggleSwitch<T> extends StatefulWidget {
  /// Default Constructor
  const SwipableToggleSwitch({
    required this.values,
    required this.width,
    required this.onToggleCallback,
    super.key,
    this.boxShape,
    this.backgroundColor = const Color(0xFFe7e7e8),
    this.buttonColor = const Color(0xFFFFFFFF),
    this.textColor = const Color(0xFF000000),
  });

  /// background color
  final Color backgroundColor;

  /// box shape
  final BoxShape? boxShape;

  /// button color
  final Color buttonColor;

  /// callback for the toggle when swipe
  final ValueChanged<int> onToggleCallback;

  /// text color
  final Color textColor;

  /// values for the toggle
  final List<T> values;

  /// width
  final double width;

  @override
  SwipableToggleSwitchState<T> createState() => SwipableToggleSwitchState<T>();
}

/// Actual state of the toggle swipable switch.
class SwipableToggleSwitchState<T> extends State<SwipableToggleSwitch<T>> {
  late int _index;

  set index(int value) {
    widget.onToggleCallback(value);
    setState(() {
      _index = value;
    });
  }

  ///Actual selected value index.
  int get index => _index;

  @override
  void initState() {
    _index = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width * 0.2,
      height: 32,
      child: Stack(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              index = index == 0 ? 1 : 0;
            },
            child: Container(
              width: widget.width * 0.25,
              height: 32,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    MediaQuery.of(context).size.width * 0.1,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  widget.values.length,
                  (index) => Container(
                    width: widget.width * 0.1,
                    height: 32,
                    alignment: Alignment.center,
                    child: T is String
                        ? Text(
                            widget.values[index] as String,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          )
                        : widget.values[index] as Widget,
                  ),
                ),
              ),
            ),
          ),
          AnimatedAlign(
            duration: const Duration(milliseconds: 250),
            curve: Curves.decelerate,
            alignment:
                index == 1 ? Alignment.centerLeft : Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.all(3),
              child: Container(
                width: widget.width * 0.1,
                height: 32,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  shape: widget.boxShape ?? BoxShape.circle,
                  borderRadius: widget.boxShape == BoxShape.rectangle
                      ? BorderRadius.circular(20)
                      : null,
                ),
                alignment: Alignment.center,
                child: T is String
                    ? Text(
                        widget.values[index] as String,
                        style: TextStyle(
                          fontSize: 14,
                          color: widget.textColor,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
