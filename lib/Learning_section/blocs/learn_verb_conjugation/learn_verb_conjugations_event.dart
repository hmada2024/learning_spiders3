// lib/Learning_section/blocs/learn_verb_conjugation/learn_verb_conjugations_event.dart
import 'package:learning_spiders/core/data/models/verb_conjugations_models.dart';
import 'package:learning_spiders/core/widgets/shared/audio_type.dart';

abstract class LearnVerbConjugationsEvent {
  const LearnVerbConjugationsEvent();
}

class LoadVerbs extends LearnVerbConjugationsEvent {
    final String? verbType;
  const LoadVerbs({this.verbType});
}


class PlayVerbAudio extends LearnVerbConjugationsEvent {
  final Verb verb;
  final AudioType audioType;
  const PlayVerbAudio({required this.verb, required this.audioType});
}