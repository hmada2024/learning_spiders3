//lib/core/widgets/profile/profile_header.dart
import 'package:flutter/material.dart';
import 'package:learning_spiders/core/config/app_constants.dart';
import 'package:learning_spiders/core/config/screen_size.dart';
import 'package:learning_spiders/core/user/user_model.dart';

class ProfileHeader extends StatelessWidget {
  final UserModel currentUser;
  const ProfileHeader({super.key, required this.currentUser});

  @override
  Widget build(BuildContext context) {
    final screenWidth = ScreenSize.getWidth(context);
    final theme = Theme.of(context);

    return Container(
      margin: EdgeInsets.only(bottom: ScreenSize.getHeight(context) * 0.03),
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppConstants.shadowColor,
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: CircleAvatar(
              radius: screenWidth * 0.15,
              backgroundColor: theme.colorScheme.secondary,
              child: Icon(
                Icons.person,
                size: screenWidth * 0.2,
                color: AppConstants.textColorLight,
              ),
            ),
          ),
          SizedBox(height: ScreenSize.getHeight(context) * 0.02),
          Text(
            currentUser.name,
            style: TextStyle(
              fontSize: screenWidth * 0.07,
              fontWeight: FontWeight.bold,
              fontFamily: 'Oswald',
            ),
          ),
        ],
      ),
    );
  }
}
