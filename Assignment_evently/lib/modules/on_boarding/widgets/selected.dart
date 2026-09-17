import 'package:evently/core/config/theme/app_colors.dart';
import 'package:evently/data_source/category_data_source.dart';
import 'package:flutter/material.dart';

class CategorySelector extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onCategoryChanged;

  const CategorySelector({
    super.key,
    required this.selectedIndex,
    required this.onCategoryChanged,
  });

  @override
  Widget build(BuildContext context) {
    final categories = CategoryDataSource.categories;

    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.zero,
        itemCount: categories.length,
        separatorBuilder: (context, index) {
          return const SizedBox(width: 8);
        },
        itemBuilder: (context, index) {
          final isSelected = selectedIndex == index;
          final category = categories[index];

          return GestureDetector(
            onTap: () => onCategoryChanged(index),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.mainColorLight : Colors.white,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  color: isSelected
                      ? AppColors.mainColorLight
                      : const Color(0xffE5E5E5),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    category.icon,
                    size: 24,
                    color: isSelected ? Colors.white : AppColors.mainColorLight,
                  ),

                  const SizedBox(width: 8),

                  Text(
                    category.name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: isSelected ? Colors.white : Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
