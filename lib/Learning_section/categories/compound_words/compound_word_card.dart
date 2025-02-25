//lib/Learning_section/categories/compound_words/compound_word_card.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_spiders/Learning_section/blocs/learn_compound_word/learn_compound_word_bloc.dart';
import 'package:learning_spiders/Learning_section/blocs/learn_compound_word/learn_compound_word_event.dart';
import 'package:learning_spiders/core/widgets/item_card/item_card_header.dart';
import 'package:learning_spiders/core/config/app_constants.dart';
import 'package:learning_spiders/core/data/models/compound_word_model.dart';
import 'package:learning_spiders/core/widgets/shared/audio_type.dart';
import 'package:learning_spiders/core/widgets/item_card/item_detail_row.dart';
import 'package:learning_spiders/core/widgets/item_card/expandable_item_card.dart';
import 'package:learning_spiders/core/widgets/text/string_extensions.dart';

class CompoundWordCard extends StatelessWidget {
  final CompoundWord compoundWord;

  const CompoundWordCard({
    super.key,
    required this.compoundWord,
  });

  @override
  Widget build(BuildContext context) {
    return ExpandableItemCard(
      title: ItemCardHeader<CompoundWord>(
        item: compoundWord,
        isExpanded: false,
        onTap: () {},
        displayValue: (CompoundWord c) => c.main,
        audioData: (CompoundWord c) => c.mainAudio,
      ),
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            if (compoundWord.example != null &&
                compoundWord.example!.isNotEmpty)
              ItemDetailRow(
                richValue: compoundWord.example!.formatWithHighlight(
                    Colors.green.shade700),
                audio: compoundWord.mainExampleAudio,
                rowColor: AppConstants.greyColor.withValues(alpha: 0.3),
                onPlayAudio: (audioData) {
                  if (compoundWord.mainExampleAudio != null) {
                    context.read<LearnCompoundWordBloc>().add(
                        PlayCompoundWordAudio(
                            compoundWord, AudioType.example));
                  }
                },
                padding:
                    const EdgeInsets.symmetric(vertical: 6.0, horizontal: 10.0),
                borderRadius: BorderRadius.circular(12.0),
                iconSize: 28,
              ),
          ],
        ),
      ),
    );
  }
}