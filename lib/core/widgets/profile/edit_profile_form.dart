//lib/core/widgets/profile/edit_profile_form.dart
import 'package:flutter/material.dart';
import 'package:learning_spiders/core/config/screen_size.dart';
import 'package:learning_spiders/core/widgets/input/custom_text_field.dart';
import 'package:learning_spiders/core/widgets/shared/custom_button.dart';
import 'package:learning_spiders/core/config/button_styles.dart';

class EditProfileForm extends StatefulWidget {
  final TextEditingController nameController;
  final TextEditingController passwordController;
  final TextEditingController currentPasswordController;
  final VoidCallback onSubmit;
  final VoidCallback onCancel;
  final bool obscurePassword;
  final bool obscureCurrentPassword;
  final Function(bool isPasswordVisible)? onPasswordToggle;
  final Function(bool isCurrentPasswordVisible)? onCurrentPasswordToggle;

  const EditProfileForm(
      {super.key,
      required this.nameController,
      required this.passwordController,
      required this.currentPasswordController,
      required this.onSubmit,
      required this.onCancel,
      required this.obscurePassword,
      required this.obscureCurrentPassword,
      required this.onPasswordToggle,
      required this.onCurrentPasswordToggle});
  @override
  State<EditProfileForm> createState() => _EditProfileFormState();
}

class _EditProfileFormState extends State<EditProfileForm> {
  bool _obscurePassword = false;
  bool _obscureCurrentPassword = false;

  @override
  void initState() {
    super.initState();
    _obscurePassword = widget.obscurePassword;
    _obscureCurrentPassword = widget.obscureCurrentPassword;
  }

  @override
  void didUpdateWidget(covariant EditProfileForm oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.obscurePassword != oldWidget.obscurePassword) {
      _obscurePassword = widget.obscurePassword;
    }
    if (widget.obscureCurrentPassword != oldWidget.obscureCurrentPassword) {
      _obscureCurrentPassword = widget.obscureCurrentPassword;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomTextField(
            labelText: 'Current Password',
            hintText: 'Enter your current password',
            prefixIcon: Icons.lock_outline,
            controller: widget.currentPasswordController,
            obscureText: _obscureCurrentPassword,
            suffixIcon: _obscureCurrentPassword
                ? Icons.visibility_off
                : Icons.visibility,
            onSuffixIconPressed: () {
              setState(() {
                _obscureCurrentPassword = !_obscureCurrentPassword;
              });
              widget.onCurrentPasswordToggle?.call(_obscureCurrentPassword);
            },
            validator: (value) => value == null || value.isEmpty
                ? 'Please enter your current password'
                : null,
          ),
          const SizedBox(height: 16),
          CustomTextField(
            labelText: 'Password',
            hintText: 'Enter your new password',
            prefixIcon: Icons.lock_outline,
            controller: widget.passwordController,
            obscureText: _obscurePassword,
            suffixIcon:
                _obscurePassword ? Icons.visibility_off : Icons.visibility,
            onSuffixIconPressed: () {
              setState(() {
                _obscurePassword = !_obscurePassword;
              });
              widget.onPasswordToggle?.call(_obscurePassword);
            },
            validator: (value) => (value == null || value.isEmpty)
                ? 'Please enter your password'
                : null,
          ),
          const SizedBox(height: 24),
          CustomButton(
            labelText: 'Save changes',
            style: ButtonStyles.primaryStyle(context),
            onPressed: widget.onSubmit,
          ),

          SizedBox(height: ScreenSize.getHeight(context) * 0.01),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: widget.onCancel,
              style: TextButton.styleFrom(
                foregroundColor: theme.colorScheme.secondary,
              ),
              child: const Text(
                'Cancel',
                style: TextStyle(fontFamily: 'Roboto'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}