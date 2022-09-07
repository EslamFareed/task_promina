import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../color/app_colors.dart';

ThemeData lightMode = ThemeData(
  dialogTheme: const DialogTheme(
    backgroundColor: AppColors.whitBackGroundColor,
    elevation: 20.0,
  ),
  canvasColor: AppColors.whitBackGroundColor,
  dividerColor: Colors.black26,
  primarySwatch: AppColors.primarySwatchColor,
  timePickerTheme: const TimePickerThemeData(
    backgroundColor: AppColors.primaryColor,
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: AppColors.primarySwatchColor,
  ),
  appBarTheme: AppBarTheme(
    titleSpacing: 20.0.w,
    iconTheme: const IconThemeData(
      color: AppColors.primaryColor,
    ),
    backgroundColor: AppColors.whitBackGroundColor,
    elevation: 0.0,
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: AppColors.whitBackGroundColor,
      statusBarIconBrightness: Brightness.dark,
    ),
  ),
  iconTheme: const IconThemeData(
    color: AppColors.primaryColor,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: AppColors.primaryColor,
    elevation: 2.0,
    unselectedItemColor: Colors.grey,
    backgroundColor: AppColors.whitBackGroundColor,
  ),
  fontFamily: "Jannah",
);
