import 'package:flutter/material.dart';
import 'package:learning_spiders/core/config/app_constants.dart';

class NextQuestionButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool isEnabled;

  const NextQuestionButton({
    super.key,
    required this.onPressed,
    required this.isEnabled,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.arrow_forward_ios,
        color: isEnabled ? AppConstants.correctColor : AppConstants.wrongColor,
      ),
      onPressed: isEnabled ? onPressed : null,
    );
  }
}
