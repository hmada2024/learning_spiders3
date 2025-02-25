// lib/core/widgets/shared/category_list.dart
import 'package:flutter/material.dart';
import 'package:learning_spiders/core/widgets/shared/category_selector.dart'; // استيراد

class CategoryList extends StatelessWidget {
  final List<String> categories;
  final String? selectedCategory;
  final ValueChanged<String> onCategorySelected;

  const CategoryList({
    super.key,
    required this.categories,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return CategorySelector(
      categories: categories,
      selectedCategory: selectedCategory,
      onCategorySelected: onCategorySelected,
    );
  }
}