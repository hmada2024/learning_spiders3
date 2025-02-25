import 'package:flutter/material.dart';
import 'package:learning_spiders/quizzes_section/shared_quizzes/widgets/correct_wrong_message.dart';
import 'package:learning_spiders/quizzes_section/shared_quizzes/widgets/quiz_progress.dart';

enum QuizOptionsType { words, images }

class QuizContentLayout<T> extends StatelessWidget {
  final String title;
  final Widget questionWidget;
  final List<Widget> answerOptions;
  final int score;
  final int answeredQuestions;
  final int totalQuestions;
  final bool isCorrect;
  final bool isWrong;
  final VoidCallback onResetQuiz;
  final QuizOptionsType optionsType;
  final Widget? leading;
  final List<Widget>? actions;
  final double? optionsAspectRatio;
  final int? optionsCrossAxisCount;
  final double topInfoHeight;
  final double questionWidgetHeight;
  final double optionsSpacing;
  final double correctMessageFontSize;
  final double baseQuizPadding;
  final double bottomPadding;

  const QuizContentLayout({
    super.key,
    required this.title,
    required this.questionWidget,
    required this.answerOptions,
    required this.score,
    required this.answeredQuestions,
    required this.totalQuestions,
    required this.isCorrect,
    required this.isWrong,
    required this.onResetQuiz,
    required this.optionsType,
    this.leading,
    this.actions,
    this.optionsAspectRatio,
    this.optionsCrossAxisCount,
    required this.topInfoHeight,
    required this.questionWidgetHeight,
    required this.optionsSpacing,
    required this.correctMessageFontSize,
    required this.baseQuizPadding,
    required this.bottomPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(baseQuizPadding),
      child: Column(
        children: [
          SizedBox(
            height: topInfoHeight,
            child: QuizProgress(
              totalQuestions: totalQuestions,
              score: score,
              answeredQuestions: answeredQuestions,
            ),
          ),
          SizedBox(height: optionsSpacing),
          SizedBox(height: questionWidgetHeight, child: questionWidget),
          SizedBox(height: optionsSpacing),
          Flexible(
            fit: FlexFit.loose,
            child: GridView.count(
              crossAxisCount: optionsCrossAxisCount ?? 2,
              shrinkWrap: true,
              crossAxisSpacing: optionsSpacing,
              mainAxisSpacing: optionsSpacing,
              childAspectRatio: optionsAspectRatio ??
                  (optionsType == QuizOptionsType.images ? 1.3 : 2.5),
              children: answerOptions,
            ),
          ),
          SizedBox(height: bottomPadding),
          if (isCorrect || isWrong)
            CorrectWrongMessage(
              isCorrect: isCorrect,
              correctTextSize: correctMessageFontSize,
            ),
        ],
      ),
    );
  }
}