import 'package:flutter/material.dart';
import 'app_theme_data.dart';
import 'app_theme.dart';

final Map<AppTheme, AppThemeData> appThemes = {
  AppTheme.Dark: AppThemeData(
    primaryColor: Colors.black,
    backgroundColor: Colors.black,
    textColor: Colors.white,
    selectedButtonColor: Colors.white24,
    selectedTextColor: Colors.white,
    homeIcon: 'assets/icons/home_dark.png',
    plusIcon: 'assets/icons/plus_dark.png',
    minusIcon: 'assets/icons/minus_dark.png',
    settingsIcon: 'assets/icons/settings_dark.png',
    brightness: Brightness.dark,
  ),
  AppTheme.Light: AppThemeData(
    primaryColor: Colors.white,
    backgroundColor: Colors.white,
    textColor: Colors.black,
    selectedButtonColor: Colors.grey[300]!,
    selectedTextColor: Colors.black,
    homeIcon: 'assets/icons/home_light.png',
    plusIcon: 'assets/icons/plus_light.png',
    minusIcon: 'assets/icons/minus_light.png',
    settingsIcon: 'assets/icons/settings_light.png',
    brightness: Brightness.light,
  ),
  AppTheme.Pink: AppThemeData(
    primaryColor: Colors.pink,
    backgroundColor: Colors.pink[50]!,
    textColor: Colors.white,
    selectedButtonColor: Colors.pinkAccent,
    selectedTextColor: Colors.white,
    homeIcon: 'assets/icons/home_pink.png',
    plusIcon: 'assets/icons/plus_pink.png',
    minusIcon: 'assets/icons/minus_pink.png',
    settingsIcon: 'assets/icons/settings_pink.png',
    brightness: Brightness.light,
  ),
};
