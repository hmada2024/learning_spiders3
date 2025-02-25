//lib/core/screens/settings_page.dart
import 'package:flutter/material.dart';
import 'package:learning_spiders/core/config/app_routes.dart';
import 'package:learning_spiders/core/widgets/settings/settings_body.dart'; // Import the new widget

class SettingsPage extends StatelessWidget {
  static const routeName = AppRoutes.settings;

  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
        backgroundColor: theme.colorScheme.primary,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings, color: theme.colorScheme.onPrimary),
            onPressed: () => Navigator.pushNamed(context, SettingsPage.routeName),
          ),
        ],
      ),
      body: const SettingsBody(), // Use the new widget here
    );
  }
}