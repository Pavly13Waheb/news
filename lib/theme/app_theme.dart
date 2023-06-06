import 'package:flutter/material.dart';
import 'app_material.dart';

abstract class AppTheme {
  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.light(background: AppColor.blackColor),
    primaryColorLight: AppColor.greenColor,
    scaffoldBackgroundColor: AppColor.whiteColor,
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: AppColor.whiteColor, fontSize: 30),
      bodyMedium: TextStyle(color: AppColor.blackColor, fontSize: 25),
      bodySmall: TextStyle(color: AppColor.blackColor, fontSize: 15),
    ),
    appBarTheme: AppBarTheme(
      toolbarHeight: 80,
      centerTitle: true,
      color: AppColor.greenColor,
      shadowColor: Colors.transparent,
      titleTextStyle: TextStyle(
          color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
        ),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: AppColor.whiteColor,
      backgroundColor: Colors.white,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme.light(background: AppColor.blackColor),
    primaryColorDark: AppColor.whiteColor,
    scaffoldBackgroundColor: AppColor.blackColor,
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: AppColor.whiteColor, fontSize: 30),
      bodyMedium: TextStyle(color: AppColor.blackColor, fontSize: 25),
      bodySmall: TextStyle(fontSize: 20, color: AppColor.blackColor),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColor.whiteColor,
      titleTextStyle: TextStyle(
          color: AppColor.greenColor,
          fontSize: 30,
          fontWeight: FontWeight.bold),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: AppColor.whiteColor,
      backgroundColor: Colors.white,
    ),
  );
}
