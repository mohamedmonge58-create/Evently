import 'package:evently/core/config/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/providerrr/settings.dart';

class SettingOptionWidget extends StatelessWidget {
  final String optionName;
  final Widget? optionIcon;

  const SettingOptionWidget({
    super.key,
    required this.optionName,
    required this.optionIcon,
  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Settings>(context);

    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      height: 50,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: provider.currentThemeMode == ThemeMode.light
            ? AppColors.inputsLight
            : AppColors.inputsDark,
        border: BoxBorder.all(
          color: provider.currentThemeMode == ThemeMode.light
              ? AppColors.strokeLight
              : AppColors.strokeDark,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            optionName,
            style: theme.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight(500),
            ),
          ),

          ?optionIcon,
        ],
      ),
    );
  }
}
