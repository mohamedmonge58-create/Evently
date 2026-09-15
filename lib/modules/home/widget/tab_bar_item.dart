import 'package:evently/core/config/theme/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../models/category_data.dart';

class TabBarItem extends StatelessWidget {
  final CategoryData categoryData;
  final bool isSelected;

  const TabBarItem({
    super.key,
    required this.categoryData,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? theme.primaryColor : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: BoxBorder.all(color: AppColors.strokeLight),
      ),
      child: Row(
        spacing: 8,
        children: [
          Icon(
            categoryData.icon,
            color: isSelected ? Colors.white : theme.primaryColor,
            size: 24,
          ),
          Text(
            categoryData.name,
            style: theme.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w500,
              color: isSelected ? Colors.white : AppColors.mainTextLight,
            ),
          ),
        ],
      ),
    );
  }
}
