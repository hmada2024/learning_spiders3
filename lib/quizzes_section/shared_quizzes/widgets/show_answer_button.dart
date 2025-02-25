import 'package:flutter/material.dart';
import 'package:learning_spiders/core/config/app_constants.dart';
import 'package:learning_spiders/core/config/screen_size.dart';

class ShowAnswerButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool isEnabled;

  const ShowAnswerButton({
    super.key,
    this.onPressed,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = ScreenSize.getWidth(context);
    return Container(
      margin: EdgeInsets.only(
          bottom: screenWidth * 0.02, right: screenWidth * 0.02),
      child: FloatingActionButton.extended(
        onPressed: isEnabled ? onPressed : null,
        backgroundColor: AppConstants.successColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
          side: BorderSide(color: AppConstants.greyColor),
        ),
        label: Text(
          'Show Answer',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: screenWidth * 0.05,
            fontWeight: FontWeight.bold,
            color: AppConstants.textColorLight,
          ),
        ),
      ),
    );
  }
}