//lib/core/widgets/item_card/item_card_header.dart
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:learning_spiders/core/config/app_constants.dart';
import 'package:learning_spiders/core/widgets/shared/bounce_animation.dart';
import 'package:learning_spiders/core/widgets/text/styled_text.dart';
import 'package:learning_spiders/main.dart';
import 'package:learning_spiders/core/services/audio_service.dart';

class ItemCardHeader<T> extends StatelessWidget {
  final T item;
  final bool isExpanded;
  final VoidCallback onTap;
  final String Function(T) displayValue;
  final Uint8List? Function(T)? audioData;
  final Color? backgroundColor;
  final Color? textColor;

  const ItemCardHeader({
    super.key,
    required this.item,
    required this.isExpanded,
    required this.onTap,
    required this.displayValue,
    this.audioData,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final fontSize = MediaQuery.of(context).size.width * 0.045;
    final audio = audioData?.call(item);
    final hasAudio = audio != null && audio.isNotEmpty;
    final displayValueText = displayValue(item);
    final textColorValue = textColor ?? Colors.green.shade700;

    return BounceAnimation(
      onTap: () async {
        if (!hasAudio) return;
        final audioService = getIt<AudioService>();
        await audioService.start(audio);
      },
      child: Container(
        padding: const EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.transparent,
          borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
        ),
        child: StyledText(
          text: displayValueText, // استخدام المتغير المُعرَّف
          fontSize: fontSize,
          color: textColorValue, // استخدام المتغير المُعرَّف
        ),
      ),
    );
  }
}