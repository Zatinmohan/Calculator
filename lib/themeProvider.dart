import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData dark;
  bool isDarkSelected;

  ThemeData _darkTheme = ThemeData(
      brightness: Brightness.dark,
      primaryColor: Color(0xFF060709),
      accentColor: Color(0xFF363E3C),
      //focusColor: Color(0xFFDFDFDE),
      textTheme: TextTheme(bodyText2: TextStyle(color: Colors.white)));

  ThemeData _lightTheme = ThemeData(
      brightness: Brightness.light,
      primaryColor: Color(0xFFffffff),
      accentColor: Color(0xFFDFDEDE),
      //focusColor: Colors.black,
      textTheme: TextTheme(
        bodyText2: TextStyle(color: Colors.black),
      ));

  ThemeProvider({bool isDarkMode}) {
    dark = isDarkMode ? _darkTheme : _lightTheme;
    isDarkSelected = isDarkMode ? true : false;
  }

  ThemeData getLight() {
    dark = _lightTheme;
    notifyListeners();
  }

  ThemeData getDark() {
    dark = _darkTheme;
    notifyListeners();
  }

  ThemeData get getTheme => dark;

  bool getStatus() => isDarkSelected;
}
