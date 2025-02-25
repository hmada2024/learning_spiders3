//lib/core/widgets/confirmation_dialog.dart
import 'package:flutter/material.dart';
import 'package:learning_spiders/core/config/app_constants.dart';

class ConfirmationDialog extends StatelessWidget {
  final String title;
  final String content;
  final String confirmText;
  final String cancelText;
  final VoidCallback onConfirm;
  final VoidCallback? onCancel;
  final IconData? icon;
  final Color? iconColor;

  const ConfirmationDialog({
    super.key,
    required this.title,
    required this.content,
    required this.confirmText,
    required this.onConfirm,
    this.cancelText = 'Cancel',
    this.onCancel,
    this.icon = Icons.warning_amber_rounded,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppConstants.cardBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConstants.borderRadiusLarge),
      ),
      title: Row(
        children: [
          if (icon != null)
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: Icon(
                icon,
                color: iconColor ?? AppConstants.warningColor, // لون الأيقونة الطبيعي
                size: AppConstants.iconSizeMedium,
              ),
            ),
          Expanded(
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontFamily: 'Oswald',
                    fontWeight: FontWeight.bold,
                    color: AppConstants.textColorDark,
                  ),
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
      content: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Text(
          content,
          style: const TextStyle(
              fontSize: AppConstants.fontSizeMedium,
              color: AppConstants.textColorDark,
              fontFamily: 'Roboto'),
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: onCancel ?? () => Navigator.of(context).pop(),
          style: TextButton.styleFrom(
              foregroundColor: AppConstants.greyTextColor
              ),
          child: Text(cancelText.toUpperCase(),
              style: const TextStyle(
                fontFamily: 'Roboto',
              )),
        ),
        ElevatedButton(
          onPressed: onConfirm,
          style: ElevatedButton.styleFrom(
              backgroundColor: AppConstants.successColor,
              foregroundColor: AppConstants.textColorLight,
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(AppConstants.borderRadiusSmall),
              )),
          child: Text(confirmText.toUpperCase(),
              style: const TextStyle(
                fontFamily: 'Roboto',
              )),
        ),
      ],
    );
  }
}