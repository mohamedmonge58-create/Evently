import 'package:evently/core/config/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void configLoading() {
  EasyLoading.instance
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorType = EasyLoadingIndicatorType.circle
    ..maskType = EasyLoadingMaskType.black
    ..backgroundColor = Colors.white
    ..indicatorColor = AppColors.mainColorLight
    ..textColor = AppColors.mainColorLight
    ..userInteractions = false
    ..dismissOnTap = false
    ..indicatorSize = 45.0
    ..radius = 12.0;
}
