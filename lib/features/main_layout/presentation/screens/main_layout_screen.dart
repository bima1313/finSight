import 'package:fin_sight/core/themes/app_theme.dart';
import 'package:fin_sight/features/history/presentation/getx/mocks/bindings/history_binding_preview.dart';
import 'package:fin_sight/features/history/presentation/screens/history_screen.dart';
import 'package:fin_sight/features/home/presentation/getx/mocks/bindings/home_binding_preview.dart';
import 'package:fin_sight/features/home/presentation/screens/home_screen.dart';
import 'package:fin_sight/features/main_layout/presentation/getx/bindings/main_binding.dart';
import 'package:fin_sight/features/main_layout/presentation/getx/controllers/bottom_nav_controller.dart';
import 'package:fin_sight/features/main_layout/presentation/widgets/custom_navigation_bar.dart';
import 'package:fin_sight/features/main_layout/presentation/widgets/custom_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'package:get/get.dart';

class MainLayoutScreen extends GetView<BottomNavController> {
  const MainLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("FinSight")),
      body: GetBuilder<BottomNavController>(
        builder: (controller) {
          return IndexedStack(
            index: controller.currentIndex,
            children: [const HomeScreen(), const HistoryScreen()],
          );
        },
      ),
      bottomNavigationBar: CustomNavigationBar(
        selectediconColor: Colors.white,
        selectedlabelColor: Colors.white,
        destinations: const [
          CustomNavigationBarItem(icon: Icons.home, label: "Home"),
          CustomNavigationBarItem(icon: Icons.history, label: "history"),
        ],
        onTap: (value) {
          controller.navigationClick(selectedIndex: value);
        },
      ),
    );
  }
}

@Preview(size: Size(360, 800), name: "Main Layout Preview")
Widget mainLayoutPreview() {
  return GetMaterialApp(
    theme: AppTheme.lightTheme,
    getPages: [
      GetPage(
        name: "/",
        page: () => const MainLayoutScreen(),
        bindings: [
          MainBinding(),
          HomeBindingPreview(),
          HistoryBindingPreview(),
        ],
      ),
    ],
  );
}
