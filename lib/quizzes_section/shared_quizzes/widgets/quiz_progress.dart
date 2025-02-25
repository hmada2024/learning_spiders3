import 'package:flutter/material.dart';
import 'package:learning_spiders/core/config/app_constants.dart';
import 'package:learning_spiders/core/config/screen_size.dart';

class QuizProgress extends StatelessWidget {
  final int totalQuestions;
  final int score;
  final int answeredQuestions;

  const QuizProgress({
    super.key,
    required this.totalQuestions,
    required this.score,
    required this.answeredQuestions,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = ScreenSize.getWidth(context);
    final screenHeight = ScreenSize.getHeight(context);

    return Card(
        elevation: AppConstants.defaultElevation,
        color: AppConstants.cardBackgroundColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium)),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.04, vertical: screenHeight * 0.01),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Total Questions: $totalQuestions',
              style: TextStyle(
                  fontSize: screenWidth * 0.04,
                    fontFamily: AppConstants.defaultFontFamily,
                  fontWeight: FontWeight.bold,
                  color:  AppConstants.greyTextColor),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildScoreItem(
                  label: 'Correct',
                  value: score,
                  color: AppConstants.correctColor,
                  fontSize: screenWidth * 0.035,
                ),
                _buildScoreItem(
                  label: 'Answered',
                  value: answeredQuestions,
                  color: AppConstants.warningColor,
                  fontSize: screenWidth * 0.035,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildScoreItem({
    required String label,
    required int value,
    required Color color,
    required double fontSize,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 1.8),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(
            label,
            style: TextStyle(
                fontSize: fontSize * 0.8,
                  fontFamily: AppConstants.defaultFontFamily,
                color: AppConstants.textColorLight,
                fontWeight: FontWeight.bold),
          ),
          Text(
            '$value',
            style: TextStyle(
                fontSize: fontSize,
                  fontFamily: AppConstants.defaultFontFamily,
                color: AppConstants.textColorLight,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}