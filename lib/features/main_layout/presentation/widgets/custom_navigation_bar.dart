import 'package:fin_sight/core/themes/app_colors.dart';
import 'package:fin_sight/features/main_layout/presentation/getx/controllers/bottom_nav_controller.dart';
import 'package:fin_sight/features/main_layout/presentation/widgets/custom_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({
    super.key,
    required this.destinations,
    this.onTap,
    this.backgroundColor = Colors.white,
    this.indicatorColor,
    this.selectediconColor,
    this.unselectediconColor,
    this.selectedlabelColor,
    this.unselectedlabelColor,
  });
  final List<CustomNavigationBarItem> destinations;
  final ValueChanged<int>? onTap;
  final Color? backgroundColor;
  final Color? indicatorColor;
  final Color? selectediconColor;
  final Color? unselectediconColor;
  final Color? selectedlabelColor;
  final Color? unselectedlabelColor;

  VoidCallback _handleTap({required int index}) {
    return (onTap != null) ? () => onTap!(index) : () {};
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: const .directional(
          topStart: .circular(24.0),
          topEnd: .circular(24.0),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 3.0,
            color: const Color.fromARGB(255, 163, 163, 163),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 12.0),
        child: Row(
          children: [
            for (int i = 0; i < destinations.length; i++)
              Expanded(
                child: _SelectableNavigation(
                  indicatorColor: indicatorColor ?? AppColors.primary,
                  index: i,
                  onTap: _handleTap(index: i),
                  selectedIconColor: selectediconColor ?? Colors.black,
                  unselectedIconColor: unselectediconColor ?? Colors.black,
                  selectedLabelColor: selectedlabelColor ?? Colors.black,
                  unselectedLabelColor: unselectediconColor ?? Colors.black,
                  child: destinations[i],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _SelectableNavigation extends StatelessWidget {
  const _SelectableNavigation({
    required this.index,
    required this.child,
    required this.indicatorColor,
    required this.selectedIconColor,
    required this.unselectedIconColor,
    required this.selectedLabelColor,
    required this.unselectedLabelColor,
    this.onTap,
  });
  final int index;
  final void Function()? onTap;
  final Widget child;
  final Color indicatorColor;
  final Color selectedIconColor;
  final Color unselectedIconColor;
  final Color selectedLabelColor;
  final Color unselectedLabelColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const .symmetric(horizontal: 16.0),
        child: GetBuilder<BottomNavController>(
          builder: (controller) {
            final selected = controller.currentIndex == index;
            return Material(
              color: selected ? indicatorColor : Colors.transparent,
              borderRadius: const .all(.circular(16.0)),
              textStyle: TextStyle(
                fontWeight: .bold,
                fontSize: selected ? 14.0 : 10.0,
                color: selected ? selectedLabelColor : unselectedLabelColor,
              ),
              child: IconTheme(
                data: IconThemeData(
                  color: selected ? selectedIconColor : unselectedIconColor,
                ),
                child: child,
              ),
            );
          },
        ),
      ),
    );
  }
}
