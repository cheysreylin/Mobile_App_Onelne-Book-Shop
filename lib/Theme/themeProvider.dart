import 'package:flutter/material.dart';

class Themes {
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey[100],
    colorScheme:
        const ColorScheme.light().copyWith(secondary: Colors.grey[300]),
    fontFamily: 'Roboto',
  );
  static final datkTheme = ThemeData(
    scaffoldBackgroundColor: Color.fromARGB(255, 18, 18, 18),
    colorScheme: const ColorScheme.dark().copyWith(secondary: Colors.black38),
    fontFamily: 'Roboto',
  );

  static of(BuildContext context) {}
}
