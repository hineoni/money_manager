import 'package:flutter/material.dart';

class AppThemeData {
  final Color primaryColor; 
  final Color backgroundColor;
  final Color textColor; 
  final Color selectedButtonColor; 
  final Color selectedTextColor;  
  final Brightness brightness;

  final String homeIcon;
  final String plusIcon;
  final String minusIcon;
  final String settingsIcon;


  AppThemeData({
    required this.primaryColor,
    required this.backgroundColor,
    required this.textColor,
    required this.selectedButtonColor,
    required this.selectedTextColor,
    required this.homeIcon,
    required this.plusIcon,
    required this.minusIcon,
    required this.settingsIcon,
    required this.brightness,
  });
}
