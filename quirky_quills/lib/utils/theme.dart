import 'package:flutter/material.dart';
import 'package:quirky_quills/utils/colors.dart';
import 'package:quirky_quills/utils/dimensions.dart';

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
      fontWeight: FontWeight.w500,
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
    primaryColor: AppColors.popColor,
    colorScheme: const ColorScheme.light(
      primary: AppColors.popColor,
      onPrimary: AppColors.buttonTextColor,
      secondary: AppColors.popColor,
      onSecondary: AppColors.buttonTextColor,
      surface: AppColors.lightCardColor,
      onSurface: AppColors.lightTextColor,
      outline: AppColors.lightBorderColor,
      error: AppColors.lightErrorBackground,
      onError: AppColors.lightErrorTextColor,
    ),
    scaffoldBackgroundColor: AppColors.lightBackground,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.lightAppBarBackground,
      foregroundColor: AppColors.lightTextColor,
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: AppColors.popColor,
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
    cardTheme: CardThemeData(color: AppColors.lightCardColor),
    chipTheme: ChipThemeData(
      backgroundColor: AppColors.lightCardColor,
      selectedColor: AppColors.popColor,
      side: BorderSide(color: AppColors.lightBorderColor),
      shape: StadiumBorder(),
      labelStyle: TextStyle(color: AppColors.lightTextColor),
      secondaryLabelStyle: TextStyle(
        color: AppColors.buttonTextColor,
        fontWeight: FontWeight.w600,
      ),
    ),
    textTheme: lightTextTheme,
  );
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.popColor,
    scaffoldBackgroundColor: AppColors.darkBackground,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.popColor,
      onPrimary: AppColors.buttonTextColor,
      secondary: AppColors.popColor,
      onSecondary: AppColors.buttonTextColor,
      surface: AppColors.darkCardColor,
      onSurface: AppColors.darkTextColor,
      outline: AppColors.darkBorderColor,
      error: AppColors.darkErrorBackground,
      onError: AppColors.darkErrorTextColor,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.darkAppBarBackground,
      foregroundColor: AppColors.darkTextColor,
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: AppColors.popColor,
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
    chipTheme: ChipThemeData(
      backgroundColor: AppColors.darkCardColor,
      selectedColor: AppColors.popColor,
      labelStyle: TextStyle(color: AppColors.darkTextColor),
      secondaryLabelStyle: TextStyle(
        color: AppColors.buttonTextColor,
        fontWeight: FontWeight.w600,
      ),
      side: BorderSide(color: AppColors.darkBorderColor),
      shape: StadiumBorder(),
    ),
    textTheme: darkTextTheme,
  );
}
