import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_styles.dart';
import 'package:flutter/material.dart';

class AppTheme{
  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primaryLight,
    scaffoldBackgroundColor: AppColors.whiteBgColor,
    focusColor: AppColors.whiteColor,
    dividerColor: AppColors.greyColor,
    canvasColor: AppColors.blackColor,
    cardColor: AppColors.greyColor,
    textTheme: TextTheme(
        headlineLarge: AppStyles.bold20Black,
        bodyMedium: AppStyles.medium16Black,
        headlineMedium: AppStyles.medium16Primary,
        headlineSmall: AppStyles.medium16White,
        titleLarge: AppStyles.medium16Black,
        titleMedium: AppStyles.medium16Grey,
        displayLarge: AppStyles.bold16White,
        displayMedium: AppStyles.bold16Primary,
        titleSmall: AppStyles.medium16Black.copyWith(fontSize: 20),
    ),
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: AppColors.primaryLight
      ),
      backgroundColor: AppColors.primaryLight,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.only(
          bottomLeft: Radius.circular(35),
          bottomRight: Radius.circular(35)
        )
      )
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: AppColors.transparentColor,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          selectedItemColor: AppColors.whiteColor,
          unselectedItemColor: AppColors.whiteColor,
          showUnselectedLabels: true,
          selectedLabelStyle: AppStyles.bold12White,
          unselectedLabelStyle: AppStyles.bold12White
      ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.primaryLight,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: BorderSide(
            color: AppColors.whiteColor,
            width: 4,
          )),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
      primaryColor: AppColors.primaryDark,
      scaffoldBackgroundColor: AppColors.primaryDark,
      focusColor: AppColors.primaryLight,
      dividerColor: AppColors.whiteColor,
      canvasColor: AppColors.whiteColor,
      cardColor: AppColors.primaryLight,
    textTheme: TextTheme(
          headlineLarge: AppStyles.bold20White,
          bodyMedium: AppStyles.medium16White,
          headlineMedium: AppStyles.medium16White,
          headlineSmall: AppStyles.medium16White,
          titleLarge: AppStyles.medium16White,
          titleMedium: AppStyles.medium16White,
          displayLarge: AppStyles.bold16PrimaryDark,
          displayMedium: AppStyles.bold16Primary,
          titleSmall: AppStyles.medium20Primary,
      ),
      appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(
              color: AppColors.primaryLight
          ),
          backgroundColor: AppColors.primaryDark,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.only(
                  bottomLeft: Radius.circular(35),
                  bottomRight: Radius.circular(35)
              )
          )
    ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: AppColors.transparentColor,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          selectedItemColor: AppColors.whiteColor,
          unselectedItemColor: AppColors.whiteColor,
          showUnselectedLabels: true,
          selectedLabelStyle: AppStyles.bold12White,
          unselectedLabelStyle: AppStyles.bold12White
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
        side: BorderSide(
          color: AppColors.whiteColor,
          width: 4,
        )),
      ),
  );
}