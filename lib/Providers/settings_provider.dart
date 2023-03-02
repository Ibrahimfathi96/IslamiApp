import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier {
  ThemeMode currentTheme = ThemeMode.dark;
  String currentLang = 'ar';

  void getLang(String newLocale) {
    currentLang = newLocale;
    notifyListeners();
  }

  //observable pattern
  void changeTheme(ThemeMode newMode) {
    currentTheme = newMode;
    notifyListeners();
  }

  String getMainBackGroudImage() {
    return currentTheme == ThemeMode.light
        ? 'assets/images/bg3.png'
        : 'assets/images/bg_dark.png';
  }

  bool isDarkMode() {
    return currentTheme == ThemeMode.dark;
  }
}
