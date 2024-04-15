import 'package:flutter/material.dart';

///Extensions on BuildContext.
extension BuildContextExtensions on BuildContext {
  /// Get the current app default text style.
  DefaultTextStyle get defaultTextStyle => DefaultTextStyle.of(this);

  /// Get the actual screen information .
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  /// Get the current app navigator.
  NavigatorState get navigator => Navigator.of(this);

  /// Get the current app focus scope.
  FocusScopeNode get focusScope => FocusScope.of(this);

  /// Get the current app scaffold.
  ScaffoldState get scaffold => Scaffold.of(this);

  /// Get the current app scaffold messenger.
  ScaffoldMessengerState get scaffoldMessenger => ScaffoldMessenger.of(this);

  /// Get the current screen size.
  Size get size => MediaQuery.of(this).size;

  /// Get the current screen width.
  double get width => size.width;

  /// Get the current screen height.
  double get height => size.height;
}
