import 'package:fin_sight/core/databases/sqlite.dart';
import 'package:fin_sight/core/errors/exceptions.dart';
import 'package:fin_sight/shared/data/models/note_model.dart';
import 'package:fin_sight/shared/utils/datetime_parser.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class NoteLocalDataSource {
  Future<List<NoteModel>> getNotes();
  Future<void> createNote({required NoteModel note});
}

class NoteLocalDataSourceImpl implements NoteLocalDataSource {
  final SQLite dbHelper;
  const NoteLocalDataSourceImpl({required this.dbHelper});
  @override
  Future<List<NoteModel>> getNotes({DateTime? datetime}) async {
    try {
      final db = await dbHelper.getDb();
      final datetimeNow = datetime ?? DateTime.now();
      final prepare = db.prepare('''
      SELECT title, amount, category, created_at 
      FROM expense 
      WHERE created_at LIKE ? 
      ORDER BY created_at DESC''');
      final data = prepare.select(['${datetimeNow.toDbDate()}%']);
      prepare.close();

      return data.map((json) => NoteModel.fromJson(json)).toList();
    } catch (e) {
      throw DatabaseException(message: "can't fetch notes");
    }
  }

  @override
  Future<void> createNote({required NoteModel note}) async {
    try {
      final db = await dbHelper.getDb();
      final prepare = db.prepare(
        '''INSERT INTO expense (title, amount, category, created_at) 
        VALUES (:title,:amount,:category,:created_at)''',
      );
      prepare.executeWith(note.toMap().toStatementParameters());
      prepare.close();
    } catch (e) {
      throw DatabaseException(message: "can't save note");
    }
  }
}
