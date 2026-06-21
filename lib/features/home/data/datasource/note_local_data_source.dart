import 'package:fin_sight/core/databases/sqlite.dart';
import 'package:fin_sight/core/errors/exceptions.dart';
import 'package:fin_sight/features/home/data/models/note_model.dart';
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
  Future<List<NoteModel>> getNotes() async {
    try {
      final db = await dbHelper.getDb();
      final datetimeNow = DateTime.now();

      final data = await db.query(
        'expense',
        columns: ['title', 'amount', 'category', 'created_at'],
        where: 'created_at LIKE ?',
        whereArgs: ['${datetimeNow.toDbDate()}%'],
        orderBy: 'created_at DESC',
      );
      return data.map((json) {
        /* 
        convert `created_at` from string into DateTime data type. In the result
        the data inserting into model including `created_at` DateTime type.
        */
        final copyData = Map<String, dynamic>.from(json);
        copyData.update(
          'created_at',
          (value) => DateTime.parse(value.toString()),
        );
        return NoteModel.fromJson(copyData);
      }).toList();
    } catch (e) {
      throw DatabaseException(message: "can't fetch notes");
    }
  }

  @override
  Future<void> createNote({required NoteModel note}) async {
    try {
      final db = await dbHelper.getDb();
      await db.insert("expense", note.toMap());
    } catch (e) {
      throw DatabaseException(message: "can't save note");
    }
  }
}
