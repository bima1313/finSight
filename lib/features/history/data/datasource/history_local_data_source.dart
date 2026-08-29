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
      final prepare = db.prepare('''
      SELECT sum(amount) AS amount, COUNT(strftime('%m', created_at)) AS transactions, 
      strftime('%m', created_at) AS month 
      FROM expense 
      WHERE strftime('%Y', created_at) = ? 
      GROUP BY month''');
      final data = prepare.select(['$year']);
      prepare.close();

      return data.map((json) => HistoryModel.fromJson(json)).toList();
    } catch (e) {
      throw DatabaseException(message: "can't fetch histories");
    }
  }

  @override
  Future<double> getTotal({required int year}) async {
    try {
      final db = await dbHelper.getDb();
      final prepare = db.prepare('''
      SELECT sum(amount) AS total 
      FROM expense 
      WHERE strftime('%Y', created_at) = ?
      ''');
      final data = prepare.select(['$year']);
      prepare.close();

      return (data.single['total'] as double);
    } catch (e) {
      throw DatabaseException(message: "can't fetch total");
    }
  }

  @override
  Future<List<int>> getYears() async {
    try {
      final db = await dbHelper.getDb();
      final data = db.select('''
      SELECT strftime('%Y',created_at) AS year 
      FROM expense 
      GROUP BY year
      ''');

      return data
          .map((element) => int.parse(element['year'] as String))
          .toList();
    } catch (e) {
      throw DatabaseException(message: "Can't fetch history years");
    }
  }
}
