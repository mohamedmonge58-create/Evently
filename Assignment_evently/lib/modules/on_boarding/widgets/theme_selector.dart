import 'package:evently/core/config/theme/app_assets.dart';
import 'package:evently/core/config/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ThemeSelector extends StatelessWidget {
  const ThemeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Expanded(child: Text("Theme" , style: theme.textTheme.titleMedium,)),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16 , vertical: 5.5),
          decoration: BoxDecoration(
              color: theme.primaryColor,
              borderRadius: BorderRadius.circular(8)
          ),
          child: SvgPicture.asset(AppAssets.sunIcon.toString() , color: Colors.white,)
        ),
        SizedBox(width: 8,),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16 , vertical: 5.5),
          decoration: BoxDecoration(
              color: theme.scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(8)
          ),
          child:  SvgPicture.asset(AppAssets.moonIcon.toString() , color: AppColors.mainColorLight ,)
        ),
      ],
    );
  }
}
