// lib/core/widgets/settings/settings_body.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_spiders/core/config/screen_size.dart';
import 'package:learning_spiders/core/theme/theme_cubit.dart';
import 'package:learning_spiders/core/theme/theme_state.dart';
import 'package:learning_spiders/core/widgets/settings/settings_card.dart';
import 'package:learning_spiders/core/widgets/settings/settings_option.dart';
import 'package:learning_spiders/core/widgets/settings/volume_slider_tile.dart';

class SettingsBody extends StatefulWidget {
  const SettingsBody({super.key});

  @override
  State<SettingsBody> createState() => _SettingsBodyState();
}

class _SettingsBodyState extends State<SettingsBody>
    with TickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.2),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = ScreenSize.getWidth(context);
    final screenHeight = ScreenSize.getHeight(context);
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.05,
        vertical: screenHeight * 0.03,
      ),
      child: ListView(
        children: [
          SlideTransition(
            position: _slideAnimation,
            child: FadeTransition(
              opacity: _animationController,
              child: SettingsCard(
                // Using the new widget
                children: [
                  SettingsOption(
                    // Using the new Settings option
                    child: ListTile(
                      leading: const Icon(Icons.language),
                      title: const Text('Change Language'),
                      onTap: () {},
                    ),
                  ),
                  SettingsOption(
                    child: SwitchListTile(
                      title: const Text('Dark Mode'),
                      value: context.watch<ThemeCubit>().state is ThemeDark,
                      onChanged: (bool value) {
                        context.read<ThemeCubit>().toggleTheme();
                      },
                      activeColor: theme.colorScheme.secondary,
                      secondary: Icon(
                        context.read<ThemeCubit>().state is ThemeDark
                            ? Icons.nightlight_round
                            : Icons.wb_sunny,
                        color: theme.colorScheme.secondary,
                      ),
                    ),
                  ),
                  SettingsOption(
                      child: VolumeSliderTile(
                    // Using the new widget
                    title: "Volume",
                    onVolumeChanged: (value) {
                      // Handle volume change (optional: save to prefs)
                    },
                  )),
                ],
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.03),
          SlideTransition(
            position: _slideAnimation,
            child: FadeTransition(
              opacity: _animationController,
              child: SettingsCard(
                // Using the new widget
                children: [
                  SettingsOption(
                      child: ListTile(
                    leading: const Icon(Icons.info_outline),
                    title: const Text('App Information'),
                    onTap: () {},
                  )),
                  SettingsOption(
                      child: ListTile(
                    leading: const Icon(Icons.share),
                    title: const Text('Share App'),
                    onTap: () {},
                  )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}