import 'package:fin_sight/core/themes/app_theme.dart';
import 'package:fin_sight/features/history/presentation/getx/controllers/histories_data_controller.dart';
import 'package:fin_sight/features/history/presentation/getx/mocks/bindings/history_binding_preview.dart';
import 'package:fin_sight/features/history/presentation/utils/change_rate_calculation.dart';
import 'package:fin_sight/features/history/presentation/utils/month_parser.dart';
import 'package:fin_sight/features/history/presentation/widgets/chart.dart';
import 'package:fin_sight/features/history/presentation/widgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

class ChartDataWidget extends GetView<HistoriesDataController> {
  const ChartDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final NumberFormat currency = NumberFormat.currency(
      decimalDigits: 0,
      locale: "id_ID",
      symbol: "Rp.",
    );
    return controller.obx(
      onEmpty: const Center(
        child: Text(
          "At least 2 months of data are required to display the chart.",
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: .w600,
            color: Colors.black,
            letterSpacing: 0.8,
          ),
          textAlign: .center,
        ),
      ),
      onError: (error) => Center(
        child: Text(
          error!,
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: .w600,
            color: Colors.black,
            letterSpacing: 0.8,
          ),
        ),
      ),
      onLoading: const Center(child: CircularProgressIndicator()),
      (histories) {
        final historiesData = histories!;
        final historiesFromNew = historiesData.reversed;
        return Column(
          spacing: 16.0,
          crossAxisAlignment: .start,
          children: [
            Chart(
              title: "Spending Velocity",
              label: "Outflow",
              data: historiesData,
            ),
            Padding(
              padding: const .only(top: 24.0),
              child: Text(
                "Monthly Summaries",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Colors.black,
                  fontWeight: .bold,
                  letterSpacing: 1.5,
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: historiesFromNew.length,
              itemBuilder: (context, index) {
                final data = historiesFromNew.elementAt(index);
                final changeRate = changeRateCalculation(
                  data: historiesFromNew,
                  index: index,
                );
                return Padding(
                  padding: const .only(bottom: 16.0),
                  child: CustomCard(
                    title: data.month.addMMMM,
                    description: "${data.transactions} Transactions",
                    amount: currency.format(data.total),
                    changeRate: changeRate,
                  ),
                );
              },
            ),
          ],
        );
      },
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
          body: const SingleChildScrollView(
            child: Padding(padding: .all(8.0), child: ChartDataWidget()),
          ),
        ),
        binding: HistoryBindingPreview(),
      ),
    ],
  );
}
