
import 'package:evently/core/config/theme/app_assets.dart';
import 'package:evently/core/config/theme/app_colors.dart';
import 'package:evently/modules/authentication/pages/login_view.dart';
import 'package:evently/modules/on_boarding/widgets/page_indicator.dart';
import 'package:flutter/material.dart';

class Onboarding3 extends StatelessWidget {
  final int currentPage;
  const Onboarding3({super.key, required this.currentPage});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return  Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height:16 ,),
              Center(child: Image.asset(AppAssets.beingCreative2)),
              PageIndicator(currentPage: currentPage, pageCount: 3,),
              SizedBox(height: 24,),
              Text("Connect with Friends & Share Moments" , style: theme.textTheme.titleLarge,),
              SizedBox(height: 8,),

              Text( "Make every event memorable by sharing the experience with others. Our platform lets you invite friends, keep everyone in the loop, and celebrate moments together. Capture and share the excitement with your network, so you can relive the highlights and cherish the memories.",style: theme.textTheme.bodyLarge,),
              SizedBox(height: 16,),
              // TextButton(onPressed: (){
              //
              //
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
              //     child: Center(child: Text("Get started" , style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500 , color: Colors.white,fontFamily: 'Poppins'),)),
              //   )
              //   ,)

            ],
          ),
    );

  }
}
