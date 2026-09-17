import 'package:evently/core/config/routes/app_routes_name.dart';
import 'package:evently/core/config/theme/app_assets.dart';
import 'package:evently/modules/on_boarding/widgets/language_selector.dart';
import 'package:evently/modules/on_boarding/widgets/theme_selector.dart';
import 'package:flutter/material.dart';

class LetsStartView extends StatelessWidget {
  const LetsStartView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Expanded(
      child: Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Center(
              child: Image.asset(AppAssets.eventlyLogo, width: 145, height: 70),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(AppAssets.letsStart),
                SizedBox(height: 24),
                Text(
                  "Personalize Your Experience",
                  style: theme.textTheme.titleLarge,
                ),
                SizedBox(height: 8),

                Text(
                  "Choose your preferred theme and language to get started with a comfortable, tailored experience that suits your style.",
                  style: theme.textTheme.bodyLarge,
                ),
                SizedBox(height: 16),
                LanguageSelector(),
                SizedBox(height: 16),
                ThemeSelector(),
                SizedBox(height: 50),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutesName.onBoardingRoute);
                  },
                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                  child: Container(
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                      color: theme.primaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        "Let’s start",
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
