import 'package:fin_sight/core/databases/sqlite.dart';
import 'package:fin_sight/core/errors/exceptions.dart';
import 'package:fin_sight/features/history/data/models/history_model.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class HistoryLocalDataSource {
  Future<List<int>> getYears();
  Future<double> getTotal({required int year});
  Future<List<HistoryModel>> getHistories({required int year});
}

class HistoryLocalDataSourceImpl implements HistoryLocalDataSource {
  final SQLite dbHelper;

  const HistoryLocalDataSourceImpl({required this.dbHelper});
  @override
  Future<List<HistoryModel>> getHistories({required int year}) async {
    try {
      final db = await dbHelper.getDb();
      final data = await db.query(
        'expense',
        columns: [
          "sum(amount) as amount",
          "COUNT(strftime('%m', created_at)) as transactions",
          "strftime('%m', created_at) as month",
        ],
        where: "strftime('%Y', created_at) = ?",
        whereArgs: ['$year'],
        groupBy: "month",
      );

      return data.map((json) {
        /*
        convert `month` from String into integer data type.
        */
        final copyData = Map<String, dynamic>.from(json);
        copyData.update("month", (value) => int.parse(value.toString()));

        return HistoryModel.fromJson(copyData);
      }).toList();
    } catch (e) {
      throw DatabaseException(message: "can't fetch histories");
    }
  }

  @override
  Future<double> getTotal({required int year}) async {
    try {
      final db = await dbHelper.getDb();

      final data = await db.query(
        'expense',
        columns: ['sum(amount) AS total'],
        where: "strftime('%Y', created_at) = ?",
        whereArgs: ['$year'],
      );

      return (data.single['total'] as double);
    } catch (e) {
      throw DatabaseException(message: "can't fetch total");
    }
  }

  @override
  Future<List<int>> getYears() async {
    try {
      final db = await dbHelper.getDb();
      final data = await db.query(
        'expense',
        columns: ["strftime('%Y',created_at) as year"],
        groupBy: "year",
      );

      return data
          .map((element) => int.parse(element['year'] as String))
          .toList();
    } catch (e) {
      throw DatabaseException(message: "Can't fetch history years");
    }
  }
}
