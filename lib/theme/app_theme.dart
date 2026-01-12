import 'package:flutter/material.dart';

/// Application theme configuration with emerald/green color scheme.
class AppTheme {
  static const Color primaryColor = Color(0xFF059669);
  static const Color accentColor = Color(0xFF10B981);
  static const Color darkColor = Color(0xFF1F2937);
  static const Color lightGray = Color(0xFFF9FAFB);

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        brightness: Brightness.light,
      ).copyWith(secondary: accentColor),
      fontFamily: 'Roboto',
      appBarTheme: const AppBarTheme(
        centerTitle: false,
        elevation: 0,
        scrolledUnderElevation: 4,
        backgroundColor: Colors.white,
        foregroundColor: darkColor,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          side: const BorderSide(width: 2),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        color: Colors.white,
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: lightGray,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 18,
        ),
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 56,
          fontWeight: FontWeight.w800,
          letterSpacing: -1,
          height: 1.1,
        ),
        displayMedium: TextStyle(
          fontSize: 44,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.5,
          height: 1.2,
        ),
        displaySmall: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.w700,
          height: 1.2,
        ),
        headlineMedium: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w600,
          height: 1.3,
        ),
        headlineSmall: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w500,
          height: 1.4,
        ),
        titleLarge: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          height: 1.4,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          height: 1.7,
          color: Color(0xFF6B7280),
        ),
        bodyMedium: TextStyle(fontSize: 14, height: 1.6),
      ),
    );
  }
}
