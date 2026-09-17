import 'package:evently/core/config/theme/app_assets.dart';
import 'package:evently/core/config/theme/app_colors.dart';
import 'package:evently/core/providerrr/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class ThemeSelector extends StatelessWidget {
  const ThemeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final provider = Provider.of<Settings>(context);
    return Row(
      children: [
        Expanded(child: Text("Theme", style: theme.textTheme.titleMedium)),
        GestureDetector(
          onTap: () {
            provider.changeThemeMode(ThemeMode.light);
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5.5),
            decoration: BoxDecoration(
              color: provider.currentThemeMode == ThemeMode.light
                  ? AppColors.mainColorLight
                  : AppColors.inputsDark,
              borderRadius: BorderRadius.circular(8),
            ),
            child: SvgPicture.asset(
              AppAssets.sunIcon.toString(),
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(width: 8),
        GestureDetector(
          onTap: () {
            provider.changeThemeMode(ThemeMode.dark);
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5.5),
            decoration: BoxDecoration(
              color: provider.currentThemeMode == ThemeMode.light
                  ? AppColors.inputsLight
                  : AppColors.mainColorDark,
              borderRadius: BorderRadius.circular(8),
            ),
            child: SvgPicture.asset(
              AppAssets.moonIcon.toString(),
              colorFilter: ColorFilter.mode(
                provider.currentThemeMode == ThemeMode.dark
                    ? Colors.white
                    : theme.primaryColor,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
