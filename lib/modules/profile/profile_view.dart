import 'package:evently/core/config/theme/app_assets.dart';
import 'package:evently/core/config/theme/app_colors.dart';
import 'package:evently/modules/profile/setting_option_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:provider/provider.dart';

import '../../core/providerrr/settings.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Settings>(context);
    final theme = Theme.of(context);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: 115,
              height: 115,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: AssetImage(AppAssets.profilePic)),
              ),
            ),

            const SizedBox(height: 16),

            Center(
              child: Text("Mohamed Monge", style: theme.textTheme.titleLarge),
            ),

            const SizedBox(height: 4),

            Center(
              child: Text(
                "MohamedMonge@gmail.com",
                style: theme.textTheme.bodyMedium,
              ),
            ),

            const SizedBox(height: 32),

            SettingOptionWidget(
              optionName: "Dark Mood",
              optionIcon: FlutterSwitch(
                width: 40.0,
                height: 24.0,
                activeColor: AppColors.mainColorLight,
                inactiveColor: AppColors.disabled,
                toggleSize: 16.0,
                borderRadius: 30.0,

                value: provider.currentThemeMode == ThemeMode.dark,

                onToggle: (val) {
                  provider.changeThemeMode(
                    provider.currentThemeMode == ThemeMode.dark
                        ? ThemeMode.light
                        : ThemeMode.dark,
                  );
                },
              ),
            ),

            const SizedBox(height: 16),

            SettingOptionWidget(
              optionName: "Language",
              optionIcon: SvgPicture.asset(AppAssets.arrowRight),
            ),

            const SizedBox(height: 16),

            SettingOptionWidget(
              optionName: "Logout",
              optionIcon: SvgPicture.asset(AppAssets.logOut),
            ),
          ],
        ),
      ),
    );
  }
}
