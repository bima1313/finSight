import 'package:fin_sight/core/themes/app_colors.dart';
import 'package:fin_sight/features/splash/presentation/utils/degrees_to_radians.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';

class SplashScreenContent extends StatelessWidget {
  const SplashScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: .center,
        children: [
          Image.asset(
            "assets/images/fin-sight.png",
            width: 160.0,
            height: 160.0,
          ),
          ShaderMask(
            shaderCallback: (bounds) {
              return LinearGradient(
                transform: GradientRotation(degreesToRadians(degree: 60.0)),
                colors: const [Color(0xFF023c86), Color(0xFF0bb092)],
              ).createShader(bounds);
            },
            child: Text(
              'FinSight',
              style: TextStyle(fontSize: 40.0, fontWeight: .w800),
            ),
          ),
          Text(
            'Visualize Your Financial Journey',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: .w500,
              color: AppColors.neutral,
            ),
          ),
        ],
      ),
    );
  }
}

@Preview(name: "Splash Screen Content Widget Preview")
Widget splashScreenContentWidgetPreview() => Container(
  width: 100,
  height: 100,
  color: Colors.white,
  child: const Center(child: SplashScreenContent()),
);
