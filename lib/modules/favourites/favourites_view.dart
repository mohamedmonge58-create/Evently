import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../core/config/theme/app_assets.dart';
import '../../core/config/theme/app_colors.dart';
import '../../core/providerrr/settings.dart';
import '../home/widget/event_card_item.dart';

class FavouritesView extends StatelessWidget {
  const FavouritesView({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Settings>(context);
    final theme = Theme.of(context);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            SizedBox(height: 16,),
            TextFormField(
              cursorColor: theme.primaryColor,
              decoration: InputDecoration(
                hintText: "Search for event",
                hintStyle: TextStyle(
                  color: provider.currentThemeMode == ThemeMode.light
                      ? AppColors.secTextLight
                      : AppColors.secTextDark,
                ),
                filled: true,
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: SvgPicture.asset(AppAssets.searchIcon,width: 24,height: 24,),
                ),
                suffixIconConstraints:BoxConstraints(
                  maxWidth: 50,
                  minHeight: 50
                ) ,
                

                
                fillColor: provider.currentThemeMode == ThemeMode.light
                    ? AppColors.inputsLight
                    : AppColors.inputsDark,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: provider.currentThemeMode == ThemeMode.light
                        ? AppColors.strokeLight
                        : AppColors.strokeDark,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: provider.currentThemeMode == ThemeMode.light
                        ? AppColors.strokeLight
                        : AppColors.strokeDark,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16,),

            Expanded(child: ListView.separated(itemBuilder: (context,index)=>EventCardItem(),

                separatorBuilder: (context,index)=>SizedBox(height: 16,),

                itemCount: 10))

          ],
        ),
      ),
    );
  }
}
