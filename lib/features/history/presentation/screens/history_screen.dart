import 'package:fin_sight/core/themes/app_theme.dart';
import 'package:fin_sight/features/history/presentation/getx/controllers/get_total_controller.dart';
import 'package:fin_sight/features/history/presentation/getx/mocks/bindings/history_binding_preview.dart';
import 'package:fin_sight/features/history/presentation/widgets/chart_data_widget.dart';
import 'package:fin_sight/features/history/presentation/widgets/custom_dropdown_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HistoryScreen extends GetView<GetTotalController> {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NumberFormat currency = NumberFormat.currency(
      decimalDigits: 0,
      locale: "id_ID",
      symbol: "Rp.",
    );
    return SingleChildScrollView(
      child: Padding(
        padding: const .all(16.0),
        child: Column(
          spacing: 16.0,
          crossAxisAlignment: .start,
          children: [
            const Row(
              spacing: 16.0,
              children: [Text("ANNUAL OVERVIEW"), CustomDropdownMenu()],
            ),
            Obx(() {
              return Text(
                currency.format(controller.total),
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  color: Colors.black,
                  fontWeight: .bold,
                ),
              );
            }),
            Text(
              "Your total expenditure this year. A comprehensive look at the structural flow of your capital across all monitored channels.",
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: Colors.black),
            ),
            const ChartDataWidget(),
          ],
        ),
      ),
    );
  }
}

PreviewThemeData lightTheme() =>
    PreviewThemeData(materialLight: AppTheme.lightTheme);
@Preview(
  size: Size(360, 800),
  name: "History Screen Preview",
  theme: lightTheme,
)
Widget histroyScreenPreview() {
  return GetMaterialApp(
    theme: AppTheme.lightTheme,
    getPages: [
      GetPage(
        name: "/",
        page: () => Scaffold(
          appBar: AppBar(title: const Text("Expense Tracker")),
          body: const HistoryScreen(),
        ),
        binding: HistoryBindingPreview(),
      ),
    ],
  );
}
