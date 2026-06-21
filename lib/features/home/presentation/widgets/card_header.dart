import 'package:fin_sight/core/themes/app_colors.dart';
import 'package:fin_sight/core/themes/app_theme.dart';
import 'package:fin_sight/features/home/presentation/getx/controllers/get_notes_controller.dart';
import 'package:fin_sight/features/home/presentation/getx/mocks/bindings/home_binding_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CardHeader extends GetView<GetNotesController> {
  const CardHeader({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    final NumberFormat currency = NumberFormat.currency(
      decimalDigits: 0,
      locale: "id_ID",
      symbol: "Rp.",
    );
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Card(
        color: AppColors.primary,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: .start,
            mainAxisSize: .min,
            children: [
              Text(
                title.toUpperCase(),
                style: DefaultTextStyle.of(context).style.copyWith(
                  color: Colors.white,
                  fontWeight: .bold,
                  letterSpacing: 1.0,
                ),
              ),
              Obx(() {
                return Text(
                  currency.format(controller.totalAmount),
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontSize: 19.0,
                    color: Colors.white,
                    fontWeight: .bold,
                    letterSpacing: 0.8,
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

PreviewThemeData lightTheme() =>
    PreviewThemeData(materialLight: AppTheme.lightTheme);
@Preview(name: "Card Header Widget", theme: lightTheme)
Widget previewCardHeaderWidget() {
  return GetMaterialApp(
    theme: AppTheme.lightTheme,
    getPages: [
      GetPage(
        name: '/',
        page: () => const CardHeader(title: "Today's Outflow"),
        binding: HomeBindingPreview(),
      ),
    ],
  );
}
