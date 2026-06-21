import 'package:fin_sight/core/themes/app_theme.dart';
import 'package:fin_sight/features/home/presentation/utils/category_ui_mapper.dart';
import 'package:fin_sight/shared/domain/entities/category_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.value});
  final CategoryType value;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8.0,
      mainAxisAlignment: .center,
      children: [Icon(value.icon), Text(value.name)],
    );
  }
}

PreviewThemeData lightTheme() =>
    PreviewThemeData(materialLight: AppTheme.lightTheme);
@Preview(name: "Category Item Widget Preview", theme: lightTheme)
Widget modalBottomWidgetPreview() {
  return Scaffold(
    body: Center(child: CategoryItem(value: CategoryType.dining)),
  );
}
