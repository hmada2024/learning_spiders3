//lib/core/widgets/item_card/item_detail_row.dart
import 'package:flutter/material.dart';
import 'package:learning_spiders/core/widgets/shared/audio_button.dart';
import 'package:learning_spiders/core/widgets/shared/bounce_animation.dart';
import 'package:learning_spiders/main.dart';
import 'dart:typed_data';
import 'package:learning_spiders/core/services/audio_service.dart';

class ItemDetailRow extends StatefulWidget {
  final String? title;
  final String? value;
  final InlineSpan? richValue;
  final Uint8List? audio;
  final Color? rowColor;
  final Function(Uint8List)? onPlayAudio;
  final TextStyle? titleStyle;
  final TextStyle? valueStyle;
  final EdgeInsets? padding;
  final double? iconSize;
  final BorderRadius? borderRadius;

  const ItemDetailRow({
    super.key,
    this.title,
    this.value,
    this.richValue,
    this.audio,
    this.rowColor,
    this.onPlayAudio, // Optional callback
    this.titleStyle,
    this.valueStyle,
    this.padding,
    this.iconSize,
    this.borderRadius,
  });

  @override
  State<ItemDetailRow> createState() => _ItemDetailRowState();
}

class _ItemDetailRowState extends State<ItemDetailRow> {

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) { 
    final iconSize = widget.iconSize ?? 24.0;

    const defaultTitleStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
      color: Colors.black,
    );

    const defaultValueStyle = TextStyle(
      fontSize: 16,
      color: Colors.black,
    );

    return Padding(
      padding: widget.padding ?? const EdgeInsets.symmetric(vertical: 4.0),
      child: BounceAnimation(
        onTap: () {
          //  <--  أصبحت اختيارية
          if (widget.audio != null &&
              widget.audio!.isNotEmpty &&
              mounted) {
           final audioService = getIt<AudioService>();
           audioService.start(widget.audio!);
          }
        },
        child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: widget.rowColor ?? Colors.grey.shade200, // Default color
            borderRadius: widget.borderRadius ?? BorderRadius.circular(8.0),
          ),
          child: Row(
            children: [
              // Conditionally render title and value/richValue
              if (widget.title != null) ...[
                Expanded(
                  child: Text(
                    '${widget.title!}: ',
                    style: widget.titleStyle ?? defaultTitleStyle,
                  ),
                ),
                if (widget.value != null &&
                    widget.value!.isNotEmpty)
                  Expanded(
                    child: Text(
                      widget.value!,
                      style: widget.valueStyle ?? defaultValueStyle,
                    ),
                  )
                else if (widget.richValue != null)
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        style: widget.valueStyle ?? defaultValueStyle,
                        children: [widget.richValue!],
                      ),
                    ),
                  ),
              ] else if (widget.value != null && widget.value!.isNotEmpty)
                Expanded(
                  child: Text(
                    widget.value!,
                    style: widget.valueStyle ?? defaultValueStyle,
                  ),
                )
              else if (widget.richValue != null)
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      style: widget.valueStyle ?? defaultValueStyle,
                      children: [widget.richValue!],
                    ),
                  ),
                ),
              if (widget.audio != null)
                 AudioButton(iconSize: iconSize, onPressed: () {
                        if (widget.audio != null &&
                            widget.audio!.isNotEmpty &&
                            mounted) {
                        final audioService = getIt<AudioService>();
                        audioService.start(widget.audio!);
                        }
                 })
            ],
          ),
        ),
      ),
    );
  }
}