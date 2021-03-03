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

  static Color get topGradient => colorMap['topGradient_$_selectedMode'];
  static Color get bottomGradient => colorMap['bottomGradient_$_selectedMode'];

  static Color _companyColor = Color.fromRGBO(111, 150, 126, 0.5);
  static Color _darkBackground = Color.fromRGBO(0, 0, 0, 1);
  static Color _lightBackground = Color.fromRGBO(255, 255, 255, 1);
  static Color _darkFont = Color.fromRGBO(238, 238, 238, 1);
  static Color _darkCardGhost = Color.fromRGBO(255, 255, 255, 0.15);
  static Color _lightCardGhost = Color.fromRGBO(0, 0, 0, 0.05);

  static Map<String, Color> colorMap = {
    'topGradient_dark': _companyColor,
    'topGradient_light': _companyColor,
    'bottomGradient_dark': _darkBackground,
    'bottomGradient_light': _lightBackground,
    'primaryButton_dark': _companyColor,
    'primaryButton_light': _companyColor,
    'text_light': _darkBackground,
    'text_dark': _companyColor,
    'subtext_dark': _darkFont,
    'subtext_light': _darkBackground,
    'textButton_dark': _darkBackground,
    'textButton_light': _lightBackground,
    'footerText_dark': _lightBackground,
    'footerText_light': _darkBackground,
    'link_dark': _companyColor,
    'link_light': _companyColor,
    'backgroundColor_dark': _darkBackground,
    'backgroundColor_light': _lightBackground,
    'registerColor_dark': _darkCardGhost,
    'registerColor_light': _lightCardGhost,
    'appBarColor_dark': _companyColor,
    'appBarColor_light': _darkBackground,
    'textRegister_light': _darkBackground,
    'textRegister_dark': _lightBackground,
    'conditionText_dark': _lightBackground,
    'conditionText_light': _darkBackground,
    'title_dark': _companyColor,
    'title_light': _companyColor,
    'themeColor_dark': _companyColor,
    'themeColor_light': _companyColor,
  };
}
