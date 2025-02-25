//lib/core/widgets/shared/image_section.dart
import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:learning_spiders/core/config/app_constants.dart'; // Import AppConstants

class ImageSection extends StatelessWidget {
  final Uint8List? imageBytes;
  final double width;
  final double? height;
  final Widget? placeholder;

  const ImageSection({
    super.key,
    required this.imageBytes,
    required this.width,
    this.height,
    this.placeholder,
  });

  Future<ui.Image> _getImage(Uint8List? img) async {
    final Completer<ui.Image> completer = Completer();
    if (img == null) {
      completer.completeError(StateError('Image data is null'));
    } else {
      ui.decodeImageFromList(img, (ui.Image img) {
        return completer.complete(img);
      });
    }
    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ui.Image>(
      future: _getImage(imageBytes),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SizedBox(
            width: width,
            height: height ?? width,
            child: const Center(child: CircularProgressIndicator()),
          );
        }
        if (snapshot.hasError || snapshot.data == null) {
          return placeholder ?? _defaultPlaceholder();
        }

        final image = snapshot.data!;

        return SizedBox(
          width: width,
          child: AspectRatio(
            aspectRatio: image.width / image.height,
            child: imageBytes != null
                ? Image.memory(imageBytes!, fit: BoxFit.contain)
                : const SizedBox.shrink(),
          ),
        );
      },
    );
  }

  Widget _defaultPlaceholder() {
    return SizedBox(
      width: width, 
      height: height ?? width, 
      child: Container(
        color: AppConstants.greyColor,
        child: Icon(
          Icons.image_not_supported,
          size: width * 0.3, 
          color: AppConstants.textColorDark,
        ),
      ),
    );
  }
}