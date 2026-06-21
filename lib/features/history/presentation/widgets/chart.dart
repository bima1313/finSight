import 'package:fin_sight/core/themes/app_colors.dart';
import 'package:fin_sight/core/themes/app_theme.dart';
import 'package:fin_sight/features/history/domain/entities/history.dart';
import 'package:fin_sight/features/history/presentation/utils/month_parser.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';

class Chart extends StatelessWidget {
  const Chart({
    super.key,
    required this.title,
    required this.label,
    required this.data,
  });
  final String title;
  final String label;
  final List<History> data;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 206, 206, 206),
        borderRadius: .all(.circular(16.0)),
      ),
      child: Padding(
        padding: const .all(16.0),
        child: Column(
          mainAxisSize: .min,
          spacing: 32.0,
          children: [
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.black,
                    fontWeight: .bold,
                    letterSpacing: 1.5,
                  ),
                ),
                Row(
                  spacing: 8.0,
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: AppColors.beauVert,
                        borderRadius: const .all(.circular(36.0)),
                      ),
                    ),
                    Text(
                      label,
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: Colors.black,
                        letterSpacing: 0.8,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 4,
              child: Padding(
                padding: const .symmetric(horizontal: 8.0),
                child: LineChart(
                  LineChartData(
                    borderData: FlBorderData(show: false),
                    gridData: const FlGridData(show: false),
                    titlesData: FlTitlesData(
                      topTitles: const AxisTitles(),
                      leftTitles: const AxisTitles(),
                      rightTitles: const AxisTitles(),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          interval: 3,
                          reservedSize: 46,
                          getTitlesWidget: (value, meta) {
                            return SideTitleWidget(
                              meta: meta,
                              child: Padding(
                                padding: const .only(top: 16.0),
                                child: Text(
                                  value.toInt().addMMM,
                                  style: Theme.of(context).textTheme.labelLarge
                                      ?.copyWith(
                                        color: const Color.fromARGB(
                                          255,
                                          34,
                                          34,
                                          34,
                                        ),
                                        fontWeight: .w600,
                                        letterSpacing: 1.0,
                                      ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    lineBarsData: [
                      LineChartBarData(
                        barWidth: 4.0,
                        dotData: const FlDotData(show: false),
                        isStrokeCapRound: true,
                        color: AppColors.beauVert,
                        isCurved: true,
                        preventCurveOverShooting: true,
                        belowBarData: BarAreaData(
                          show: true,
                          gradient: const LinearGradient(
                            begin: .topCenter,
                            end: .bottomCenter,
                            colors: [
                              Color.fromARGB(100, 23, 97, 97),
                              Color.fromARGB(255, 206, 206, 206),
                            ],
                          ),
                        ),
                        spots: data.map<FlSpot>((element) {
                          return FlSpot(
                            element.month.toDouble(),
                            element.total,
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ),
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
  List<History> previewData = [
    History(total: 1000, transactions: 3, month: 1),
    History(total: 100, transactions: 3, month: 2),
    History(total: 50000, transactions: 3, month: 3),
    History(total: 50000, transactions: 3, month: 4),
    History(total: 50100, transactions: 3, month: 5),
    History(total: 50, transactions: 3, month: 6),
    History(total: 1020, transactions: 3, month: 7),
    History(total: 6020, transactions: 3, month: 9),
    History(total: 1000, transactions: 3, month: 11),
  ];
  return Scaffold(
    appBar: AppBar(title: Text("Expense Tracker")),
    body: Chart(
      title: "Spending Velocity",
      label: "Outflow",
      data: previewData,
    ),
  );
}
