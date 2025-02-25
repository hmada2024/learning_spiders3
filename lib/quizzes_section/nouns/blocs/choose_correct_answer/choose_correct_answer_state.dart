//lib/quizzes_section/nouns/blocs/choose_correct_answer/choose_correct_answer_state.dart
import 'package:equatable/equatable.dart';
import 'package:learning_spiders/core/data/models/nouns_model.dart';
import 'package:learning_spiders/quizzes_section/nouns/blocs/choose_correct_answer/choose_correct_answer_event.dart';

enum ChooseCorrectAnswerStatus {
  initial,
  loading,
  questionReady,
  correct,
  wrong,
  completed,
  error,
}

class ChooseCorrectAnswerState extends Equatable {
  final List<Noun> nouns;
  final Noun? currentNoun;
  final List<dynamic> answerOptions;
  final int score;
  final int answeredQuestions;
  final int totalQuestions;
  final bool playAudioAutomatically;
  final bool shouldPlayAudio;
  final String? error;
  final QuizType quizType;
  final ChooseCorrectAnswerStatus status;

  const ChooseCorrectAnswerState({
    this.nouns = const [],
    this.currentNoun,
    this.answerOptions = const [],
    this.score = 0,
    this.answeredQuestions = 0,
    required this.totalQuestions,
    required this.playAudioAutomatically,
    this.shouldPlayAudio = true,
    this.error,
    this.quizType = QuizType.imageBased,
    this.status = ChooseCorrectAnswerStatus.initial,
  });

  ChooseCorrectAnswerState copyWith({
    List<Noun>? nouns,
    Noun? currentNoun,
    List<dynamic>? answerOptions,
    int? score,
    int? answeredQuestions,
    int? totalQuestions,
    bool? playAudioAutomatically,
    bool? shouldPlayAudio,
    String? error,
    QuizType? quizType,
    ChooseCorrectAnswerStatus? status,
  }) {
    return ChooseCorrectAnswerState(
      nouns: nouns ?? this.nouns,
      currentNoun: currentNoun ?? this.currentNoun,
      answerOptions: answerOptions ?? this.answerOptions,
      score: score ?? this.score,
      answeredQuestions: answeredQuestions ?? this.answeredQuestions,
      totalQuestions: totalQuestions ?? this.totalQuestions,
      playAudioAutomatically:
          playAudioAutomatically ?? this.playAudioAutomatically,
      shouldPlayAudio: shouldPlayAudio ?? this.shouldPlayAudio,
      error: error,
      quizType: quizType ?? this.quizType,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [
        nouns,
        currentNoun,
        answerOptions,
        score,
        answeredQuestions,
        totalQuestions,
        playAudioAutomatically,
        shouldPlayAudio,
        error,
        quizType,
        status,
      ];
}