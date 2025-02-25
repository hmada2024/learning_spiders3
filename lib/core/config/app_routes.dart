// lib/core/config/app_routes.dart
import 'package:flutter/material.dart';
import 'package:learning_spiders/Learning_section/categories/compound_words/compound_words_screen.dart';
import 'package:learning_spiders/Learning_section/categories/nouns/nouns_screen.dart';
import 'package:learning_spiders/Learning_section/categories/verb_conjugations/verb_conjugations_screen.dart';
import 'package:learning_spiders/core/screens/home_page.dart';
import 'package:learning_spiders/core/screens/learning_home.dart';
import 'package:learning_spiders/core/screens/settings_page.dart';
import 'package:learning_spiders/core/screens/about_us_page.dart';
import 'package:learning_spiders/core/screens/profile_page.dart';
import 'package:learning_spiders/core/screens/quizzes_home.dart';
import 'package:learning_spiders/Learning_section/categories/adjectives/adjectives_screen.dart';
import 'package:learning_spiders/quizzes_section/nouns/screens/choose_image_correct_screen.dart';
import 'package:learning_spiders/quizzes_section/nouns/screens/choose_word_correct_screen.dart';

class AppRoutes {
  static const String home = '/';
  static const String learningHome = '/learning-home';
  static const String nouns = '/learning-home/nouns';
  static const String compoundWords = '/learning-home/compound-words';
  static const String verbConjugationQuiz = '/learning-home/verb-conjugations';
  static const String adjectives = '/learning-home/adjectives';
  static const String settings = '/settings';
  static const String aboutUs = '/about-us';
  static const String profile = '/profile';
  static const String quizzesHome = '/quizzes-home';
  static const String chooseImageCorrectQuiz =
      '/quizzes-home/choose-image-correct';
  static const String chooseWordCorrectQuiz =
      '/quizzes-home/choose-word-correct'; // Add route

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      home: (context) => const HomePage(),
      learningHome: (context) => const LearningHome(),
      nouns: (context) => const NounsScreen(),
      compoundWords: (context) => const CompoundWordsScreen(),
      verbConjugationQuiz: (context) => const VerbConjugationsScreen(),
      adjectives: (context) => const AdjectivesScreen(),
      settings: (context) => const SettingsPage(),
      aboutUs: (context) => const AboutUsPage(),
      profile: (context) => const ProfilePage(),
      quizzesHome: (context) => const QuizzesHome(),
      chooseImageCorrectQuiz: (context) => const ChooseImageCorrectScreen(),
      chooseWordCorrectQuiz: (context) =>
          const ChooseWordCorrectScreen(),
    };
  }
}