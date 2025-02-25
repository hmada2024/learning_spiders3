//lib/core/widgets/shared/name_overlay.dart
import 'package:flutter/material.dart';
import 'package:learning_spiders/core/config/app_constants.dart';

class NameOverlay extends StatelessWidget {
  final String name;
  final double fontSize;
  final Color textColor; // Add textColor

  const NameOverlay(
      {super.key,
      required this.name,
      required this.fontSize,
      this.textColor = AppConstants.textColorDark});

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: fontSize.clamp(14.0, 24.0),
        fontWeight: FontWeight.bold,
        color: textColor, // Use textColor
        fontFamily: AppConstants.defaultFontFamily,
      ),
    );
  }
}