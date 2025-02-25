// lib/core/widgets/shared/category_title.dart
import 'package:flutter/material.dart';
import 'package:learning_spiders/core/config/app_constants.dart';

class CategoryTitle extends StatelessWidget {
  final String title;

  const CategoryTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container( 
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: const BoxDecoration(
        color: AppConstants.primaryColor,
        borderRadius: BorderRadius.all(Radius.circular(12))
      ),
      child: Text(
        title,
        style: const TextStyle(
          color: AppConstants.textColorLight,
          fontSize: 20,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
