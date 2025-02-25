//lib/core/widgets/profile/login_registration_section.dart
import 'package:flutter/material.dart';
import 'package:learning_spiders/core/config/app_constants.dart';
import 'package:learning_spiders/core/config/screen_size.dart';
import 'package:learning_spiders/core/user/user_model.dart';
import 'package:learning_spiders/core/widgets/shared/custom_button.dart';
import 'package:learning_spiders/core/widgets/input/registration_login_widget.dart';
import 'package:learning_spiders/core/config/button_styles.dart';

class LoginRegistrationSection extends StatelessWidget {
  final Function(UserModel user)? onLoginSuccess;
  const LoginRegistrationSection({super.key, this.onLoginSuccess});

  @override
  Widget build(BuildContext context) {
    final screenHeight = ScreenSize.getHeight(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "You are not logged in!",
            style: TextStyle(
                fontFamily: "Roboto",
                fontSize: AppConstants.fontSizeLarge,
                color: AppConstants.textColorDark),
          ),
          SizedBox(height: screenHeight * 0.02),
          CustomButton(
            labelText: "Login/Register",
            style: ButtonStyles.primaryStyle(context),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return RegistrationLoginWidget(
                        onLoginSuccess: onLoginSuccess);
                  });
            },
          ),
        ],
      ),
    );
  }
}