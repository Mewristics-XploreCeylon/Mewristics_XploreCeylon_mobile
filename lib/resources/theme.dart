import 'package:flutter/material.dart';

import 'R.dart';
import 'font_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    useMaterial3: true,
    primaryColor: R.colors.primaryColor,

    fontFamily: FontConstants.fontFamily,

    textTheme: TextTheme(
      bodyMedium: TextStyle(color: R.colors.contentColor, fontSize: R.appSize.s20, fontWeight: FontWeightManager.medium),
      headlineLarge: TextStyle(color: R.colors.primaryTextColor, fontSize: R.appSize.s24,fontWeight: FontWeightManager.semiBold),
headlineMedium: TextStyle(color: R.colors.primaryTextColor, fontSize: R.appSize.s16,fontWeight: FontWeightManager.medium),
      headlineSmall: TextStyle(color: R.colors.fieldTextColor, fontSize: R.appSize.s14,fontWeight: FontWeightManager.medium),
    ),

    progressIndicatorTheme:
        ProgressIndicatorThemeData(color: R.colors.primaryColor),
    drawerTheme: DrawerThemeData(backgroundColor: R.colors.primaryBGColor),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: R.colors.primaryBGColor,
        foregroundColor: R.colors.primaryTextColor),

    appBarTheme: AppBarTheme(
        centerTitle: false,
        color: R.colors.primaryBGColor,
        titleTextStyle:
            TextStyle(color: R.colors.primaryTextColor, fontSize: R.appSize.s24),
        elevation: R.appSize.s1,
        iconTheme: IconThemeData(color: R.colors.primaryTextColor)

       
        ),
  );
}
