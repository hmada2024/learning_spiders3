import 'package:flutter/material.dart';
import 'package:learning_spiders/core/config/app_constants.dart';

class CorrectWrongMessage extends StatelessWidget {
  final bool isCorrect;
  final double correctTextSize;

  const CorrectWrongMessage({
    super.key,
    required this.isCorrect,
    required this.correctTextSize,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      isCorrect ? 'Correct!' : 'Wrong!',
      style: TextStyle(
        color: isCorrect ? AppConstants.correctColor : AppConstants.wrongColor,
          fontFamily: 'Oswald',
          fontWeight: FontWeight.bold,
        fontSize: correctTextSize,
      ),
    );
  }
}