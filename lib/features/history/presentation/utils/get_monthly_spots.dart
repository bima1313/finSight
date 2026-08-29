import 'package:fin_sight/features/history/domain/entities/history.dart';
import 'package:fl_chart/fl_chart.dart';

List<FlSpot> getMonthlySpots({required List<History> data}) {
  final List<FlSpot> flSpots = [];
  int index = 0;
  for (var month = 1; month <= 12; month++) {
    if (index < data.length && data.elementAt(index).month == month) {
      flSpots.add(FlSpot(month.toDouble(), data.elementAt(index).total));
      index++;
    } else {
      flSpots.add(FlSpot(month.toDouble(), 0.0));
    }
  }
  return flSpots;
}
