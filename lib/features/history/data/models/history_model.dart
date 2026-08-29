import 'package:fin_sight/features/history/domain/entities/history.dart';

class HistoryModel extends History {
  const HistoryModel({
    required super.total,
    required super.transactions,
    required super.month,
  });

  factory HistoryModel.fromJson(Map<String, dynamic> json) {
    return HistoryModel(
      total: json["amount"],
      transactions: json["transactions"],
      month: int.parse(json["month"]),
    );
  }
}
