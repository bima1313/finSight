import 'package:fin_sight/features/history/domain/entities/history.dart';
import 'package:fin_sight/features/history/presentation/utils/month_parser.dart';

String changeRateCalculation({
  required Iterable<History> data,
  required int index,
}) {
  double changeRatePercentage = 0.0;
  final newData = data.elementAt(index);
  if (index < data.length - 1) {
    final oldData = data.elementAt(index + 1);
    final changeRate = (newData.total - oldData.total) / oldData.total;
    changeRatePercentage = changeRate * 100;

    return "${changeRatePercentage.toStringAsFixed(2)}% from ${oldData.month.addMMM}";
  }

  return "${changeRatePercentage.toStringAsFixed(2)}% from ${newData.month.addMMM}";
}
