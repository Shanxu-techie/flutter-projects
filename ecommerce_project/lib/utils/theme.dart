import 'package:ecommerce_project/utils/dimensions.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

class AppThemes {
  static const TextTheme lightTextTheme = TextTheme(
    bodyLarge: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: AppColors.lightTextColor,
    ),
    bodyMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: AppColors.lightTextColor,
    ),
    bodySmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: AppColors.lightTextColor,
    ),
    headlineLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: AppColors.lightTextColor,
    ),
    headlineMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w700,
      color: AppColors.lightTextColor,
    ),
    headlineSmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: AppColors.lightTextColor,
    ),
  );
  static const TextTheme darkTextTheme = TextTheme(
    bodyLarge: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: AppColors.darkTextColor,
    ),
    bodyMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: AppColors.darkTextColor,
    ),
    bodySmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: AppColors.darkTextColor,
    ),
    headlineLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: AppColors.darkTextColor,
    ),
    headlineMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w700,
      color: AppColors.darkTextColor,
    ),
    headlineSmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: AppColors.darkTextColor,
    ),
  );

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.brandColor,
    scaffoldBackgroundColor: AppColors.lightBackground,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.lightAppBarBackground,
      foregroundColor: AppColors.lightTextColor,
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: AppColors.brandColor,
        foregroundColor: AppColors.buttonTextColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.borderRadiusSmall),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.lightTextColor,
        padding: EdgeInsets.zero,
      ),
    ),
    drawerTheme: DrawerThemeData(
      backgroundColor: AppColors.lightDrawerBackground,
    ),
    cardTheme: CardThemeData(color: AppColors.lightCardColor,),
    textTheme: lightTextTheme,
  );
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.brandColor,
    scaffoldBackgroundColor: AppColors.darkBackground,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.darkAppBarBackground,
      foregroundColor: AppColors.darkTextColor,
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: AppColors.brandColor,
        foregroundColor: AppColors.buttonTextColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.borderRadiusSmall),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.darkTextColor,
        padding: EdgeInsets.zero,
      ),
    ),
    drawerTheme: DrawerThemeData(
      backgroundColor: AppColors.darkDrawerBackground,
    ),
    cardTheme: CardThemeData(color: AppColors.darkCardColor),
    textTheme: darkTextTheme,
  );
}
