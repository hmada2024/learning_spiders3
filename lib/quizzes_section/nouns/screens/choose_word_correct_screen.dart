//lib/quizzes_section/nouns/screens/choose_word_correct_screen.dart
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:learning_spiders/core/config/app_routes.dart';
import 'package:learning_spiders/core/config/screen_size.dart';
import 'package:learning_spiders/core/data/repositories/noun_repository.dart';
import 'package:learning_spiders/core/services/audio_service.dart';
import 'package:learning_spiders/core/widgets/shared/confirmation_dialog.dart';
import 'package:learning_spiders/core/widgets/shared/error_display.dart';
import 'package:learning_spiders/quizzes_section/nouns/blocs/choose_word_correct/choose_word_correct_bloc.dart';
import 'package:learning_spiders/quizzes_section/nouns/blocs/choose_word_correct/choose_word_correct_event.dart';
import 'package:learning_spiders/quizzes_section/nouns/blocs/choose_word_correct/choose_word_correct_state.dart';
import 'package:learning_spiders/quizzes_section/shared_quizzes/widgets/quiz_option_tile.dart'; // Import QuizOptionTile
import 'package:learning_spiders/quizzes_section/shared_quizzes/widgets/generic_quiz_page.dart';
import 'package:learning_spiders/quizzes_section/shared_quizzes/widgets/question_element.dart';
import 'package:learning_spiders/quizzes_section/shared_quizzes/widgets/quiz_content_layout.dart';

class ChooseWordCorrectScreen extends StatelessWidget {
  static var routeName = AppRoutes.chooseWordCorrectQuiz;

  const ChooseWordCorrectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ChooseWordCorrectBloc>(
      create: (context) => ChooseWordCorrectBloc(
        GetIt.instance<NounRepository>(),
        GetIt.instance<AudioService>(),
      )..add(const LoadNouns(category: 'all')),
      child: const ChooseWordCorrectView(),
    );
  }
}

class ChooseWordCorrectView extends StatefulWidget {
  const ChooseWordCorrectView({super.key});

  @override
  State<ChooseWordCorrectView> createState() => _ChooseWordCorrectViewState();
}

class _ChooseWordCorrectViewState extends State<ChooseWordCorrectView> {
  final Map<dynamic, ValueNotifier<bool>> _selectionNotifiers = {};

  @override
  void dispose() {
    // Dispose
    for (final notifier in _selectionNotifiers.values) {
      notifier.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = ScreenSize.getWidth(context);
    final screenHeight = ScreenSize.getHeight(context);
    final optionsSpacing = screenWidth * 0.05;
    final questionWidgetHeight = screenHeight * 0.25;
    final topInfoHeight = screenHeight * 0.15;
    final correctMessageFontSize = screenWidth * 0.05;
    final baseQuizPadding = screenWidth * 0.03;
    const optionsAspectRatioValue = 2.5;
    final bottomPadding = screenHeight * 0.02;

    final leadingWidget = IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        final bloc = context.read<ChooseWordCorrectBloc>();
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

    final quizContent =
        BlocBuilder<ChooseWordCorrectBloc, ChooseWordCorrectState>(
      builder: (context, state) {
        if (state.status == ChooseWordCorrectStatus.error) {
          return ErrorDisplay(
            errorMessage: state.error!,
            onRetry: () => context
                .read<ChooseWordCorrectBloc>()
                .add(const LoadNouns(category: 'all')),
          );
        }

        if (state.status == ChooseWordCorrectStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.status == ChooseWordCorrectStatus.completed) {
          return const Center(
            child: Text('Quiz Completed!'),
          );
        }

        return QuizContentLayout<String>(
          title: 'Choose Word Correct',
          topInfoHeight: topInfoHeight,
          questionWidget: QuestionElement<Uint8List>(
            data: state.currentNoun?.image,
            imageHeight: questionWidgetHeight,
            canPlayAudio: true,
            onPlayAudio: () => context
                .read<ChooseWordCorrectBloc>()
                .add(PlayAudio(audioBytes: state.currentNoun?.audio)),
          ),
          questionWidgetHeight: questionWidgetHeight,
          answerOptions: state.answerOptions.map((option) {
            final notifier = _selectionNotifiers.putIfAbsent(
                option, () => ValueNotifier<bool>(false));

            return ValueListenableBuilder<bool>(
              valueListenable: notifier,
              builder: (context, isSelected, child) {
                return QuizOptionTile(
                  data: option,
                  onTap: () {
                    if (state.status == ChooseWordCorrectStatus.questionReady) {
                      context
                          .read<ChooseWordCorrectBloc>()
                          .add(CheckAnswer(selectedAnswer: option));
                    }
                  },
                  isSelected: isSelected,
                  isCorrect: state.status == ChooseWordCorrectStatus.correct &&
                      option == state.currentNoun?.name,
                  isWrong: state.status == ChooseWordCorrectStatus.wrong &&
                      option != state.currentNoun?.name,
                  isImageOption: false,
                  selectionNotifier: notifier,
                );
              },
            );
          }).toList(),
          score: state.score,
          answeredQuestions: state.answeredQuestions,
          totalQuestions: state.totalQuestions,
          isCorrect: state.status == ChooseWordCorrectStatus.correct,
          isWrong: state.status == ChooseWordCorrectStatus.wrong,
          onResetQuiz: () =>
              context.read<ChooseWordCorrectBloc>().add(ResetQuiz()),
          optionsAspectRatio: optionsAspectRatioValue,
          optionsCrossAxisCount: 2,
          optionsType: QuizOptionsType.words,
          optionsSpacing: optionsSpacing,
          correctMessageFontSize: correctMessageFontSize,
          baseQuizPadding: baseQuizPadding,
          bottomPadding: bottomPadding,
        );
      },
    );

    return GenericQuizPage(
      title: 'Choose Word Correct',
      leading: leadingWidget,
      content: quizContent,
    );
  }
}
