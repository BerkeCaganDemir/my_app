import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get dark => ThemeData(
    scaffoldBackgroundColor: const Color(0xFF1F1D2B), // 👈 tek arka plan rengi
    fontFamily: 'Roboto',
    useMaterial3: true,
    colorScheme: ColorScheme.dark(
      background: const Color(0xFF1F1D2B),
      surface: const Color(0xFF1F1D2B),
      primary: Colors.white,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white70),
    ),
  );
}
