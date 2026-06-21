import 'dart:async';

import 'package:fin_sight/core/themes/app_theme.dart';
import 'package:fin_sight/features/splash/presentation/widgets/linear_loading_widget.dart';
import 'package:fin_sight/features/splash/presentation/widgets/splash_screen_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () => Get.offNamed('/'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Stack(
        children: [SplashScreenContent(), LinearLoadingWidget()],
      ),
    );
  }
}

PreviewThemeData lightTheme() =>
    PreviewThemeData(materialLight: AppTheme.lightTheme);
@Preview(size: Size(360, 800), name: "Splash Screen Preview", theme: lightTheme)
Widget splashScreenPreview() => const SplashScreen();
