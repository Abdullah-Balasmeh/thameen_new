import 'package:flutter/material.dart';
import 'package:thameen/core/theme/app_colors.dart';
import 'package:thameen/core/theme/app_text_style.dart';

class AppTheme {
  /// LIGHT THEME
  static ThemeData light(bool isArabic) {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.lightBackground,

      fontFamily: isArabic ? 'Tajawal' : 'Poppins',

      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        surface: AppColors.lightSurface,
        error: AppColors.error,
      ),

      textTheme: TextTheme(
        titleLarge: AppTextStyle.bold24.copyWith(
          color: AppColors.lightTextPrimary,
        ),

        titleMedium: AppTextStyle.bold20.copyWith(
          color: AppColors.lightTextPrimary,
        ),
        titleSmall: AppTextStyle.semiBold18.copyWith(
          color: AppColors.lightTextPrimary,
        ),
        bodyLarge: AppTextStyle.medium16.copyWith(
          color: AppColors.lightTextPrimary,
        ),

        bodyMedium: AppTextStyle.medium14.copyWith(
          color: AppColors.lightTextPrimary,
        ),

        bodySmall: AppTextStyle.medium12.copyWith(
          color: AppColors.lightTextSecondary,
        ),
        labelLarge: AppTextStyle.regular16.copyWith(color: AppColors.secondary),
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.lightSurface,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),

        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.lightBorder),
          borderRadius: BorderRadius.circular(12),
        ),

        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.primary),
          borderRadius: BorderRadius.circular(12),
        ),

        hintStyle: TextStyle(
          color: AppColors.lightTextSecondary,
          fontFamily: isArabic ? 'Tajawal' : 'Poppins',
        ),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          textStyle: AppTextStyle.medium16,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(vertical: 14),
        ),
      ),

      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.lightSurface,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.lightTextSecondary,
        selectedLabelStyle: AppTextStyle.medium12,
        unselectedLabelStyle: AppTextStyle.medium12,
      ),
    );
  }

  /// DARK THEME
  static ThemeData dark(bool isArabic) {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.darkBackground,

      fontFamily: isArabic ? 'Tajawal' : 'Poppins',

      colorScheme: const ColorScheme.dark(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        surface: AppColors.darkSurface,
        error: AppColors.errorDark,
      ),

      textTheme: TextTheme(
        titleLarge: AppTextStyle.bold24.copyWith(
          color: AppColors.darkTextPrimary,
        ),

        titleMedium: AppTextStyle.bold20.copyWith(
          color: AppColors.darkTextPrimary,
        ),
        titleSmall: AppTextStyle.semiBold18.copyWith(
          color: AppColors.darkTextPrimary,
        ),
        bodyLarge: AppTextStyle.medium16.copyWith(
          color: AppColors.darkTextPrimary,
        ),

        bodyMedium: AppTextStyle.medium14.copyWith(
          color: AppColors.darkTextPrimary,
        ),

        bodySmall: AppTextStyle.medium12.copyWith(
          color: AppColors.darkTextSecondary,
        ),
        labelLarge: AppTextStyle.regular16.copyWith(color: AppColors.secondary),
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.darkSurface,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),

        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.darkSurfaceElevated),
          borderRadius: BorderRadius.circular(12),
        ),

        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.primary),
          borderRadius: BorderRadius.circular(12),
        ),

        hintStyle: TextStyle(
          color: AppColors.darkTextSecondary,
          fontFamily: isArabic ? 'Tajawal' : 'Poppins',
        ),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          textStyle: AppTextStyle.medium16,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(vertical: 14),
        ),
      ),

      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.darkSurface,
        selectedItemColor: AppColors.gold,
        unselectedItemColor: AppColors.darkTextSecondary,
        selectedLabelStyle: AppTextStyle.medium12,
        unselectedLabelStyle: AppTextStyle.medium12,
      ),
    );
  }
}
