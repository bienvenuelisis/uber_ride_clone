import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_directions/google_maps_directions.dart';
import 'package:uber_ride_clone/app.dart';
import 'package:uber_ride_clone/core/config/google_place.dart';
import 'package:uber_ride_clone/presentation/themes/app_theme.dart';
import 'package:uber_ride_clone/presentation/themes/app_theme_notifier.dart';

void main() {
  GoogleMapsDirections.init(googleAPIKey: googleMapsApiKey);

  runApp(const ProviderScope(child: MainApp()));
}

/// Main application run for productions modes.
class MainApp extends ConsumerWidget {
  ///Default constructor.
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _ = ref.watch(appThemeProvider);

    return MaterialApp(
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.light,
      // themeMode: theme.themeMode,
      debugShowCheckedModeBanner: false,
      title: 'Uber Clone',
      home: const App(),
    );
  }
}
