// lib/core/constants/theme_constants.dart
import 'package:flutter/material.dart';

class ThemeConstants {
  // Colors
  static const Color primaryColor = Color(0xFF2962FF);
  static const Color secondaryColor = Color(0xFF4CAF50);
  static const Color accentColor = Color(0xFF448AFF);
  static const Color errorColor = Color(0xFFFF5252);
  static const Color successColor = Color(0xFF4CAF50);
  static const Color warningColor = Color(0xFFFF9800);
  static const Color textColorDark = Color(0xFF212121);
  static const Color textColorLight = Color(0xFFFFFFFF);
  static const Color backgroundColorLight = Color(0xFFF5F5F5);
  static Color backgroundColorDark = Colors.grey.shade900;
  static const Color shadowColor = Color(0x42000000);
  static const Color disabledColor = Color(0xFFE0E0E0);
  static const Color cardBackgroundColor = Color(0xFFE3F2FD);
  static Color iconColor = const Color(0xFF1E88E5);
  static const Color blueDark = Color.fromARGB(255, 4, 55, 149);
  static Color greyColor = Colors.grey.shade300;
  static Color greyTextColor = Colors.blueGrey.shade800;

  // Gradients (Optional, but nice to have)
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF448AFF), Color(0xFF2962FF)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Fonts Sizes
  static const double fontSizeExtraSmall = 12.0;
  static const double fontSizeSmall = 14.0;
  static const double fontSizeMedium = 16.0;
  static const double fontSizeLarge = 18.0;
  static const double fontSizeExtraLarge = 20.0;
  static const double fontSizeHeading = 24.0;
  static const String defaultFontFamily = 'Roboto';

  // Paddings
  static const double paddingExtraSmall = 4.0;
  static const double paddingSmall = 8.0;
  static const double paddingMedium = 16.0;
  static const double paddingLarge = 24.0;
  static const double paddingExtraLarge = 32.0;

  // Margins
  static const double marginExtraSmall = 4.0;
  static const double marginSmall = 8.0;
  static const double marginMedium = 16.0;
  static const double marginLarge = 24.0;
  static const double marginExtraLarge = 32.0;

  // Border Radius
  static const double borderRadiusSmall = 2.0;
  static const double borderRadiusMedium = 8.0;
  static const double borderRadiusLarge = 12.0;
  static const double borderRadiusExtraLarge = 16.0;

  // Icons Sizes
  static const double iconSizeExtraSmall = 16.0;
  static const double iconSizeSmall = 24.0;
  static const double iconSizeMedium = 32.0;
  static const double iconSizeLarge = 40.0;
  static const double iconSizeExtraLarge = 48.0;

  // Animations durations
  static const Duration animationDurationShort = Duration(milliseconds: 200);
  static const Duration animationDurationMedium = Duration(milliseconds: 500);
  static const Duration animationDurationLong = Duration(milliseconds: 1000);

  // Buttons Heights
  static const double buttonHeightSmall = 40.0;
  static const double buttonHeightMedium = 48.0;
  static const double buttonHeightLarge = 56.0;

  // Buttons Widths
  static const double buttonWidthSmall = 120.0;
  static const double buttonWidthMedium = 160.0;
  static const double buttonWidthLarge = 200.0;

  // Matching Quiz
  static const Color correctColor = Color(0xFF4CAF50);
  static const Color wrongColor = Color(0xFFFF5252);
  static const double conjugationCardRadius = 12.0;
}
