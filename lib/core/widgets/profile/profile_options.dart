//lib/core/widgets/profile/profile_options.dart
import 'package:learning_spiders/core/screens/settings_page.dart';
import 'package:learning_spiders/core/user/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_spiders/core/config/app_constants.dart';
import 'package:learning_spiders/core/config/app_routes.dart';
import 'package:learning_spiders/core/user/user_model.dart';
import 'package:learning_spiders/core/widgets/shared/option_tile.dart'; // Import OptionTile

class ProfileOptions extends StatelessWidget {
  final VoidCallback onEditProfileTap;
  const ProfileOptions({super.key, required this.onEditProfileTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: AppConstants.defaultElevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConstants.borderRadiusLarge),
      ),
      child: Column(
        children: <Widget>[
           OptionTile( // Use OptionTile
              leading: Icon(Icons.edit, color: AppConstants.iconColor),
              title: 'Edit Profile',
              trailing: Icon(Icons.arrow_forward_ios, color: AppConstants.iconColor),
              onTap: onEditProfileTap,
            ),

          const Divider(
              height: 1, thickness: 1, color: Colors.grey), // Added Divider
           OptionTile(  // Use OptionTile
              leading: Icon(Icons.settings, color: AppConstants.iconColor),
              title: 'App Settings',
              trailing: Icon(Icons.arrow_forward_ios, color: AppConstants.iconColor),
              onTap: () => Navigator.pushNamed(context, SettingsPage.routeName),
            ),

          const Divider(height: 1, thickness: 1, color: Colors.grey),
           OptionTile( // Use OptionTile
              leading: Icon(Icons.logout, color: AppConstants.iconColor),
              title: 'Logout',
              trailing: Icon(Icons.arrow_forward_ios, color: AppConstants.iconColor),
              onTap: () {
                BlocProvider.of<UserCubit>(context).updateUser(
                    UserModel(name: '', gender: '')); // Dispatch logout event
                Navigator.pushReplacementNamed(
                    context, AppRoutes.home); // Navigate to home after logout
              },
            ),
        ],
      ),
    );
  }
}
