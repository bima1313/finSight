import 'package:fin_sight/core/themes/app_colors.dart';
import 'package:fin_sight/features/home/presentation/getx/controllers/real_time_controller.dart';
import 'package:fin_sight/features/home/presentation/getx/mocks/bindings/home_binding_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'package:get/get.dart';

class TimeWidget extends GetView<RealTimeController> {
  const TimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RealTimeController>(
      builder: (controller) {
        return Column(
          crossAxisAlignment: .start,
          mainAxisSize: .min,
          children: [
            Text(
              controller.currentDate,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: AppColors.primary,
                fontWeight: .bold,
              ),
            ),
            Text(
              controller.currentTime,
              style: Theme.of(
                context,
              ).textTheme.displaySmall?.copyWith(color: Colors.black),
            ),
          ],
        );
      },
    );
  }
}

@Preview(group: "Home Screen", name: "Time Widget Preview")
Widget timeWidgetPreview() {
  return GetMaterialApp(
    getPages: [
      GetPage(
        name: "/",
        page: () => Container(
          width: 360,
          color: Colors.white,
          child: const TimeWidget(),
        ),
        binding: HomeBindingPreview(),
      ),
    ],
  );
}
