import 'package:flutter/material.dart';
import 'package:uber_ride_clone/presentation/ui/screens/home/index.dart';

///Startup widget.
class App extends StatelessWidget {
  ///Default constructor.
  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const HomeScreen();
  }
}
