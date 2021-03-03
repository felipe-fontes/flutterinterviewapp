import 'package:flutter/material.dart';

class AppColors {
  static String _darkMode = 'dark';
  static String _lightMode = 'light';
  static String _selectedMode = _lightMode;
  static void setDarkMode(bool darkMode) {
    if (darkMode) {
      _selectedMode = _darkMode;
    } else {
      _selectedMode = _lightMode;
    }
  }

  static Color get companyColor => colorMap['companyColor-$_selectedMode'];
  static Color get background => colorMap['background-$_selectedMode'];
  static Color get companyColorSmoth =>
      colorMap['companyColorSmoth-$_selectedMode'];
  static Color get gradient1 => colorMap['gradient1-$_selectedMode'];
  static Color get gradient2 => colorMap['gradient2-$_selectedMode'];
  static Color get gradient3 => colorMap['gradient3-$_selectedMode'];
  static Color get gradient4 => colorMap['gradient4-$_selectedMode'];
  static Color get gradient5 => colorMap['gradient5-$_selectedMode'];
  static Color get gradient6 => colorMap['gradient6-$_selectedMode'];

  static Color _companyColor = Color.fromRGBO(132, 94, 194, 1);
  static Color _companyColorSmoth = Color.fromRGBO(132, 94, 194, 0.5);
  static Color _darkBackground = Color.fromRGBO(0, 0, 0, 1);
  static Color _lightBackground = Color.fromRGBO(255, 255, 255, 1);
  static Color _gradient1 = Color.fromRGBO(132, 94, 194, 1);
  static Color _gradient2 = Color.fromRGBO(214, 93, 177, 1);
  static Color _gradient3 = Color.fromRGBO(255, 111, 145, 1);
  static Color _gradient4 = Color.fromRGBO(255, 150, 113, 1);
  static Color _gradient5 = Color.fromRGBO(255, 199, 95, 1);
  static Color _gradient6 = Color.fromRGBO(249, 248, 113, 1);

  static Map<String, Color> colorMap = {
    'companyColor-dark': _companyColor,
    'companyColor-light': _companyColor,
    'background-dark': _darkBackground,
    'background-light': _lightBackground,
    'companyColorSmoth-light': _companyColorSmoth,
    'companyColorSmoth-dark': _companyColorSmoth,
    'gradient1-light': _gradient1,
    'gradient1-dark': _gradient1,
    'gradient2-light': _gradient2,
    'gradient2-dark': _gradient2,
    'gradient3-light': _gradient3,
    'gradient3-dark': _gradient3,
    'gradient4-light': _gradient4,
    'gradient4-dark': _gradient4,
    'gradient5-light': _gradient5,
    'gradient5-dark': _gradient5,
    'gradient6-light': _gradient6,
    'gradient6-dark': _gradient6,
  };
}
