//lib/core/screens/home_page.dart
import 'package:learning_spiders/core/widgets/shared/custom_navigation_bar.dart';
import 'package:learning_spiders/core/screens/quizzes_home.dart';
import 'package:learning_spiders/core/screens/profile_page.dart';
import 'package:learning_spiders/core/config/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:learning_spiders/core/screens/learning_home.dart';
import 'package:learning_spiders/core/screens/about_us_page.dart';
import 'package:learning_spiders/core/config/screen_size.dart';
import 'package:learning_spiders/core/widgets/shared/custom_button.dart';
import 'package:learning_spiders/core/config/button_styles.dart'; // استيراد

class HomePage extends StatelessWidget {
  static const routeName = AppRoutes.home;
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Get the theme
    return Scaffold(
      appBar: AppBar(
        title: const Text('English Spider'),
        // No need for style here, it's in theme.dart
      ),
      body: Container(
        decoration: BoxDecoration(
          color: theme.colorScheme.surface, // Use from theme
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
                    labelText: 'Learning Section',
                    icon: Icons.school,
                    style: ButtonStyles.primaryStyle(context),
                    onPressed: () => Navigator.pushReplacementNamed(
                        context, LearningHome.routeName),
                  ),

                  SizedBox(height: ScreenSize.getWidth(context) * 0.10),
                  CustomButton(
                    labelText: 'Quizzes Section',
                    icon: Icons.quiz,
                    style: ButtonStyles.primaryStyle(context), // تمرير النمط
                    onPressed: () => Navigator.pushReplacementNamed(
                        context, QuizzesHome.routeName),
                  ),

                  SizedBox(height: ScreenSize.getWidth(context) * 0.10),
                  CustomButton(
                    labelText: 'About Our App',
                    icon: Icons.info_outline,
                    style: ButtonStyles.primaryStyle(context), // تمرير النمط
                    onPressed: () =>
                        Navigator.pushNamed(context, AboutUsPage.routeName),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomNavigationBar(
        currentIndex: 0,
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