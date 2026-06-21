import 'package:fin_sight/core/themes/app_colors.dart';
import 'package:fin_sight/shared/domain/entities/category_type.dart';
import 'package:flutter/material.dart';

extension CategoryUiMapper on CategoryType {
  IconData get icon {
    switch (this) {
      case .dining:
        return Icons.restaurant;
      case .drink:
        return Icons.coffee;
      case .snack:
        return Icons.fastfood_rounded;
      case .transport:
        return Icons.commute;
      case .shopping:
        return Icons.shopping_bag;
      case .other:
        return Icons.more_horiz;
    }
  }

  Color get color {
    switch (this) {
      case .dining:
        return AppColors.beauVert;
      case .drink:
        return AppColors.slateBlue;
      case .snack:
        return AppColors.cloudedPine;
      case .transport:
        return AppColors.tertiary;
      case .shopping:
        return AppColors.purpleBlue;
      case .other:
        return AppColors.slateGrey;
    }
  }
}
