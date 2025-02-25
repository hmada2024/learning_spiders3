//lib/core/widgets/shared/empty_state_display.dart
import 'package:flutter/material.dart';
import 'package:learning_spiders/core/config/app_constants.dart';

class EmptyStateDisplay extends StatelessWidget {
  final String message;

  const EmptyStateDisplay({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.search_off, // Or any other suitable icon
            size: 50,
            color: AppConstants.greyTextColor,
          ),
          const SizedBox(height: 20),
          Text(
            message,
            style: const TextStyle(
              fontSize: AppConstants.fontSizeMedium,
              color: AppConstants.textColorDark,
            ),
          ),
        ],
      ),
    );
  }
}