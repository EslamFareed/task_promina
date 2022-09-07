import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../color/app_colors.dart';

ThemeData darkMode = ThemeData(
  dialogTheme: const DialogTheme(
    backgroundColor: AppColors.darkBackGroundColor,
    elevation: 20.0,
  ),
  canvasColor: AppColors.darkBackGroundColor,
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
    backgroundColor: AppColors.darkBackGroundColor,
    elevation: 0.0,
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: AppColors.darkBackGroundColor,
      statusBarIconBrightness: Brightness.light,
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
    backgroundColor: AppColors.darkBackGroundColor,
  ),
  fontFamily: "Jannah",
);
