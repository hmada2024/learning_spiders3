//lib/core/widgets/shared/custom_navigation_bar.dart
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:learning_spiders/core/config/app_constants.dart';

class CustomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomNavigationBar({
    required this.currentIndex,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      backgroundColor: Colors.transparent,
      color: AppConstants.primaryColor,
      buttonBackgroundColor: AppConstants.secondaryColor,
      animationDuration: const Duration(milliseconds: 830),
      animationCurve: Curves.easeInOutQuad,
      items: const <Widget>[
        Icon(Icons.home, size: 30, color: AppConstants.textColorLight),
        Icon(Icons.school, size: 30, color: AppConstants.textColorLight),
        Icon(Icons.quiz, size: 30, color: AppConstants.textColorLight),
        Icon(Icons.person, size: 30, color: AppConstants.textColorLight),
      ],
      onTap: (index) {
        Future.delayed(const Duration(milliseconds: 650), () => onTap(index));
      },
      index: currentIndex,
      letIndexChange: (index) => true,
    );
  }
}
