import 'package:flutter/material.dart';

import '../constants/colors.dart';
import 'R.dart';
import 'font_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    useMaterial3: true,
    primaryColor: AppColors.primaryColor,
    fontFamily: FontConstants.fontFamily,
    textTheme: TextTheme(
      bodyMedium: TextStyle(
          color: AppColors.contentColor,
          fontSize: R.appSize.s20,
          fontWeight: FontWeightManager.semiBold),
      displaySmall: TextStyle(
          color: AppColors.fieldTextColor,
          fontSize: R.appSize.s14,
          fontWeight: FontWeightManager.regular),
      headlineLarge: TextStyle(
          color: AppColors.primaryTextColor,
          fontSize: R.appSize.s24,
          fontWeight: FontWeightManager.semiBold),
      headlineMedium: TextStyle(
          color: AppColors.primaryTextColor,
          fontSize: R.appSize.s16,
          fontWeight: FontWeightManager.medium),
      headlineSmall: TextStyle(
          color: AppColors.primaryTextColor,
          fontSize: R.appSize.s14,
          fontWeight: FontWeightManager.medium),
    ),
    progressIndicatorTheme:
        ProgressIndicatorThemeData(color: AppColors.primaryColor),
    drawerTheme: DrawerThemeData(backgroundColor: AppColors.primaryBGColor),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.primaryBGColor,
        foregroundColor: AppColors.primaryTextColor),
    appBarTheme: AppBarTheme(
        centerTitle: false,
        color: AppColors.primaryBGColor,
        titleTextStyle: TextStyle(
            color: AppColors.primaryTextColor, fontSize: R.appSize.s24),
        elevation: R.appSize.s1,
        iconTheme: IconThemeData(color: AppColors.primaryTextColor)),
  );
}
