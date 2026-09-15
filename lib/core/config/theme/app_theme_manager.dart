import 'package:evently/core/config/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui';
abstract class AppThemeManager {

static ThemeData getLightTheme() => ThemeData(
primaryColor: AppColors.mainColorLight,
scaffoldBackgroundColor: AppColors.backgroundLight,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(

    unselectedItemColor: AppColors.scaffoldDark,
    backgroundColor: Colors.white,
    selectedItemColor: AppColors.mainColorLight,

  ),
  appBarTheme: AppBarTheme(
    elevation: 0,
    titleTextStyle: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: AppColors.mainTextLight,
    ),
    backgroundColor: Colors.transparent,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,

    ),

  ),

  textTheme: TextTheme(
    bodyLarge: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: AppColors.secTextLight

    ) ,
    bodyMedium: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.secTextLight
    ),
    titleLarge: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: AppColors.mainTextLight


    ),
      titleMedium: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: AppColors.mainColorLight
      )

  )
);



static ThemeData getDarkTheme() => ThemeData(

  primaryColor: AppColors.mainColorDark,
  scaffoldBackgroundColor: AppColors.backgroundDark,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.backgroundDark,
      selectedItemColor: AppColors.mainColorDark,
        unselectedItemColor:Colors.white
    ),
    appBarTheme: AppBarTheme(
      elevation: 0,
      titleTextStyle: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),


      backgroundColor: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light

      ),

    ),
    textTheme: TextTheme(
        bodyLarge: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.secTextDark

        ) , bodyMedium: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.secTextDark
    ),
        titleLarge: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 20,
          fontWeight: FontWeight.w600,
            color: AppColors.mainTextDark

        ),
        titleMedium: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: AppColors.mainColorDark
    ),

    ),



);

}