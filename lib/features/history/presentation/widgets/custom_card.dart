import 'package:fin_sight/core/themes/app_colors.dart';
import 'package:fin_sight/core/themes/app_theme.dart';
import 'package:fin_sight/features/history/presentation/utils/change_rate_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'package:intl/intl.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.title,
    required this.description,
    required this.amount,
    required this.changeRate,
  });
  final String title;
  final String description;
  final String amount;
  final String changeRate;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const .all(16.0),
        child: Column(
          crossAxisAlignment: .start,
          mainAxisSize: .min,
          children: [
            Row(
              spacing: 24.0,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 218, 217, 217),
                    borderRadius: .all(.circular(32.0)),
                  ),
                  child: Padding(
                    padding: const .all(10.0),
                    child: const Center(
                      child: Icon(
                        Icons.calendar_month,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(
                            fontSize: 22.0,
                            color: Colors.black,
                            fontWeight: .bold,
                          ),
                    ),
                    Text(description),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const .only(top: 16.0),
              child: Text(
                amount,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Colors.black,
                  fontWeight: .bold,
                ),
              ),
            ),
            Row(
              spacing: 8.0,
              children: [
                changeRate.setChangeRateIcon,
                // changeRate.contains("-")
                //     ? const Icon(Icons.trending_down, color: Colors.red)
                //     : const Icon(Icons.trending_up, color: Colors.green),
                Text(changeRate),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

PreviewThemeData lightTheme() =>
    PreviewThemeData(materialLight: AppTheme.lightTheme);
@Preview(size: Size(360, 800), name: "Chart Widget Preview", theme: lightTheme)
Widget chartWidgetPreview() {
  final currency = NumberFormat.currency(symbol: "\$");
  return Scaffold(
    appBar: AppBar(title: Text("Expense Tracker")),
    body: CustomCard(
      title: "December",
      description: "142 Transactions",
      amount: currency.format(8120),
      changeRate: "-4.2% from Nov",
    ),
  );
}
