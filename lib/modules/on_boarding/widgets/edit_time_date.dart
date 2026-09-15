import 'package:evently/core/config/theme/app_assets.dart';
import 'package:evently/core/config/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EditTimeDate extends StatelessWidget {
  const EditTimeDate({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SvgPicture.asset(AppAssets.calendarIcon, width: 24, height: 24),
            SizedBox(width: 4),
            Expanded(
              child: Text(
                "Event Date",
                style: TextStyle(
                  color: AppColors.mainTextLight,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            Text(
              "Jan 30, 2026",
              style: TextStyle(
                color: AppColors.mainColorLight,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontFamily: 'Poppins',
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
        SizedBox(height: 16),
        Row(
          children: [
            SvgPicture.asset(AppAssets.clockIcon, width: 24, height: 24),
            SizedBox(width: 4),
            Expanded(
              child: Text(
                "Event Time",
                style: TextStyle(
                  color: AppColors.mainTextLight,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            Text(
              "11:22 PM",
              style: TextStyle(
                color: AppColors.mainColorLight,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontFamily: 'Poppins',
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
