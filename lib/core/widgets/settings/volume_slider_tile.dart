// lib/core/widgets/settings/volume_slider_tile.dart

import 'package:flutter/material.dart';

class VolumeSliderTile extends StatefulWidget {
  final String title;
  final Function(double) onVolumeChanged;
  final double initialVolume;

  const VolumeSliderTile({
    super.key,
    required this.title,
    required this.onVolumeChanged,
    this.initialVolume = 0.5, // Default value
  });

  @override
  State<VolumeSliderTile> createState() => _VolumeSliderTileState();
}

class _VolumeSliderTileState extends State<VolumeSliderTile> {
  late double _volume;

  @override
  void initState() {
    super.initState();
    _volume = widget.initialVolume;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenWidth = MediaQuery.of(context).size.width;

    return Row(
      children: [
        Expanded(
          child: Text(widget.title, style: theme.textTheme.bodyLarge),
        ),
        SizedBox(
          width: screenWidth * 0.3,
          child: SliderTheme(
            data: theme.sliderTheme.copyWith(
              trackHeight: 6,
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 12),
              overlayShape: const RoundSliderOverlayShape(overlayRadius: 24),
              activeTrackColor: theme.colorScheme.secondary,
              inactiveTrackColor: theme.colorScheme.secondary.withAlpha(77),
            ),
            child: Slider(
              value: _volume,
              onChanged: (value) {
                setState(() {
                  _volume = value;
                });
                widget.onVolumeChanged(value); // Call the callback
              },
            ),
          ),
        ),
      ],
    );
  }
}