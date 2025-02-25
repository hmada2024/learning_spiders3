// lib/core/config/theme.dart (Modified to use AppConstants)
import 'package:flutter/material.dart';
import 'app_constants.dart';

class AppTheme {
  static const _baseTextTheme = TextTheme(
    displayLarge: TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.bold,
        fontFamily: 'Oswald'), //h1
    displayMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        fontFamily: 'Oswald'), //h2
    displaySmall:
        TextStyle(fontSize: 18, fontWeight: FontWeight.bold), //h3
    bodyLarge: TextStyle(fontSize: 16),
    bodyMedium: TextStyle(fontSize: 14),
    bodySmall: TextStyle(fontSize: 12),
    labelLarge: TextStyle(
        fontSize: 18, fontWeight: FontWeight.bold), // For buttons
  );

  static final lightTheme = ThemeData(
    colorScheme: const ColorScheme.light(
      primary: AppConstants.primaryColor,
      secondary: AppConstants.secondaryColor,
      surface: AppConstants.backgroundColorLight,
      error: AppConstants.errorColor,
      onPrimary: AppConstants.textColorLight,
      onSecondary: AppConstants.textColorLight,
      onSurface: AppConstants.textColorDark,
      onError: AppConstants.textColorLight,
      brightness: Brightness.light,
    ),
    fontFamily: AppConstants.defaultFontFamily,
    textTheme: _baseTextTheme.apply(
      bodyColor: AppConstants.textColorDark,
      displayColor: AppConstants.textColorDark,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(AppConstants.borderRadiusMedium),
        ),
        elevation: 2,
      ),
    ),
    cardTheme: CardTheme(
      elevation: AppConstants.defaultElevation,
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(AppConstants.borderRadiusLarge),
      ),
      color: AppConstants.cardBackgroundColor,
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius:
            BorderRadius.circular(AppConstants.borderRadiusLarge),
        borderSide: const BorderSide(color: AppConstants.secondaryColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius:
            BorderRadius.circular(AppConstants.borderRadiusLarge),
        borderSide:
            const BorderSide(color: AppConstants.primaryColor, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius:
            BorderRadius.circular(AppConstants.borderRadiusLarge),
        borderSide: const BorderSide(color: AppConstants.errorColor),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius:
            BorderRadius.circular(AppConstants.borderRadiusLarge),
        borderSide:
            const BorderSide(color: AppConstants.errorColor, width: 2),
      ),
      filled: true,
      fillColor: AppConstants.backgroundColorLight,
    ),
    appBarTheme: AppBarTheme(
      titleTextStyle: _baseTextTheme.displayMedium!
          .copyWith(color: AppConstants.textColorLight),
      iconTheme: const IconThemeData(color: Colors.white),
      centerTitle: true,
      backgroundColor: AppConstants.primaryColor,
      elevation: 0,
    ),
    switchTheme: SwitchThemeData(
      thumbColor:
          WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return AppConstants.primaryColor;
        }
        return null;
      }),
      trackColor:
          WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return AppConstants.primaryColor.withAlpha(100);
        }
        return null;
      }),
    ),
    sliderTheme: SliderThemeData(
      activeTrackColor: AppConstants.secondaryColor,
      inactiveTrackColor: Colors.grey[300],
      thumbColor: AppConstants.primaryColor,
      overlayColor:
          AppConstants.primaryColor.withValues(alpha: 0.2),
      thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10),
      overlayShape: const RoundSliderOverlayShape(overlayRadius: 20),
    ),
    listTileTheme: const ListTileThemeData(
      iconColor: AppConstants.primaryColor,
    ),
  );

  static final darkTheme = ThemeData(
    colorScheme: ColorScheme.dark(
      primary: AppConstants.primaryColor,
      secondary: AppConstants.secondaryColor,
      surface: AppConstants.backgroundColorDark,
      error: AppConstants.errorColor,
      onPrimary: AppConstants.textColorLight,
      onSecondary: AppConstants.textColorLight,
      onSurface: AppConstants.textColorLight,
      onError: AppConstants.textColorLight,
      brightness: Brightness.dark,
    ),
    fontFamily: AppConstants.defaultFontFamily,
    textTheme: _baseTextTheme.apply(
      bodyColor: AppConstants.textColorLight,
      displayColor: AppConstants.textColorLight,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(AppConstants.borderRadiusMedium),
        ),
        elevation: 2,
      ),
    ),
    cardTheme: CardTheme(
      elevation: AppConstants.defaultElevation,
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(AppConstants.borderRadiusLarge),
      ),
      color: AppConstants.backgroundColorDark,
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius:
            BorderRadius.circular(AppConstants.borderRadiusLarge),
        borderSide: const BorderSide(color: AppConstants.secondaryColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius:
            BorderRadius.circular(AppConstants.borderRadiusLarge),
        borderSide:
            const BorderSide(color: AppConstants.primaryColor, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius:
            BorderRadius.circular(AppConstants.borderRadiusLarge),
        borderSide: const BorderSide(color: AppConstants.errorColor),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius:
            BorderRadius.circular(AppConstants.borderRadiusLarge),
        borderSide:
            const BorderSide(color: AppConstants.errorColor, width: 2),
      ),
      filled: true,
      fillColor: AppConstants.backgroundColorDark,
    ),
    appBarTheme: AppBarTheme(
      titleTextStyle: _baseTextTheme.displayMedium!
          .copyWith(color: AppConstants.textColorLight),
      iconTheme: const IconThemeData(color: Colors.white),
      centerTitle: true,
      backgroundColor: AppConstants.primaryColor,
      elevation: 0,
    ),
    switchTheme: SwitchThemeData(
      thumbColor:
          WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return AppConstants.primaryColor;
        }
        return null;
      }),
      trackColor:
          WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return AppConstants.primaryColor.withAlpha(100);
        }
        return null;
      }),
    ),
    sliderTheme: SliderThemeData(
      activeTrackColor: AppConstants.secondaryColor,
      inactiveTrackColor: Colors.grey[300],
      thumbColor: AppConstants.primaryColor,
      overlayColor:
          AppConstants.primaryColor.withValues(alpha: 0.2),
      thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10),
      overlayShape: const RoundSliderOverlayShape(overlayRadius: 20),
    ),
    listTileTheme: const ListTileThemeData(
      iconColor: AppConstants.primaryColor,
    ),
  );
}