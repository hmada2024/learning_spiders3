//lib/Learning_section/categories/nouns/noun_content.dart
import 'package:flutter/material.dart';
import 'package:learning_spiders/Learning_section/blocs/learn_noun/learn_noun_state.dart';
import 'package:learning_spiders/core/config/app_constants.dart';
import 'package:learning_spiders/core/widgets/shared/empty_state_display.dart';
import 'package:learning_spiders/core/widgets/shared/error_display.dart';
import 'package:learning_spiders/core/widgets/shared/responsive_grid_view.dart';
import 'package:learning_spiders/Learning_section/categories/nouns/noun_card.dart';
import 'package:learning_spiders/core/data/models/displayable_item.dart';

class NounContent extends StatelessWidget {
  final LearnNounState state;
  final Function(DisplayableItem) onPlayAudio;
  final VoidCallback onRetry;

  const NounContent({
    super.key,
    required this.state,
    required this.onPlayAudio,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    if (state.isLoading) {
      return const Center(
        child: CircularProgressIndicator(
          color: AppConstants.primaryColor,
        ),
      );
    }

    if (state.error != null) {
      return ErrorDisplay(errorMessage: state.error!, onRetry: onRetry);
    }

    if (state.nouns.isEmpty) {
      return const EmptyStateDisplay(
          message: 'No nouns found for this category.');
    }

    return ResponsiveGridView(
      itemCount: state.nouns.length,
      itemBuilder: (context, index) {
        final item = state.nouns[index];
        return ItemCard(
          key: ValueKey(item.id),
          item: item,
          index: index,
          onPlayAudio: () => onPlayAudio(item),
        );
      },
      childAspectRatio: 1.1,
      mainAxisSpacing: 16.0,
      crossAxisSpacing: 16.0,
    );
  }
}
