//lib/Learning_section/categories/adjectives/adjective_card.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_spiders/Learning_section/blocs/learn_adjective/learn_adjective_bloc.dart';
import 'package:learning_spiders/Learning_section/blocs/learn_adjective/learn_adjective_event.dart';
import 'package:learning_spiders/core/data/models/adjective_model.dart';
import 'package:learning_spiders/core/widgets/item_card/item_card_header.dart';
import 'package:learning_spiders/core/widgets/item_card/item_details.dart';
import 'package:learning_spiders/core/widgets/item_card/item_detail_row.dart';
import 'package:learning_spiders/core/widgets/shared/audio_type.dart';
import 'package:learning_spiders/core/widgets/item_card/expandable_item_card.dart';
import 'package:learning_spiders/core/widgets/text/string_extensions.dart';

class AdjectiveCard extends StatelessWidget {
  final Adjective adjective;

  const AdjectiveCard({
    super.key,
    required this.adjective,
  });

  @override
  Widget build(BuildContext context) {
    return ExpandableItemCard(
      title: Row(
        children: [
          Expanded(
            child: ItemCardHeader<Adjective>(
              item: adjective,
              isExpanded: false,
              onTap: () {},
              displayValue: (Adjective a) => a.mainAdjective,
              audioData: (Adjective a) => a.mainAdjectiveAudio,
              textColor: Colors.green.shade700,
            ),
          ),
          const SizedBox(width: 4),
          Expanded(
            child: ItemCardHeader<Adjective>(
              item: adjective,
              isExpanded: false,
              onTap: () {},
              displayValue: (Adjective a) => a.reverseAdjective,
              audioData: (Adjective a) => a.reverseAdjectiveAudio,
              textColor: Colors.red.shade700,
            ),
          ),
        ],
      ),
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ItemDetails(
          rows: [
            ItemDetailRow(
              richValue:
                  adjective.mainExample.formatWithHighlight(Colors.green.shade700), // استخدام extension
              audio: adjective.mainExampleAudio,
              onPlayAudio: (audioData) {
                context.read<LearnAdjectiveBloc>().add(PlayAdjectiveAudio(
                    adjective: adjective, audioType: AudioType.example));
              },
              padding:
                  const EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
              borderRadius: BorderRadius.circular(12.0),
              iconSize: 24,
            ),
            ItemDetailRow(
              richValue: adjective.reverseExample
                  .formatWithHighlight(Colors.red.shade700), // استخدام extension
              audio: adjective.reverseExampleAudio,
              onPlayAudio: (audioData) {
                context.read<LearnAdjectiveBloc>().add(PlayAdjectiveAudio(
                    adjective: adjective, audioType: AudioType.example));
              },
              padding:
                  const EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
              borderRadius: BorderRadius.circular(12.0),
              iconSize: 24,
            ),
          ],
        ),
      ),
    );
  }
}