import 'package:evently/core/config/theme/app_colors.dart';
import 'package:evently/core/providerrr/settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final provider = Provider.of<Settings>(context);
    return Row(
      children: [
        Column(
          spacing: 4,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Welcome Back ✨", style: theme.textTheme.bodyMedium),
            Text("Mohamed Monge ", style: theme.textTheme.titleLarge),
          ],
        ),
        Spacer(),

        GestureDetector(
          onTap: () {
            provider.changeThemeMode(
              provider.currentThemeMode == ThemeMode.dark
                  ? ThemeMode.light
                  : ThemeMode.dark,
            );
          },
          child: Icon(
            provider.currentThemeMode == ThemeMode.dark
                ? Icons.nightlight_rounded
                : Icons.wb_sunny_outlined,
            size: 30,
            color: theme.primaryColor,
          ),
        ),
        SizedBox(width: 8),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5.5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: theme.primaryColor,
          ),
          child: Text(
            "EN",
            style: theme.textTheme.bodyMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
