//lib/core/widgets/shared/audio_button.dart
import 'package:flutter/material.dart';
import 'package:learning_spiders/core/config/app_constants.dart';

class AudioButton extends StatelessWidget {
  final double iconSize;
  final VoidCallback? onPressed;

  const AudioButton({super.key, required this.iconSize, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.volume_up,
        color: AppConstants.primaryColor,
        size: iconSize,
      ),
      onPressed: onPressed,
    );
  }
}