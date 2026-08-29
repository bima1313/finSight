import 'package:fin_sight/core/constants/dummy_data.dart';
import 'package:fin_sight/core/errors/exceptions.dart';
import 'package:fin_sight/features/history/data/models/history_model.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class HistoryLocalDataSourcePreview {
  Future<List<HistoryModel>> getHistories({required int year});
  Future<double> getTotal({required int year});
  Future<List<int>> getYears();
}

class MockHistoryLocalDataSourceImplPreview
    implements HistoryLocalDataSourcePreview {
  const MockHistoryLocalDataSourceImplPreview();
  @override
  Future<List<HistoryModel>> getHistories({required int year}) async {
    await Future.delayed(const Duration(seconds: 2));
    try {
      final Map<String, Map<String, dynamic>> historyWrapper = {};

      for (var item in dummyData["data"]!) {
        final dateTime = DateTime.parse(item["created_at"].toString());
        if (dateTime.year != year) continue;

        final month = dateTime.month.toString();
        final amount = item["amount"] as num;

        // if historyWrapper is exist the data will update, if not do initialization
        historyWrapper.update(
          month,
          (existing) => {
            "amount": existing["amount"] + amount,
            "transactions": existing["transactions"] + 1,
            "month": month,
          },
          ifAbsent: () => {"amount": amount, "transactions": 1, "month": month},
        );
      }
      return historyWrapper.values
          .map((json) => HistoryModel.fromJson(json))
          .toList();
    } catch (e) {
      throw DatabaseException(message: "can't fetch histories");
    }
  }

  @override
  Future<double> getTotal({required int year}) async {
    await Future.delayed(const Duration(seconds: 2));
    try {
      final total = dummyData["data"]!.fold<double>(0.0, (sum, element) {
        final dateTime = DateTime.parse(element["created_at"] as String);
        if (dateTime.year == year) {
          return sum + (element["amount"] as num).toDouble();
        }

        return sum;
      });

      return total;
    } catch (e) {
      throw DatabaseException(message: "can't fetch total");
    }
  }

  @override
  Future<List<int>> getYears() async {
    await Future.delayed(const Duration(seconds: 2));
    try {
      return dummyData["data"]!
          .map((json) {
            final dateTime = DateTime.parse(json["created_at"] as String);
            return dateTime.year;
          })
          .toSet()
          .toList();
    } catch (e) {
      throw DatabaseException(message: "Can't fetch history years");
    }
  }
}
