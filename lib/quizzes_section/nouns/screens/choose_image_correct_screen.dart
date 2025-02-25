//lib/quizzes_section/nouns/screens/choose_image_correct_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_spiders/core/config/app_routes.dart';
import 'package:learning_spiders/core/config/screen_size.dart';
import 'package:learning_spiders/core/data/models/nouns_model.dart';
// import 'package:learning_spiders/core/widgets/shared/category_filter.dart'; // <--- محذوف
import 'package:learning_spiders/core/widgets/shared/confirmation_dialog.dart';
import 'package:learning_spiders/core/widgets/shared/error_display.dart';
import 'package:learning_spiders/quizzes_section/nouns/blocs/choose_correct_answer/choose_correct_answer_bloc.dart';
import 'package:learning_spiders/quizzes_section/nouns/blocs/choose_correct_answer/choose_correct_answer_event.dart';
import 'package:learning_spiders/quizzes_section/nouns/blocs/choose_correct_answer/choose_correct_answer_state.dart';
import 'package:learning_spiders/quizzes_section/shared_quizzes/widgets/quiz_option_tile.dart';
import 'package:learning_spiders/quizzes_section/shared_quizzes/widgets/generic_quiz_page.dart';
import 'package:learning_spiders/quizzes_section/shared_quizzes/widgets/question_element.dart';
import 'package:learning_spiders/quizzes_section/shared_quizzes/widgets/quiz_content_layout.dart';

class ChooseImageCorrectScreen extends StatelessWidget {
  static var routeName = AppRoutes.chooseImageCorrectQuiz;

  const ChooseImageCorrectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ChooseImageCorrectView();
  }
}

class ChooseImageCorrectView extends StatefulWidget {
  const ChooseImageCorrectView({super.key});

  @override
  State<ChooseImageCorrectView> createState() => _ChooseImageCorrectViewState();
}

class _ChooseImageCorrectViewState extends State<ChooseImageCorrectView> {
  final Map<dynamic, ValueNotifier<bool>> _selectionNotifiers = {};

  @override
  void dispose() {
    for (final notifier in _selectionNotifiers.values) {
      notifier.dispose();
    }
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    context
        .read<ChooseCorrectAnswerBloc>()
        .add(const SetQuizType(quizType: QuizType.imageBased));
        context.read<ChooseCorrectAnswerBloc>().add(const LoadNouns(category: "all"));
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = ScreenSize.getWidth(context);
    final screenHeight = ScreenSize.getHeight(context);
    final optionsSpacing = screenWidth * 0.05;
    final questionElementHeight = screenHeight * 0.15;
    final topInfoHeight = screenHeight * 0.15;
    final correctMessageFontSize = screenWidth * 0.05;
    final baseQuizPadding = screenWidth * 0.03;
    const optionsAspectRatioValue = 1.3;
    final bottomPadding = screenHeight * 0.02;

    final leadingWidget = IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        final bloc = context.read<ChooseCorrectAnswerBloc>();
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return ConfirmationDialog(
              title: 'Confirm Exit',
              content:
                  'Are you sure you want to exit? The current quiz will be stopped.',
              confirmText: 'OK',
              onConfirm: () {
                bloc.add(StopAudio());
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
              cancelText: 'Cancel',
              onCancel: () {
                Navigator.of(context).pop();
              },
            );
          },
        );
      },
    );

    // محذوف:  CategoryFilterDropdown
    // محذوف:  actionsWidgets

    final quizContent =
        BlocBuilder<ChooseCorrectAnswerBloc, ChooseCorrectAnswerState>(
      builder: (context, state) {
        if (state.status == ChooseCorrectAnswerStatus.error) {
          return ErrorDisplay(
            errorMessage: state.error!,
            onRetry: () => context
                .read<ChooseCorrectAnswerBloc>()
                .add(const LoadNouns(category: 'all')), //  <--  تأكد من أنك تقوم بتحميل البيانات هنا
          );
        }

        if (state.status == ChooseCorrectAnswerStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.status == ChooseCorrectAnswerStatus.completed) {
          return const Center(
            child: Text('Quiz Completed!'),
          );
        }

        return QuizContentLayout<Noun>(
          title: 'Choose Image Correct',
          topInfoHeight: topInfoHeight,
          questionWidget: GestureDetector(
            onTap: state.status == ChooseCorrectAnswerStatus.questionReady
                ? () => context
                    .read<ChooseCorrectAnswerBloc>()
                    .add(PlayAudio(audioBytes: state.currentNoun?.audio))
                : null,
            child: QuestionElement<String>(
              data: state.currentNoun?.name,
              textSize: screenWidth * 0.06,
              containerPaddingHorizontal: screenWidth * 0.05,
              containerPaddingVertical: screenHeight * 0.02,
              containerBorderRadius: 15,
              shadowSpreadRadius: 2,
              shadowBlurRadius: 5,
              shadowOffsetDy: 3,
            ),
          ),
          questionWidgetHeight: questionElementHeight,
          answerOptions: state.answerOptions.map((option) {
            if (option is Noun) {
              final notifier = _selectionNotifiers.putIfAbsent(
                  option.id, () => ValueNotifier<bool>(false));

              return ValueListenableBuilder<bool>(
                valueListenable: notifier,
                builder: (context, isSelected, child) {
                  return QuizOptionTile(
                    data: option,
                    onTap: () {
                      if (state.status ==
                          ChooseCorrectAnswerStatus.questionReady) {
                        context
                            .read<ChooseCorrectAnswerBloc>()
                            .add(CheckAnswer(selectedAnswer: option));
                      }
                    },
                    isSelected: isSelected,
                    isCorrect:
                        state.status == ChooseCorrectAnswerStatus.correct &&
                            option.id == state.currentNoun?.id,
                    isWrong:
                        state.status == ChooseCorrectAnswerStatus.wrong &&
                            option.id != state.currentNoun?.id,
                    isImageOption: true,
                    selectionNotifier: notifier,
                  );
                },
              );
            } else {
              return const SizedBox.shrink();
            }
          }).toList(),
          score: state.score,
          answeredQuestions: state.answeredQuestions,
          totalQuestions: state.totalQuestions,
          isCorrect: state.status == ChooseCorrectAnswerStatus.correct,
          isWrong: state.status == ChooseCorrectAnswerStatus.wrong,
          onResetQuiz: () =>
              context.read<ChooseCorrectAnswerBloc>().add(ResetQuiz()),
          optionsAspectRatio: optionsAspectRatioValue,
          optionsCrossAxisCount: 2,
          optionsType: QuizOptionsType.images,
          optionsSpacing: optionsSpacing,
          correctMessageFontSize: correctMessageFontSize,
          baseQuizPadding: baseQuizPadding,
          bottomPadding: bottomPadding,
        );
      },
    );

    return GenericQuizPage(
      title: 'Choose Image Correct',
      leading: leadingWidget,
      // محذوف:  actions: actionsWidgets,
      content: quizContent,
    );
  }
}