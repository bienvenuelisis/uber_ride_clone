import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_directions/google_maps_directions.dart';
import 'package:uber_ride_clone/app.dart';
import 'package:uber_ride_clone/core/config/google_place.dart';
import 'package:uber_ride_clone/presentation/themes/app_theme.dart';

void main() {
  GoogleMapsDirections.init(googleAPIKey: googleMapsApiKey);

  runApp(const ProviderScope(child: MainApp()));
}

/// Main application run for test modes.
class MainApp extends StatelessWidget {
  ///Default constructor.
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Uber Clone [DEV]',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.light, //ThemeMode.system,
      home: const App(),
    );
  }
}
