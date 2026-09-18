import 'dart:async';

import 'package:evently/core/config/routes/app_routes_name.dart';
import 'package:evently/core/config/theme/app_assets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../services/app_preferences.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), _checkFirstLaunch);
  }

  Future<void> _checkFirstLaunch() async {
    final onboardingCompleted = await AppPreferences.isOnboardingCompleted();

    if (!mounted) return;

    if (!onboardingCompleted) {
      Navigator.pushReplacementNamed(context, AppRoutesName.onBoardingRoute);
    } else {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        Navigator.pushReplacementNamed(context, AppRoutesName.layoutView);
      } else {
        Navigator.pushReplacementNamed(context, AppRoutesName.loginRoute);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Image.asset(
                    AppAssets.eventlyLogo,
                    color: theme.primaryColor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: Text(
                  "Supervised by Mohamed Monge",
                  style: TextStyle(
                    color: theme.dividerColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
