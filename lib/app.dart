import 'package:fin_sight/core/themes/app_theme.dart';
import 'package:fin_sight/features/history/presentation/getx/bindings/history_binding.dart';
import 'package:fin_sight/features/home/presentation/getx/bindings/home_binding.dart';
import 'package:fin_sight/features/main_layout/presentation/getx/bindings/main_binding.dart';
import 'package:fin_sight/features/main_layout/presentation/screens/main_layout_screen.dart';
import 'package:fin_sight/features/splash/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'FinSight',
      theme: AppTheme.lightTheme,
      smartManagement: .keepFactory,
      initialRoute: '/splash-screen',
      transitionDuration: const Duration(seconds: 1),
      defaultTransition: .fade,
      getPages: [
        GetPage(
          name: '/',
          page: () => const MainLayoutScreen(),
          bindings: [MainBinding(), HomeBinding(), HistoryBinding()],
        ),
        GetPage(name: '/splash-screen', page: () => const SplashScreen()),
      ],
    );
  }
}
