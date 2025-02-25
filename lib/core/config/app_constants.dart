// lib/core/config/app_constants.dart
import 'package:flutter/material.dart';

class AppConstants {
  // General
  static const String databaseName = 'learning_spiders_database.db';
  static const String userDatabaseName = 'users_manager.db';

  // Colors (Removed duplicates and added missing ones)
  static const Color primaryColor = Color(0xFF2962FF);
  static const Color secondaryColor = Color(0xFF4CAF50);
  static const Color accentColor = Color(0xFF448AFF);
  static const Color errorColor = Color(0xFFFF5252); // Red color
  static const Color successColor = Color(0xFF4CAF50);
  static const Color warningColor = Color(0xFFFF9800);
  static const Color textColorDark = Color(0xFF212121);
  static const Color textColorLight = Color(0xFFFFFFFF);
  static const Color backgroundColorLight = Color(0xFFF5F5F5);
  static Color backgroundColorDark = Colors.grey.shade900;
  static const Color shadowColor = Color(0x42000000);
  static const Color disabledColor = Color(0xFFE0E0E0);
  static const Color cardBackgroundColor = Color(0xFFE3F2FD);
  static Color iconColor = const Color.fromARGB(255, 4, 66, 120);
  static const Color blueDark = Color.fromARGB(255, 4, 55, 149);
  static Color greyColor = Colors.grey.shade300;
  static Color greyTextColor = Colors.blueGrey.shade800;

  static Color exampleHighlightColor = Colors.green.shade700; //  <--  للأمثلة

  // Matching Quiz
  static const Color correctColor = successColor; // Use successColor
  static const Color wrongColor = errorColor;     // Use errorColor
  static const String correctAnswerSound = 'assets/sounds/correct.mp3';
  static const String wrongAnswerSound = 'assets/sounds/wrong.mp3';

  // Quiz Options Dialog Strings
  static const String quizOptionsTitle = "Quiz Options";
  static const String showTheWordOption = "Show The Word";
  static const String autoplayAudioOption = "Autoplay Audio";
  static const String backButtonText = "Back";
  static const String startQuizButtonText = "Start Quiz";


  // Sizes (Consistent naming, kept only necessary ones, removed static getters)
  static const double defaultElevation = 4.0;
  static const double cardRadius = 12.0;
  static const double cardMarginVertical = 8.0;
  static const double cardMarginHorizontal = 16.0;
  static const double conjugationCardRadius = 12.0;
  static const double borderRadiusSmall = 2.0; // Added for consistency
  static const double borderRadiusMedium = 8.0;
  static const double borderRadiusLarge = 12.0;

  // Fonts
  static const String defaultFontFamily = 'Roboto';
  static const double fontSizeSmall = 14.0;
  static const double fontSizeMedium = 16.0;
  static const double fontSizeLarge = 18.0;
  static const double fontSizeHeading = 24.0;

  // Paddings
  static const double paddingSmall = 8.0;
  static const double paddingMedium = 16.0;
  static const double paddingLarge = 24.0;

  // Icons Sizes
  static const double iconSizeSmall = 24.0;
  static const double iconSizeMedium = 32.0;

  // Animation durations (kept the useful one)
  static const Duration animationDurationMedium = Duration(milliseconds: 500);
}