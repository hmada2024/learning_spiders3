//lib/quizzes_section/shared_quizzes/widgets/quiz_widget_helpers.dart
import 'package:flutter/material.dart';
import 'package:learning_spiders/core/config/app_constants.dart';

ButtonStyle getButtonStyleForAnswer(
  bool isCorrect,
  bool isWrong, {
  Color? textColor,
  Color? correctColor,
  Color? wrongColor, Color? defaultColor
}) {
   Color buttonColor;
    if (isCorrect) {
        buttonColor = correctColor ?? AppConstants.correctColor;
    } else if (isWrong) {
        buttonColor = wrongColor ?? AppConstants.wrongColor;
    } else {
        buttonColor = defaultColor ?? AppConstants.primaryColor;
    }
 return ElevatedButton.styleFrom(
    foregroundColor: textColor ?? AppConstants.textColorDark,
    backgroundColor: buttonColor,
    padding: EdgeInsets.zero,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
    ),
    elevation: 5.0,);
}

BoxDecoration getBoxDecorationForAnswer(bool isCorrect, bool isWrong,
    {required double borderRadius,
    required double shadowBlurRadius,
    required double shadowOffset,
    Color? defaultColor,
    Color? correctColor,
    Color? wrongColor,
    BoxBorder? border}){
     Color borderColor;

    if (isCorrect) {
        borderColor = correctColor ?? AppConstants.correctColor;
    } else if (isWrong) {
        borderColor = wrongColor ?? AppConstants.wrongColor;
    } else {
        borderColor = defaultColor ?? Colors.transparent;  }
  return BoxDecoration(
    borderRadius: BorderRadius.circular(borderRadius),
    border: border ??
        Border.all(
          color: borderColor,
          width: 5.0,
        ),
    boxShadow: [
      BoxShadow(
        color: AppConstants.shadowColor,
        spreadRadius: 0,
        blurRadius: shadowBlurRadius,
        offset: Offset(shadowOffset, shadowOffset),
      ),
    ],
  );
}