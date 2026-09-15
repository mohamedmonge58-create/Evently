import 'package:evently/core/config/theme/app_assets.dart';
import 'package:evently/core/config/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/config/gen/assets.gen.dart';

class EventCardItem extends StatelessWidget {
  const EventCardItem({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      height: 195,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.images.sportLight.path),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(16),
        border: BoxBorder.all(color: AppColors.strokeLight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.backgroundLight,
              borderRadius: BorderRadius.circular(8),
              border: BoxBorder.all(color: AppColors.strokeLight),
            ),
            child: Text(
              "21 Jan",
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.primaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.backgroundLight,
              borderRadius: BorderRadius.circular(8),
              border: BoxBorder.all(color: AppColors.strokeLight),
            ),
            child: Row(
              spacing: 8,
              children: [
                Expanded(
                  child: Text(
                    "This is a Birthday Party ",
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: AppColors.mainTextLight,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SvgPicture.asset(AppAssets.selectedHeart),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
