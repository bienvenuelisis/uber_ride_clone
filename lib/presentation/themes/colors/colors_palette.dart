import 'package:flutter/material.dart';

/// App colors palette
abstract class ColorsPalette {
  //* Container colors

  /// Page background color for light theme.
  static const background = Color(0xFFffffff);

  /// Page background color for dark theme.
  static const backgroundDark = Color(0xFF1b1b1b);

  /// Text Input background color.
  static const inputBackground = Color(0xFFe8e8e8);

  /// Small card badge background color.
  static const smallCardBadgeBackground = Color(0xFF028342);

  /// Ad Card Background color.
  static const adCardBackground = Color(0xFF521017);

  //* Text colors

  /// Selected tab text color.
  static const selectedTabText = Color(0xFF1b1b1b);

  /// Selected tab text color.
  static const tabText = Color(0xFF777777);

  ///Selected Bottom Nav Bar Item Text Color
  static const selectedBottomNavBarItemText = Color(0xFF646464);

  /// Bottom Nav Bar Item Text Color
  static const bottomNavBarItemText = Color(0xFFc8c8c8);

  /// Input text color.
  static const inputText = Color(0xFF656565);

  /// ListTile Primary text color.
  static const listTilePrimaryText = Color(0xFF2b2b2b);

  /// ListTile Secondary text color.
  static const listTileSecondaryText = Color(0xFF929292);

  /// Section Title text color.
  static const sectionTitleText = Color(0xFF1b1b1b);

  /// Section complementary text color.
  static const sectionComplementaryText = Color(0xFF767676);

  /// Small card actionnable text color.
  static const smallCardActionnableText = Color(0xFF6a6a6a);

  /// Small card badge text color.
  static const smallCardBadgeText = Color(0xFF7ec7a7);

  ///  Large card actionnable primary text color.
  static const largeCardActionnablePrimaryText = Color(0xFF4e4e4e);

  ///  Large card actionnable secondary text color.
  static const largeCardActionnableSecondaryText = Color(0xFF4e4e4e);

  /// Ad Card Primary Text color.
  static const adCardPrimaryText = Color(0xFFf2eceb);

  /// Ad Card Secondary Text color.
  static const adCardSecondaryText = Color(0xFFe8dbdd);

  //* Predefined colors

  /// Primary color.
  static const primary = Color(0xFF028342);

  /// Secondary color.
  static const secondary = Color(0xFF028342);

  /// Tertiary color.
  static const tertiary = Color(0xFF028342);

  /// Red Background color.
  static const red = Color(0xFFfb503f);

  /// Yellow Background color.
  static const yellow = Color(0xFFe8dbdd);
}
