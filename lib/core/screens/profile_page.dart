//lib/core/screens/profile_page.dart
import 'package:learning_spiders/core/screens/learning_home.dart';
import 'package:learning_spiders/core/screens/home_page.dart';
import 'package:learning_spiders/core/user/user_state.dart';
import 'package:learning_spiders/core/widgets/shared/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_spiders/core/config/app_constants.dart';
import 'package:learning_spiders/core/config/app_routes.dart';
import 'package:learning_spiders/core/screens/quizzes_home.dart';
import 'package:learning_spiders/core/screens/settings_page.dart';
import 'package:learning_spiders/core/user/user_cubit.dart';
import 'package:learning_spiders/core/widgets/profile/profile_page_content.dart';

class ProfilePage extends StatelessWidget {
  static const routeName = AppRoutes.profile;

  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile', style: TextStyle(fontFamily: 'Oswald')),
        centerTitle: true,
        backgroundColor: AppConstants.primaryColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.settings, color: AppConstants.textColorLight),
              onPressed: () =>
                  Navigator.pushNamed(context, SettingsPage.routeName)),
        ],
        iconTheme: const IconThemeData(color: AppConstants.textColorLight),
      ),
      body: Container(
        decoration: const BoxDecoration(color: AppConstants.backgroundColorLight),
        child: BlocBuilder<UserCubit, UserState>(
          builder: (context, state) {
            return ProfilePageContent(currentUser: state.user);
          },
        ),
      ),
      bottomNavigationBar: CustomNavigationBar(
        currentIndex: 3,
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