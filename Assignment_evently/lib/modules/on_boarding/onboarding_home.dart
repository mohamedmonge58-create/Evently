import 'package:evently/core/config/routes/app_routes_name.dart';
import 'package:evently/core/config/theme/app_assets.dart';
import 'package:evently/core/config/theme/app_colors.dart';
import 'package:evently/modules/authentication/pages/login_view.dart';
import 'package:evently/modules/on_boarding/widgets/onboarding_1.dart';
import 'package:evently/modules/on_boarding/widgets/onboarding_2.dart';
import 'package:evently/modules/on_boarding/widgets/onboarding_3.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/providerrr/settings.dart';

class OnboardingHome extends StatefulWidget {
  const OnboardingHome({super.key});

  @override
  State<OnboardingHome> createState() => _OnboardingHomeState();
}

class _OnboardingHomeState extends State<OnboardingHome> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  List<Widget> get _pages => [
    Onboarding1(currentPage: _currentPage),
    Onboarding2(currentPage: _currentPage),
    Onboarding3(currentPage: _currentPage),
  ];
  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushNamed(context, AppRoutesName.loginRoute);
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Settings>(context);

    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 0,

        leading: _currentPage == 0
            ? null
            : Padding(
                padding: const EdgeInsets.only(top: 16),
                child: TextButton(
                  onPressed: () {
                    _pageController.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: Container(
                    width: 32,
                    height: 40,
                    decoration: BoxDecoration(
                      color: provider.currentThemeMode == ThemeMode.light
                          ? AppColors.inputsLight
                          : AppColors.inputsDark,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: provider.currentThemeMode == ThemeMode.light
                            ? AppColors.strokeLight
                            : AppColors.strokeDark,
                      ),
                    ),
                    child: Icon(
                      Icons.arrow_back_ios_rounded,
                      size: 24,
                      color: provider.currentThemeMode == ThemeMode.light
                          ? AppColors.mainColorLight
                          : AppColors.inputsLight,
                    ),
                  ),
                ),
              ),

        title: Padding(
          padding: const EdgeInsets.only(top: 16),
          child: SizedBox(
            width: double.infinity,
            height: 60,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Image.asset(
                    AppAssets.eventlyLogo,
                    width: 145,
                    height: 70,
                  ),
                ),

                Positioned(
                  right: 16,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => LoginView()),
                      );
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 5.5,
                      ),
                      decoration: BoxDecoration(
                        color: provider.currentThemeMode == ThemeMode.light
                            ? AppColors.inputsLight
                            : AppColors.inputsDark,
                        borderRadius: BorderRadius.circular(8),
                        border: BoxBorder.all(
                          color: provider.currentThemeMode == ThemeMode.light
                              ? AppColors.strokeLight
                              : AppColors.strokeDark,
                        ),
                      ),
                      child: Text(
                        "Skip",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: provider.currentThemeMode == ThemeMode.light
                              ? AppColors.mainColorLight
                              : AppColors.inputsLight,
                          fontWeight: FontWeight.w400,
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

      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              physics: NeverScrollableScrollPhysics(),
              controller: _pageController,
              itemCount: _pages.length,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                return _pages[index];
              },
            ),
          ),
          // SizedBox(
          //   height: 6,
          //   child: Center(
          //     child: ListView.builder(
          //         scrollDirection: Axis.horizontal,
          //         itemCount:_pages.length,
          //         shrinkWrap: true,
          //
          //         itemBuilder: (context, index){
          //           final isCurrentPage = index == _currentPage;
          //           return AnimatedContainer(
          //             duration: Duration(milliseconds: 300),
          //           margin: EdgeInsets.symmetric(horizontal: 3),
          //             width: isCurrentPage? 18:6,
          //             height: 6,
          //             decoration: BoxDecoration(
          //               color: isCurrentPage? theme.primaryColor: Colors.white,
          //               borderRadius: BorderRadius.circular(10)
          //             ),
          //           );
          //
          //
          //
          //
          //     }
          //
          //     ),
          //   ),
          // ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 20),
            child: SizedBox(
              width: double.infinity,
              height: 48,
              child: TextButton(
                onPressed: () {
                  _nextPage();
                },
                style: TextButton.styleFrom(padding: EdgeInsets.zero),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: theme.primaryColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: Text(
                      _currentPage == _pages.length - 1
                          ? "Get started"
                          : "Next",
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
          ),
        ],
      ),
    );
  }
}
