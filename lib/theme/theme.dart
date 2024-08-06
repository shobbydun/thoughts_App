import 'package:flutter/material.dart';

//light mode
ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: Colors.grey.shade300,
    primary: Colors.grey.shade200,
    secondary: Colors.grey.shade400,
    inversePrimary: Colors.grey.shade800,
  )
);

//dark mode
ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: const Color.fromARGB(255, 16, 16, 16),
    primary: const Color.fromARGB(255, 50, 49, 49),
    secondary: const Color.fromARGB(255, 59, 58, 58),
    inversePrimary: Colors.grey.shade300,
  )
);


