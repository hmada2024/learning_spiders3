//lib/core/widgets/shared/custom_button.dart
import 'package:flutter/material.dart';
import 'package:learning_spiders/core/config/screen_size.dart';

class CustomButton extends StatelessWidget {
  final String labelText;
  final IconData? icon;
  final ButtonStyle style;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.labelText,
    this.icon,
    required this.style,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = ScreenSize.getWidth(context);
    final iconSize = screenWidth * 0.05;
    final spacing = screenWidth * 0.02; 

    return ElevatedButton(
      onPressed: onPressed,
      style: style,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) Icon(icon, size: iconSize),
          if (icon != null) SizedBox(width: spacing), 
          Text(labelText),
        ],
      ),
    );
  }
}