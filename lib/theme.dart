import 'package:flutter/material.dart';

ThemeData lightthemef() {
  return ThemeData(
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color.fromARGB(76, 59, 2, 145)),
    primarySwatch: Colors.indigo,
    scaffoldBackgroundColor: const Color.fromARGB(14, 4, 1, 44),
    backgroundColor: Colors.red,
    // cardColor: Color.fromARGB(215, 229, 171, 239).withOpacity(0.4),
    colorScheme: const ColorScheme.light(
        background: Color.fromARGB(190, 176, 134, 255),
        primaryContainer: Color.fromARGB(191, 248, 247, 250)),
  );
}

ThemeData darkthemef() {
  return ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.cyan,
    appBarTheme: const AppBarTheme(
      color: Color.fromARGB(255, 0, 159, 135),
    ),
    colorScheme: const ColorScheme.dark(
        background: Color.fromARGB(216, 3, 137, 117),
        primaryContainer: Color.fromARGB(142, 0, 0, 0)),
  );
}
