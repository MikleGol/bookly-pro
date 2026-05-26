import 'package:flutter/material.dart';

import 'bookly_colors.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData get light {
    final colorScheme = ColorScheme(
      brightness: Brightness.light,
      primary: BooklyColors.primary400,
      onPrimary: BooklyColors.primary200,
      secondary: BooklyColors.secondary400,
      onSecondary: BooklyColors.neutral900,
      error: BooklyColors.error,
      onError: Colors.white,
      surface: BooklyColors.primary100,
      onSurface: BooklyColors.neutral900,
    );

    final baseTextTheme = ThemeData.light().textTheme;

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: BooklyColors.primary100,
      appBarTheme: AppBarTheme(
        backgroundColor: BooklyColors.primary100,
        foregroundColor: BooklyColors.neutral900,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: BooklyColors.neutral900,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      textTheme: baseTextTheme.copyWith(
        titleLarge: TextStyle(
          color: BooklyColors.neutral900,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
        titleMedium: TextStyle(
          color: BooklyColors.neutral900,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        titleSmall: TextStyle(
          color: BooklyColors.neutral900,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        bodyMedium: TextStyle(color: BooklyColors.neutral900, fontSize: 14),
        bodySmall: TextStyle(color: BooklyColors.neutral500, fontSize: 12),
        labelLarge: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: BooklyColors.primary200,
          backgroundColor: BooklyColors.primary400,
          overlayColor: BooklyColors.primary500,
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: BooklyColors.primary400,
          side: BorderSide(color: BooklyColors.primary400),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: BooklyColors.primary400,
          overlayColor: BooklyColors.primary400.withValues(alpha: 0.12),
          textStyle: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: BooklyColors.neutral100,
        hintStyle: TextStyle(color: BooklyColors.neutral400, fontSize: 14),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        enabledBorder: _inputBorder(BooklyColors.neutral200, 1),
        focusedBorder: _inputBorder(BooklyColors.primary400, 1.4),
        errorBorder: _inputBorder(BooklyColors.error, 1),
        focusedErrorBorder: _inputBorder(BooklyColors.error, 1.4),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: BooklyColors.primary200,
        elevation: 1,
        indicatorColor: BooklyColors.primary400.withValues(alpha: 0.2),
        overlayColor: WidgetStatePropertyAll(
          BooklyColors.primary100.withValues(alpha: 0.2),
        ),
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return TextStyle(
              color: BooklyColors.primary400,
              fontWeight: FontWeight.w600,
            );
          }

          return TextStyle(
            color: BooklyColors.neutral400,
            fontWeight: FontWeight.w500,
          );
        }),
        iconTheme: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return IconThemeData(color: BooklyColors.primary400);
          }

          return IconThemeData(color: BooklyColors.neutral400);
        }),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: BooklyColors.primary100,
        selectedColor: BooklyColors.primary400,
        labelStyle: TextStyle(
          color: BooklyColors.neutral700,
          fontSize: 13,
          fontWeight: FontWeight.w700,
        ),
        shape: StadiumBorder(side: BorderSide(color: BooklyColors.primary200)),
      ),
    );
  }

  static OutlineInputBorder _inputBorder(Color color, double width) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: color, width: width),
    );
  }
}
