import 'package:evently/core/config/routes/app_routes_name.dart';
import 'package:evently/core/config/theme/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/config/theme/app_colors.dart';
import '../../../core/providerrr/settings.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Settings>(context);

    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        leading: Padding(
          padding: const EdgeInsets.only(top: 16, left: 16),
          child: Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: provider.currentThemeMode == ThemeMode.dark
                  ? AppColors.inputsLight
                  : AppColors.inputsDark,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: provider.currentThemeMode == ThemeMode.dark
                    ? AppColors.strokeDark
                    : Colors.white,
              ),
            ),
            child: GestureDetector(
              onTap: (){
                Navigator.pushReplacementNamed(context, AppRoutesName.loginRoute);

              },
              child: Icon(
                Icons.arrow_back_ios_rounded,
                size: 24,

                color: provider.currentThemeMode == ThemeMode.light
                    ? AppColors.inputsLight
                    : AppColors.mainTextDark,
              ),
            ),
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Center(
            child: Text(
              "Forget Password",
              style: TextStyle(
                color: provider.currentThemeMode == ThemeMode.dark
                    ? AppColors.mainTextLight
                    : Colors.black,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            SizedBox(height: 32),

            Image.asset(AppAssets.forgetPassword, width: 343, height: 343),
            SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(padding: EdgeInsets.zero),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: theme.primaryColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: Text(
                      "Reset password",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
