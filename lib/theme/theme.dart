import 'package:flutter/material.dart';

class ThemeNotifier with ChangeNotifier {
  ThemeData _currentTheme;

  ThemeNotifier(this._currentTheme);

  ThemeData get currentTheme => _currentTheme;

  void setTheme(ThemeData theme) {
    _currentTheme = theme;
    notifyListeners();
  }
}

final ThemeData theme1 = ThemeData(
  colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: const Color(0xFFD36AE4),
      secondary: const Color(0x42E894BC),
      tertiary:
          const Color.fromARGB(255, 214, 113, 229) //Color para los botones
      ),
);
final ThemeData theme2 = ThemeData(
  colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: const Color.fromARGB(255, 228, 106, 204),
      secondary: const Color.fromARGB(66, 232, 148, 218),
      tertiary: const Color.fromARGB(255, 229, 113, 208)),
);
final ThemeData theme3 = ThemeData(
  colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: const Color.fromARGB(255, 212, 106, 228),
      secondary: const Color.fromARGB(66, 200, 148, 232),
      tertiary: const Color.fromARGB(255, 210, 113, 229)),
);
final ThemeData theme4 = ThemeData(
  colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: const Color.fromARGB(255, 106, 157, 228),
      secondary: const Color.fromARGB(66, 148, 229, 232),
      tertiary: const Color.fromARGB(255, 113, 184, 229)),
);
