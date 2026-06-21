import 'package:fin_sight/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

@immutable
abstract class AppTypography {
  const AppTypography();
  static final TextTheme _baseTextTheme = Typography.material2021().black;

  static TextTheme get textTheme {
    return _baseTextTheme
        .apply(fontFamily: "Manrope")
        .copyWith(
          bodyLarge: _baseTextTheme.bodyLarge?.copyWith(
            color: AppColors.neutral,
          ),
          bodyMedium: _baseTextTheme.bodyMedium?.copyWith(
            color: AppColors.neutral,
          ),
          bodySmall: _baseTextTheme.bodySmall?.copyWith(
            color: AppColors.neutral,
          ),
          labelLarge: _baseTextTheme.labelLarge?.copyWith(
            color: AppColors.neutral,
          ),
          labelMedium: _baseTextTheme.labelMedium?.copyWith(
            color: AppColors.neutral,
          ),
          labelSmall: _baseTextTheme.labelSmall?.copyWith(
            color: AppColors.neutral,
          ),
        );
  }
}
