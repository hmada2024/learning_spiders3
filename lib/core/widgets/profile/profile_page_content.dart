//lib/core/widgets/profile/profile_page_content.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_spiders/core/config/app_constants.dart';
import 'package:learning_spiders/core/config/screen_size.dart';
import 'package:learning_spiders/core/user/user_cubit.dart';
import 'package:learning_spiders/core/user/user_model.dart';
import 'package:learning_spiders/core/widgets/profile/edit_profile_form.dart';
import 'package:learning_spiders/core/widgets/profile/login_registration_section.dart';
import 'package:learning_spiders/core/widgets/profile/profile_header.dart';
import 'package:learning_spiders/core/widgets/profile/profile_options.dart';
import 'package:learning_spiders/core/widgets/profile/quiz_results_table.dart';

class ProfilePageContent extends StatefulWidget {
  final UserModel? currentUser;

  const ProfilePageContent({super.key, this.currentUser});

  @override
  State<ProfilePageContent> createState() => _ProfilePageContentState();
}

class _ProfilePageContentState extends State<ProfilePageContent>
    with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _currentPasswordController = TextEditingController();
  bool _obscurePassword = true;
  bool _obscureCurrentPassword = true;
  bool _isEditing = false;
  late final AnimationController _animationController;
  late final Animation<Offset> _slideAnimation;
  late final Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: AppConstants.animationDurationMedium,
      vsync: this,
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, -0.1),
      end: Offset.zero,
    ).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _nameController.dispose();
    _passwordController.dispose();
    _currentPasswordController.dispose();
    super.dispose();
  }

  Future<void> _submitForm(UserModel currentUser) async {
    if (_formKey.currentState!.validate()) {
      if (!mounted) return;

      if (_currentPasswordController.text.trim() != currentUser.password) {
        _showSnackBar('Current Password doesn\'t match.',
            Theme.of(context).colorScheme.error);
        return;
      }

      final updatedUser = _getUpdatedUser(currentUser);

      try {
        await BlocProvider.of<UserCubit>(context).updateUser(updatedUser);
        if (!mounted) return;
        _showSnackBar('Profile updated successfully.',
            Theme.of(context).colorScheme.secondary);
      } catch (e) {
        // Check mounted before accessing context
        if (!mounted) return;
        _showSnackBar('Failed to update profile: $e',
            Theme.of(context).colorScheme.error);
      } finally {
        if (mounted) {
          setState(() {
            _isEditing = false;
          });
        }
      }
    }
  }

  UserModel _getUpdatedUser(UserModel currentUser) {
    return currentUser.copyWith(
      name: _nameController.text.trim().isEmpty
          ? currentUser.name
          : _nameController.text.trim(),
      password: _passwordController.text.trim().isEmpty
          ? currentUser.password
          : _passwordController.text.trim(),
    );
  }

  void _showSnackBar(String message, Color backgroundColor) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message), backgroundColor: backgroundColor),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = ScreenSize.getWidth(context);
    final screenHeight = ScreenSize.getHeight(context);

    _nameController.text = widget.currentUser?.name ?? '';
    _passwordController.text = widget.currentUser?.password ?? '';

    return Form(
      key: _formKey,
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.05,
                vertical: screenHeight * 0.04,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  _buildProfileHeader(),
                  _buildProfileOptionsOrEditForm(),
                  SizedBox(height: screenHeight * 0.03),
                  _buildQuizResultsCard(screenWidth),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileHeader() {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: widget.currentUser == null
            ? LoginRegistrationSection(onLoginSuccess: (_) {})
            : ProfileHeader(currentUser: widget.currentUser!),
      ),
    );
  }

  Widget _buildProfileOptionsOrEditForm() {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: AnimatedSwitcher(
          duration: AppConstants.animationDurationMedium,
          transitionBuilder: (child, animation) {
            return SizeTransition(
              sizeFactor: animation,
              axisAlignment: -1.0,
              child: FadeTransition(opacity: animation, child: child),
            );
          },
          child: widget.currentUser == null
              ? const SizedBox.shrink()
              : !_isEditing
                  ? ProfileOptions(onEditProfileTap: _handleEditProfileTap)
                  : EditProfileForm(
                      nameController: _nameController,
                      passwordController: _passwordController,
                      currentPasswordController: _currentPasswordController,
                      onSubmit: () => _submitForm(widget.currentUser!),
                      onCancel: () => setState(() {
                        _isEditing = false;
                      }),
                      obscureCurrentPassword: _obscureCurrentPassword,
                      obscurePassword: _obscurePassword,
                      onCurrentPasswordToggle: _handleCurrentPasswordToggle,
                      onPasswordToggle: _handlePasswordToggle,
                    ),
        ),
      ),
    );
  }

  Widget _buildQuizResultsCard(double screenWidth) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: Card(
          elevation: AppConstants.defaultElevation,
          shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(AppConstants.borderRadiusLarge)),
          child: Padding(
            padding: EdgeInsets.all(screenWidth * 0.02),
            child: QuizResultsTable(
                currentUser: widget.currentUser), // Pass currentUser
          ),
        ),
      ),
    );
  }

  void _handleEditProfileTap() {
    setState(() {
      _isEditing = true;
    });
    _nameController.text = widget.currentUser!.name;
    _passwordController.text = widget.currentUser!.password ?? '';
  }

  void _handleCurrentPasswordToggle(bool isVisible) {
    setState(() {
      _obscureCurrentPassword = isVisible;
    });
  }

  void _handlePasswordToggle(bool isVisible) {
    setState(() {
      _obscurePassword = isVisible;
    });
  }
}