import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  bool _isDarkMode = false;

  ThemeData get theme => _isDarkMode ? darkTheme : lightTheme;

  bool get isDarkMode => _isDarkMode;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }

  static ThemeData lightTheme = ThemeData(
    // Define your light theme properties
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    // Add other theme properties as needed
  );

  static ThemeData darkTheme = ThemeData(
    // Define your dark theme properties
    brightness: Brightness.dark,
    primaryColor: Colors.teal,
    // Add other theme properties as needed
  );
}
