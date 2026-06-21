import 'package:fin_sight/core/themes/app_colors.dart';
import 'package:fin_sight/features/home/presentation/getx/controllers/category_selected_controller.dart';
import 'package:fin_sight/features/home/presentation/widgets/category_item.dart';
import 'package:fin_sight/shared/domain/entities/category_type.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomRadioCategory extends StatelessWidget {
  const CustomRadioCategory({
    super.key,
    required this.onChanged,
    required this.items,
    this.size,
  });
  final ValueChanged<CategoryType> onChanged;
  final List<CategoryItem> items;
  final double? size;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        for (int i = 0; i < items.length; i++)
          Padding(
            padding: const .all(8.0),
            child: _RadioItemPaint(
              value: items[i].value,
              size: size ?? 100,
              onTap: () => onChanged(items[i].value),
              child: items[i],
            ),
          ),
      ],
    );
  }
}

class _RadioItemPaint extends StatelessWidget {
  const _RadioItemPaint({
    this.onTap,
    required this.value,
    required this.size,
    required this.child,
  });
  final void Function()? onTap;
  final CategoryType value;
  final double size;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: GetBuilder<CategorySelectedController>(
        builder: (controller) {
          final categoryName = controller.categoryName;
          return DefaultTextStyle(
            style: TextStyle(
              fontSize: 13.0,
              color: categoryName == value
                  ? Colors.white
                  : const Color.fromARGB(255, 46, 46, 46),
              fontWeight: .bold,
              letterSpacing: 2.0,
            ),
            child: IconTheme(
              data: IconThemeData(
                color: categoryName == value
                    ? Colors.white
                    : const Color.fromARGB(255, 46, 46, 46),
              ),
              child: Container(
                width: size,
                height: size,
                decoration: BoxDecoration(
                  color: categoryName == value
                      ? AppColors.primary
                      : Colors.white,
                  borderRadius: .all(.circular(16.0)),
                  boxShadow: [
                    categoryName == value
                        ? BoxShadow(
                            color: AppColors.beauVert,
                            offset: Offset(0, 4),
                            blurRadius: 5.0,
                            spreadRadius: 2.5,
                          )
                        : BoxShadow(color: Colors.white),
                  ],
                ),
                child: child,
              ),
            ),
          );
        },
      ),
    );
  }
}
