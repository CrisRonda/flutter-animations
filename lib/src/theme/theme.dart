import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  bool _darkTheme = false;
  bool _customTheme = false;

  late ThemeData _currentTheme;

  bool get darkTheme => this._darkTheme;
  bool get customTheme => this._customTheme;
  ThemeData get currentTheme => this._currentTheme;

  ThemeChanger(int theme) {
    switch (theme) {
      case 1: // Light
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light();
        break;
      case 2: // Custom
        _darkTheme = false;
        _customTheme = true;
        _currentTheme = ThemeData.light();
        break;
      default: // Dark
        _darkTheme = true;
        _customTheme = false;
        _currentTheme = ThemeData.dark().copyWith(
            textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.white),
        ));
        break;
    }
  }

  set darkTheme(bool value) {
    this._darkTheme = value;
    this._customTheme = false;
    this._currentTheme = value ? ThemeData.dark() : ThemeData.light();
    notifyListeners();
  }

  set customTheme(bool value) {
    this._customTheme = value;
    this._darkTheme = false;
    this._currentTheme = value
        ? ThemeData.dark().copyWith(
            primaryColor: Colors.grey[300],
            scaffoldBackgroundColor: Color(0xff162647),
            cardColor: Color(0xff162647),
            textTheme: TextTheme(
              bodyText1: TextStyle(color: Colors.purpleAccent),
            ))
        : ThemeData.light();
    notifyListeners();
  }
}
