//lib/core/widgets/shared/category_filter.dart
import 'package:flutter/material.dart';
import 'package:learning_spiders/core/config/app_constants.dart';
import 'package:learning_spiders/core/widgets/shared/category_selector.dart'; // استيراد

class CategoryFilterDropdown extends StatelessWidget {
  final List<String> categories;
  final String? selectedCategory;
  final Function(String?) onCategoryChanged;

  const CategoryFilterDropdown({
    super.key,
    required this.categories,
    required this.selectedCategory,
    required this.onCategoryChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: IconButton(
        icon: const Icon(Icons.filter_list, color: AppConstants.textColorLight),
        tooltip: 'Filter Categories',
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return CategorySelector( 
                categories: categories,
                selectedCategory: selectedCategory,
                onCategorySelected: (newCategory) {
                  onCategoryChanged(newCategory);
                  Navigator.pop(context);
                },
              );
            },
          );
        },
      ),
    );
  }
}