//lib/core/widgets/shared/custom_app_bar.dart
import 'package:flutter/material.dart';
import 'package:learning_spiders/core/config/app_constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leading;
  final List<Widget>? actions;
  final bool automaticallyImplyLeading;

  const CustomAppBar({
    super.key,
    required this.title,
    this.actions,
    this.leading,
    this.automaticallyImplyLeading = true,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final fontSize = screenWidth * 0.05;

    return AppBar(
      title: Text(
        title,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          fontFamily: 'Oswald',
          shadows: const [
            Shadow(
              blurRadius: 3.0,
              color: AppConstants.shadowColor,
              offset: Offset(1.0, 1.0),
            ),
          ],
        ),
      ),
      leading: leading,
      actions: actions,
      centerTitle: true,
      elevation: AppConstants.defaultElevation,
      backgroundColor: AppConstants.primaryColor,
      iconTheme: const IconThemeData(
        color: AppConstants.textColorLight,
      ),
      automaticallyImplyLeading: automaticallyImplyLeading,
    );
  }
}
