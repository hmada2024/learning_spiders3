//lib/quizzes_section/shared_quizzes/widgets/quiz_option_tile.dart
import 'package:flutter/material.dart';
import 'package:learning_spiders/core/config/app_constants.dart';
import 'package:learning_spiders/core/data/models/nouns_model.dart';
import 'package:learning_spiders/quizzes_section/shared_quizzes/widgets/quiz_widget_helpers.dart';

class QuizOptionTile extends StatefulWidget {
  final dynamic data;
  final VoidCallback? onTap;
  final bool isSelected;
  final bool isCorrect;
  final bool isWrong;
  final bool isImageOption;
  final ValueNotifier<bool> selectionNotifier;

  const QuizOptionTile({
    super.key,
    required this.data,
    this.onTap,
    required this.isSelected,
    required this.isCorrect,
    required this.isWrong,
    this.isImageOption = false,
    required this.selectionNotifier,
  });

  @override
  QuizOptionTileState createState() => QuizOptionTileState();
}

class QuizOptionTileState extends State<QuizOptionTile> {
  @override
  void initState() {
    super.initState();
    widget.selectionNotifier.value = widget.isSelected;
  }

  @override
  void didUpdateWidget(covariant QuizOptionTile oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isSelected != oldWidget.isSelected) {
      widget.selectionNotifier.value = widget.isSelected;
    }
  }
  @override
  Widget build(BuildContext context) {
    final boxDecoration = getBoxDecorationForAnswer(
      widget.isSelected && widget.isCorrect,
      widget.isSelected && widget.isWrong,
      borderRadius: AppConstants.borderRadiusMedium,
      shadowBlurRadius: 2.0,
      shadowOffset: 2.0,
      defaultColor: Colors.grey[200],
      correctColor: AppConstants.correctColor,
      wrongColor: AppConstants.wrongColor,
    );

    final buttonStyle = getButtonStyleForAnswer(
      widget.isSelected && widget.isCorrect,
      widget.isSelected && widget.isWrong,
      defaultColor: Colors.grey[200],
      correctColor: AppConstants.correctColor,
      wrongColor: AppConstants.wrongColor,
    );

    Widget content;

    if (widget.isImageOption &&
        widget.data is Noun &&
        widget.data.image != null) {
      content = Image.memory(
        widget.data.image!,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => Image.asset(
          'assets/images/placeholder_image.jpg',
          fit: BoxFit.cover,
        ),
      );
    } else {
      String text =
          (widget.data is Noun) ? widget.data.name : widget.data.toString();
      content = Center(
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold,
            color: AppConstants.textColorDark,
          ),
          textAlign: TextAlign.center,
        ),
      );
    }

    return GestureDetector(
      onTap: () {
        widget.selectionNotifier.value = true;
        widget.onTap?.call();
      },
      child: Container(
        decoration: boxDecoration,
        child: widget.isImageOption
            ? ClipRRect(
                borderRadius:
                    BorderRadius.circular(AppConstants.borderRadiusMedium),
                child: content,
              )
            : SizedBox(
                height: 50.0,
                child: ElevatedButton(
                  onPressed: () {
                    widget.selectionNotifier.value =
                        true;
                    widget.onTap?.call();
                  },
                  style: buttonStyle,
                  child: content,
                ),
              ),
      ),
    );
  }
}