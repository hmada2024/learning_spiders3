//lib/Learning_section/blocs/learn_noun/learn_noun_events.dart
import 'package:equatable/equatable.dart';
import 'package:learning_spiders/core/data/models/displayable_item.dart';

abstract class LearnNounEvent extends Equatable {
  const LearnNounEvent();

  @override
  List<Object?> get props => [];
}

class LoadNouns extends LearnNounEvent {
  final String category;

  const LoadNouns({required this.category});

  @override
  List<Object?> get props => [category];
}

class LoadCategories extends LearnNounEvent {
  const LoadCategories();
}

class SelectNoun extends LearnNounEvent {
  final DisplayableItem noun;

  const SelectNoun(this.noun);

  @override
  List<Object?> get props => [noun];
}

class PlayNounAudio extends LearnNounEvent {
  final DisplayableItem noun;

  const PlayNounAudio(this.noun);

  @override
  List<Object?> get props => [noun];
}
