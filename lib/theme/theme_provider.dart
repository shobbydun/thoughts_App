import 'package:flutter/material.dart';
import 'package:notes_app_modes/theme/theme.dart';

class ThemeProvider with ChangeNotifier{

  //initially theme is light mode
  ThemeData _themeData = lightMode;

  //getter method to access the theme from other parts of code
  ThemeData get themeData => _themeData;

  //getter method to see if we on dark mode or not
  bool get isDarkMode => _themeData == darkMode;

  //setter method to set new theme
  set themeData (ThemeData themeData){
    _themeData = themeData;
    notifyListeners();
  }

  //we eill use this t toglle in a switch laer
  void toggleTheme(){
    if(_themeData == lightMode){
      themeData = darkMode;
    }else{
      themeData = lightMode;
    }
  }
}