import 'package:evently/core/config/theme/app_assets.dart';
import 'package:evently/core/config/theme/app_colors.dart';
import 'package:evently/modules/authentication/pages/login_view.dart';
import 'package:evently/modules/on_boarding/widgets/onboarding_3.dart';
import 'package:evently/modules/on_boarding/widgets/page_indicator.dart';
import 'package:flutter/material.dart';

class Onboarding2 extends StatelessWidget {
  final int currentPage;
  const Onboarding2({super.key, required this.currentPage});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16,),
          Center(child: Image.asset(AppAssets.beingCreative1)),
          PageIndicator(currentPage: currentPage, pageCount: 3,),
          SizedBox(height: 24,),
          Text("Effortless Event Planning", style: theme.textTheme.titleLarge,),
          SizedBox(height: 8,),

          Text(
            "Take the hassle out of organizing events with our all-in-one planning tools. From setting up invites and managing RSVPs to scheduling reminders and coordinating details, we’ve got you covered. Plan with ease and focus on what matters – creating an unforgettable experience for you and your guests.",
            style: theme.textTheme.bodyLarge,),
          SizedBox(height: 16,),
          // TextButton(onPressed: () {
          //
          // },
          //   style: TextButton.styleFrom(
          //       padding: EdgeInsets.zero
          //   ),
          //   child:
          //   Container(
          //     width: double.infinity,
          //     height: 60,
          //     decoration: BoxDecoration(
          //         color: theme.primaryColor,
          //         borderRadius: BorderRadius.circular(20)
          //     ),
          //     child: Center(child: Text("Next", style: TextStyle(fontSize: 20,
          //         fontWeight: FontWeight.w500,
          //         color: Colors.white,
          //         fontFamily: 'Poppins'),)),
          //   )
          //   ,)

        ],
      ),
    );
  }
}
