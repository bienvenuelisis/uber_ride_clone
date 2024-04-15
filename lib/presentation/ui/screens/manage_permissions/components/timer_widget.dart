import 'dart:async';

import 'package:flutter/material.dart';

const int _aSec = 1;

///Timer widget builder
typedef TimerWidgetBuilder = Widget Function(
  BuildContext context,
  int seconds,
);

/// A Widget that starts a timer and disables itself until the timer is done.
class TimerWidget extends StatefulWidget {
  ///Default Constructor
  const TimerWidget({
    required this.builder,
    required this.timeOutAction,
    required this.timeOutInSeconds,
    super.key,
    this.resetTimerAfterTimeout = false,
  });

  /// Create a TimerWidget widget.
  ///
  /// The [builder], [timeOutAction], and [timeOutInSeconds]
  /// arguments must not be null.

  ///Widget child builder
  final TimerWidgetBuilder builder;

  ///[timeOutAction] Called when the button is tapped or otherwise activated.
  final VoidCallback timeOutAction;

  ///[timeOutInSeconds] after which the button is enabled
  final int timeOutInSeconds;

  ///
  final bool resetTimerAfterTimeout;

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  int _timeCounter = 0;
  bool _timeUpFlag = false;
  late Timer _timer;

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _timeCounter = widget.timeOutInSeconds;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateTime();
    });
  }

  void _onTimeout() {
    widget.timeOutAction();

    _timeUpFlag = false;
    _timeCounter = widget.timeOutInSeconds;
    _updateState();

    // reset the timer when the button is pressed
    if (widget.resetTimerAfterTimeout) {
      _updateTime();
    }
  }

  void _updateState() {
    if (mounted) {
      setState(() {});
    }
  }

  void _updateTime() {
    if (_timeUpFlag) {
      return;
    }
    _timer = Timer(const Duration(seconds: _aSec), () async {
      if (!mounted) return;
      _timeCounter--;
      _updateState();
      if (_timeCounter > 0) {
        _updateTime();
      } else {
        _timeUpFlag = true;
        _onTimeout();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, _timeCounter);
  }
}
