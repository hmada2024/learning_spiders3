//lib/core/widgets/shared/error_display.dart
import 'package:flutter/material.dart';
import 'package:learning_spiders/core/config/app_constants.dart';

class ErrorDisplay extends StatelessWidget {
  final String errorMessage;
  final VoidCallback? onRetry; 

  const ErrorDisplay({
    super.key,
    required this.errorMessage,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              size: 50,
              color: AppConstants.errorColor,
            ),
            const SizedBox(height: 20),
            const Text(
              'An error occurred:',
              style: TextStyle(
                fontSize: AppConstants.fontSizeMedium,
                color: AppConstants.textColorDark,
              ),
            ),
            Text(
              errorMessage,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: AppConstants.fontSizeSmall,
                color: AppConstants.greyTextColor,
              ),
            ),
            if (onRetry != null) ...[ // Show retry button only if onRetry is provided
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: onRetry,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppConstants.primaryColor,
                  foregroundColor: AppConstants.textColorLight,
                ),
                child: const Text('Retry'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}