import 'package:fin_sight/core/themes/app_colors.dart';
import 'package:fin_sight/core/themes/app_typography.dart';
import 'package:flutter/material.dart';

@immutable
abstract class AppTheme {
  const AppTheme();

  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      textTheme: AppTypography.textTheme,
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.windChime,
      appBarTheme: AppBarThemeData(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        titleTextStyle: AppTypography.textTheme.titleLarge?.copyWith(
          color: AppColors.primary,
          fontWeight: .bold,
        ),
        iconTheme: IconThemeData(color: AppColors.primary),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: AppColors.primary,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primary,
          textStyle: AppTypography.textTheme.labelLarge?.copyWith(
            fontWeight: .bold,
          ),
        ),
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: AppColors.primary,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          shape: .all(
            RoundedRectangleBorder(borderRadius: .all(.circular(16.0))),
          ),
          textStyle: .all(
            const TextStyle(
              fontSize: 14.0,
              fontWeight: .bold,
              letterSpacing: 1.5,
            ),
          ),
          backgroundColor: .all(AppColors.primary),
          foregroundColor: .all(Colors.white),
        ),
      ),
    );
  }
}
