import 'package:fin_sight/core/databases/sqlite.dart';
import 'package:fin_sight/core/errors/exceptions.dart';
import 'package:fin_sight/features/details/data/models/details_notes_model.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class DetailsNotesLocalDataSource {
  Future<List<DetailsNotesModel>> getDetailsNotes({required String dateTime});
}

class DetailsNotesLocalDataSourceImpl implements DetailsNotesLocalDataSource {
  final SQLite dbHelper;

  DetailsNotesLocalDataSourceImpl({required this.dbHelper});
  @override
  Future<List<DetailsNotesModel>> getDetailsNotes({
    required String dateTime,
  }) async {
    try {
      final db = await dbHelper.getDb();
      final prepare = db.prepare(
        '''SELECT sum(amount) AS amount, created_at, json_group_array(
        json_array(title, amount, category, created_at) 
        ORDER BY created_at DESC) AS notes
      FROM expense      
      WHERE strftime('%Y-%m', created_at) = ?
      GROUP BY strftime('%Y-%m-%d',created_at)
      ORDER BY created_at DESC
      ''',
      );
      final data = prepare.select([dateTime]);
      prepare.close();

      return data.map((json) => DetailsNotesModel.fromJson(json)).toList();
    } catch (e) {
      throw DatabaseException(message: "can't fetch notes");
    }
  }
}
