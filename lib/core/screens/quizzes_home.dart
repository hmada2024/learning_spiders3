//lib/core/screens/quizzes_home.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_spiders/core/config/app_routes.dart';
import 'package:learning_spiders/core/widgets/shared/custom_navigation_bar.dart';
import 'package:learning_spiders/core/config/screen_size.dart';
import 'package:learning_spiders/core/screens/profile_page.dart';
import 'package:learning_spiders/core/screens/home_page.dart';
import 'package:learning_spiders/core/screens/learning_home.dart';
import 'package:learning_spiders/core/widgets/shared/custom_button.dart';
import 'package:learning_spiders/quizzes_section/nouns/screens/choose_image_correct_screen.dart';
import 'package:learning_spiders/quizzes_section/nouns/blocs/choose_correct_answer/choose_correct_answer_bloc.dart';
import 'package:learning_spiders/quizzes_section/nouns/blocs/choose_correct_answer/choose_correct_answer_event.dart'
    as choose_image_events;
import 'package:learning_spiders/quizzes_section/nouns/screens/choose_word_correct_screen.dart';
import 'package:learning_spiders/quizzes_section/nouns/blocs/choose_word_correct/choose_word_correct_bloc.dart';
import 'package:learning_spiders/quizzes_section/nouns/blocs/choose_word_correct/choose_word_correct_event.dart'
    as choose_word_events;
import 'package:learning_spiders/core/config/button_styles.dart'; // استيراد

class QuizzesHome extends StatelessWidget {
  static const routeName = AppRoutes.quizzesHome;
  const QuizzesHome({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quizzes Section'),
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
                    labelText: 'Choose the Correct Image',
                    icon: Icons.image_search,
                    style: ButtonStyles.primaryStyle(context), // تمرير النمط
                    onPressed: () {
                      BlocProvider.of<ChooseCorrectAnswerBloc>(context)
                          .add(const choose_image_events.StartNewQuiz(
                              category: 'all'));
                      Navigator.pushNamed(
                          context, ChooseImageCorrectScreen.routeName);
                    },
                  ),
                  SizedBox(height: ScreenSize.getWidth(context) * 0.10),
                  CustomButton(
                    labelText: 'Choose the Correct Word',
                    icon: Icons.text_format,
                    style: ButtonStyles.primaryStyle(context), // تمرير النمط
                    onPressed: () {
                      BlocProvider.of<ChooseWordCorrectBloc>(context)
                          .add(const choose_word_events.StartNewQuiz(
                              category: 'all'));
                      Navigator.pushNamed(
                          context, ChooseWordCorrectScreen.routeName);
                    },
                  ),
                  SizedBox(height: ScreenSize.getWidth(context) * 0.10),
                  CustomButton(
                    labelText: 'Arrange Sentence',
                    icon: Icons.sort_by_alpha,
                    style: ButtonStyles.primaryStyle(context), // تمرير النمط
                    onPressed: () {},
                  ),
                  SizedBox(height: ScreenSize.getWidth(context) * 0.10),
                  CustomButton(
                    labelText: 'Verb Conjugation',
                    icon: Icons.transform,
                    style: ButtonStyles.primaryStyle(context), // تمرير النمط
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomNavigationBar(
        currentIndex: 2,
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