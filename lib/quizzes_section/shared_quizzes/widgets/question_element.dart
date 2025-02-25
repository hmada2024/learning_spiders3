import 'package:flutter/material.dart';
import 'dart:typed_data';

import 'package:learning_spiders/core/config/app_constants.dart';
import 'package:learning_spiders/core/config/screen_size.dart';

class QuestionElement<T> extends StatelessWidget {
  final T? data;
  final double imageHeight;
  final double textSize;
  final double containerPaddingHorizontal;
  final double containerPaddingVertical;
  final double containerBorderRadius;
  final double shadowSpreadRadius;
  final double shadowBlurRadius;
  final double shadowOffsetDy;
  final bool canPlayAudio;
  final VoidCallback? onPlayAudio;
  final Widget? child;

  const QuestionElement({
    super.key,
    this.data,
    this.imageHeight = 0,
    this.textSize = 16,
    this.containerPaddingHorizontal = 0.05,
    this.containerPaddingVertical = 0.02,
    this.containerBorderRadius = 15,
    this.shadowSpreadRadius = 2,
    this.shadowBlurRadius = 5,
    this.shadowOffsetDy = 3,
    this.canPlayAudio = true,
    this.onPlayAudio,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    final playAudioFunction = onPlayAudio; // Use the passed function
      final screenWidth = ScreenSize.getWidth(context);
    final screenHeight = ScreenSize.getHeight(context);
    if (data is Uint8List) {
      final image = data as Uint8List;
      return SizedBox(
        height: imageHeight == 0 ? screenHeight * 0.25 : imageHeight,
        child: Center(
          child: GestureDetector(
            onTap: canPlayAudio
                ? playAudioFunction
                : null, // Call the passed function
            child: Image.memory(
              image,
              fit: BoxFit.contain,
              semanticLabel: canPlayAudio ? 'اضغط للاستماع' : null,
            ),
          ),
        ),
      );
    } else if (data is String ) {
      final text = data as String;
      return Center(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: containerPaddingHorizontal == 0.05
                ? screenWidth * 0.05
                : containerPaddingHorizontal,
            vertical: containerPaddingVertical == 0.02
                ? screenHeight * 0.02
                : containerPaddingVertical,
          ),
          decoration: BoxDecoration(
            color: AppConstants.cardBackgroundColor,
            borderRadius: BorderRadius.circular(containerBorderRadius),
            boxShadow: [
              BoxShadow(
                color: AppConstants.shadowColor,
                spreadRadius: shadowSpreadRadius,
                blurRadius: shadowBlurRadius,
                offset: Offset(0, shadowOffsetDy),
              ),
            ],
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: textSize == 16 ? screenWidth * 0.06 : textSize,
              fontWeight: FontWeight.bold,
              fontFamily: AppConstants.defaultFontFamily,
              color: AppConstants.blueDark,
            ),
          ),
        ),
      );
    } else if (child != null) {
      return Center(
        child: GestureDetector(
            onTap: canPlayAudio
                ? playAudioFunction
                : null, // Call the passed function
            child: child),
      );
    } else {
      return Center(
        child: GestureDetector(
          onTap: canPlayAudio
              ? playAudioFunction
              : null, // Call the passed function
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: containerPaddingHorizontal == 0.05
                  ? screenWidth * 0.05
                  : containerPaddingHorizontal,
              vertical: containerPaddingVertical == 0.02
                  ? screenHeight * 0.02
                  : containerPaddingVertical,
            ),
            decoration: BoxDecoration(
              color: AppConstants.cardBackgroundColor,
              borderRadius: BorderRadius.circular(containerBorderRadius),
              boxShadow: [
                BoxShadow(
                  color: AppConstants.shadowColor,
                  spreadRadius: shadowSpreadRadius,
                  blurRadius: shadowBlurRadius,
                  offset: Offset(0, shadowOffsetDy),
                ),
              ],
            ),
            child: const Text(
              'Play Audio Again',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: AppConstants.fontSizeLarge,
                  fontFamily: AppConstants.defaultFontFamily,
                  fontWeight: FontWeight.bold,
                color: AppConstants.blueDark,
              ),
            ),
          ),
        ),
      );
    }
  }
}
