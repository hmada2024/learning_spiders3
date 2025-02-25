//lib/core/screens/learning_home.dart
import 'package:learning_spiders/core/config/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:learning_spiders/core/screens/home_page.dart';
import 'package:learning_spiders/core/screens/profile_page.dart';
import 'package:learning_spiders/core/widgets/shared/custom_navigation_bar.dart';
import 'package:learning_spiders/core/config/screen_size.dart';
import 'package:learning_spiders/core/screens/quizzes_home.dart';
import 'package:learning_spiders/Learning_section/categories/nouns/nouns_screen.dart';
import 'package:learning_spiders/Learning_section/categories/compound_words/compound_words_screen.dart';
import 'package:learning_spiders/Learning_section/categories/verb_conjugations/verb_conjugations_screen.dart';
import 'package:learning_spiders/core/widgets/shared/custom_button.dart'; // Import CustomButton
import 'package:learning_spiders/Learning_section/categories/adjectives/adjectives_screen.dart';
import 'package:learning_spiders/core/config/button_styles.dart'; // استيراد

class LearningHome extends StatelessWidget {
  static const routeName = AppRoutes.learningHome;
  const LearningHome({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Learning Section'),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(ScreenSize.getWidth(context) * 0.08),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  CustomButton(
                    labelText: 'Verb Conjugations',
                    icon: Icons.sync_alt,
                    style: ButtonStyles.primaryStyle(context), // تمرير النمط
                    onPressed: () => Navigator.pushNamed(
                        context, VerbConjugationsScreen.routeName),
                  ),

                  SizedBox(height: ScreenSize.getWidth(context) * 0.10),
                  CustomButton(
                    labelText: 'Nouns',
                    icon: Icons.category,
                    style: ButtonStyles.primaryStyle(context), // تمرير النمط
                    onPressed: () =>
                        Navigator.pushNamed(context, NounsScreen.routeName),
                  ),
                  SizedBox(height: ScreenSize.getWidth(context) * 0.10),
                  CustomButton(
                    labelText: 'Compound Words',
                    icon: Icons.link,
                    style: ButtonStyles.primaryStyle(context), // تمرير النمط
                    onPressed: () => Navigator.pushNamed(
                        context, CompoundWordsScreen.routeName),
                  ),
                  SizedBox(height: ScreenSize.getWidth(context) * 0.10),
                  CustomButton(
                    // Use CustomButton
                    labelText: 'Adjectives',
                    icon: Icons.format_color_text, // اختر أيقونة مناسبة
                    style: ButtonStyles.primaryStyle(context), // تمرير النمط
                    onPressed: () => Navigator.pushNamed(
                        context, AdjectivesScreen.routeName),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomNavigationBar(
        currentIndex: 1,
        onTap: (index) {
          final routes = [
            HomePage.routeName,
            LearningHome.routeName,
            QuizzesHome.routeName,
            ProfilePage.routeName,
          ];
          if (index < routes.length) {
            Navigator.pushReplacementNamed(context, routes[index]);
          }
        },
      ),
    );
  }
}