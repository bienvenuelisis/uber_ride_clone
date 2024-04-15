import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///App theme notifier.
class AppThemeNotifier with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  ///Actual theme mode.
  ThemeMode get themeMode => _themeMode;

  set themeMode(ThemeMode themeMode) {
    _themeMode = themeMode;
    notifyListeners();
  }

  /// Change theme mode to dark.
  void darkMode() {
    themeMode = ThemeMode.dark;
  }

  /// Change theme mode to light.
  void lightMode() {
    themeMode = ThemeMode.dark;
  }
}

///App theme provider.
final appThemeProvider = Provider((_) => AppThemeNotifier());
