import 'package:flutter/material.dart';
import '../models/app_theme.dart';
import '../models/app_theme_data.dart';
import '../models/app_theme_list.dart';
import '../models/app_language.dart';
import '../models/localization.dart';

class SettingsViewModel extends ChangeNotifier {
  AppTheme theme = AppTheme.Dark;
  AppLanguage language = AppLanguage.Russian;

  void setTheme(AppTheme newTheme) {
    theme = newTheme;
    notifyListeners();
  }

  void setLanguage(AppLanguage newLanguage) {
    language = newLanguage;
    notifyListeners();
  }

  AppThemeData get themeData => appThemes[theme]!;

  String getText(String key) {
    return appTexts[key]?[language] ?? key;
  }
}
