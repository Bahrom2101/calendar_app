import 'package:calendar/src/config/theme/app_colors.dart';
import 'package:flutter/material.dart';

abstract class AppThemes {
  AppThemes._();

  static final ThemeData light = ThemeData(
    primaryColor: AppColors.blue,
    scaffoldBackgroundColor: AppColors.backgroundLight,
    backgroundColor: AppColors.backgroundLight,
    fontFamily: 'RobotoMono',
    textTheme: const TextTheme(
      bodyText1: TextStyle(
        color: AppColors.black,
        fontWeight: FontWeight.w500,
        fontSize: 17,
      )
    ),
  );
}