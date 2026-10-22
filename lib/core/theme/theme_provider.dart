import 'package:flutter/material.dart';

class ThemeNotifier extends ValueNotifier<ThemeMode> {
  ThemeNotifier([super.mode = ThemeMode.dark]);

  void toggleTheme() {
    value = value == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
  }

  void setThemeMode(ThemeMode mode) {
    value = mode;
  }

  bool get isDarkMode => value == ThemeMode.dark;
}

final themeNotifier = ThemeNotifier(ThemeMode.dark);
