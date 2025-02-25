//lib/core/widgets/item_card/expandable_item_card.dart
import 'package:flutter/material.dart';
import 'package:learning_spiders/core/config/app_constants.dart';

class ExpandableItemCard extends StatelessWidget {
  final Widget title;
  final Widget content;
  final Color? backgroundColor;

  const ExpandableItemCard(
      {super.key,
      required this.title,
      required this.content,
      this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      elevation: AppConstants.defaultElevation,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.cardRadius)),
      color: backgroundColor ??
          AppConstants
              .cardBackgroundColor,
      child: ExpansionTile(
        title: title,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: content,
          ),
        ],
      ),
    );
  }
}