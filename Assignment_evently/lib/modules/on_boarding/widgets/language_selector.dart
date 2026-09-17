import 'package:evently/core/config/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/providerrr/settings.dart';

class LanguageSelector extends StatelessWidget {
  const LanguageSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Settings>(context);

    final theme = Theme.of(context);
    return Row(
      children: [
        Expanded(child: Text("Language", style: theme.textTheme.titleMedium)),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5.5),
          decoration: BoxDecoration(
            color: theme.primaryColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            "English",
            style: theme.textTheme.bodyMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(width: 8),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5.5),
          decoration: BoxDecoration(
            color: provider.currentThemeMode == ThemeMode.light
                ? AppColors.mainColorLight
                : AppColors.inputsDark,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            "Arabic",
            style: theme.textTheme.bodyMedium?.copyWith(
              color: AppColors.inputsLight,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
