//lib/quizzes_section/shared_quizzes/widgets/answers_options_element.dart
import 'package:flutter/material.dart';
import 'package:learning_spiders/core/config/app_constants.dart';
import 'package:learning_spiders/core/data/models/nouns_model.dart';
import 'package:learning_spiders/quizzes_section/shared_quizzes/widgets/quiz_widget_helpers.dart';

class AnswersOptionsElement<T> extends StatelessWidget {
  final T data;
  final VoidCallback? onTap;
  final bool isCorrect;
  final bool isWrong;
  final double borderRadius;
  final double shadowBlurRadius;
  final double shadowOffset;
  final Color? defaultColor;
  final Color? correctColor;
  final Color? wrongColor;
  final bool isDisabled;
  final double fontSize;
  final Color? textColor;
  final double elevation;
  final BoxBorder? border;
  final ButtonStyle? buttonStyle;
  final double? imageHeight;
  final bool showImage;
  final bool isSelected;

  const AnswersOptionsElement({
    super.key,
    required this.data,
    this.onTap,
    this.isCorrect = false,
    this.isWrong = false,
    required this.borderRadius,
    this.shadowBlurRadius = 0.0,
    this.shadowOffset = 0.0,
    this.defaultColor,
    this.correctColor,
    this.wrongColor,
    this.isDisabled = false,
    this.fontSize = 16.0,
    this.textColor,
    this.elevation = 0.0,
    this.border,
    this.buttonStyle,
    this.imageHeight,
    this.showImage = true,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    final boxDecoration = getBoxDecorationForAnswer(
      isSelected && isCorrect,
      isSelected && isWrong,
      borderRadius: borderRadius,
      shadowBlurRadius: shadowBlurRadius,
      shadowOffset: shadowOffset,
      defaultColor: defaultColor,
      correctColor: correctColor,
      wrongColor: wrongColor,
      border: border,
    );

    if (data is Noun) {
      final noun = data as Noun;
      if (showImage && noun.image != null) {
        // Display image
        return GestureDetector(
          onTap: isDisabled
              ? null
              : () {
                  if (onTap != null) {
                    onTap!();
                  }
                },
          child: Opacity(
            opacity: isDisabled ? 0.5 : 1.0,
            child: Container(
              decoration: boxDecoration,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(borderRadius),
                child: SizedBox(
                  height: imageHeight,
                  child: Image.memory(
                    noun.image!,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        'assets/images/placeholder_image.jpg',
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        );
      } else {
        // Display word as button
        return SizedBox(
          height: 50.0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0.0),
            child: ElevatedButton(
              onPressed: isDisabled
                  ? null
                  : () {
                      if (onTap != null) {
                        onTap!();
                      }
                    },
              style: buttonStyle ??
                  getButtonStyleForAnswer(
                    isSelected && isCorrect,
                    isSelected && isWrong,
                    textColor: textColor,
                    defaultColor:
                        defaultColor,
                    correctColor: correctColor,
                    wrongColor: wrongColor,
                  ).copyWith(
                    shape:
                        WidgetStateProperty.resolveWith<RoundedRectangleBorder>(
                            (states) => RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(borderRadius),
                                )),
                    elevation: WidgetStateProperty.resolveWith<double>(
                        (states) => elevation),
                  ),
              child: Center(
                child: Text(
                  noun.name,
                  style: TextStyle(
                      fontSize: fontSize,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                      color: textColor ?? AppConstants.textColorDark),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        );
      }
    } else {
      return const SizedBox.shrink(); // Or return a default widget
    }
  }
}