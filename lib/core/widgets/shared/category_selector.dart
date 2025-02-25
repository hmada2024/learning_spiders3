//lib/core/widgets/shared/category_selector.dart
import 'package:flutter/material.dart';
import 'package:learning_spiders/core/config/app_constants.dart';
import 'package:learning_spiders/core/widgets/text/string_formatter.dart';

class CategorySelector extends StatelessWidget {
  final List<String> categories;
  final String? selectedCategory;
  final ValueChanged<String> onCategorySelected;

  const CategorySelector({
    super.key,
    required this.categories,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];
        final isSelected = category == selectedCategory;

        return ListTile(
          title: Text(
            category == 'all'
                ? 'All Categories'
                : StringFormatter.formatFieldName(category),
            style: const TextStyle(
              fontFamily: AppConstants.defaultFontFamily,
              color: AppConstants.textColorDark,
            ),
          ),
          tileColor: isSelected
              ? AppConstants.primaryColor.withValues(alpha:0.8)
              : null, 
          trailing: isSelected
              ? const Icon(Icons.check, color: AppConstants.primaryColor)
              : null,
          onTap: () {
            onCategorySelected(category);
          },
        );
      },
    );
  }
}