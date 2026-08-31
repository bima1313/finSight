import 'package:fin_sight/core/databases/sqlite.dart';
import 'package:fin_sight/features/details/data/datasource/details_notes_local_data_source.dart';
import 'package:fin_sight/features/details/data/models/details_notes_model.dart';
import 'package:fin_sight/features/home/data/datasource/note_local_data_source.dart';
import 'package:fin_sight/shared/data/models/note_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqlite3/sqlite3.dart';

void main() {
  late SQLite db;
  late DetailsNotesLocalDataSource detailsNotesLocalDataSource;
  late NoteLocalDataSourceImpl noteLocalDataSource;
  setUp(() async {
    db = SQLite(overrideDb: sqlite3.openInMemory());
    detailsNotesLocalDataSource = DetailsNotesLocalDataSourceImpl(dbHelper: db);
    noteLocalDataSource = NoteLocalDataSourceImpl(dbHelper: db);
  });
  tearDown(() async => await db.closeDb());
  test("get details notes success", () async {
    final insertData = NoteModel(
      title: "testing",
      category: "test",
      amount: 1.0,
      dateTime: DateTime(2025, 10, 12, 09, 30, 12),
    );
    final insertData2 = NoteModel(
      title: "testing2",
      category: "test",
      amount: 3.0,
      dateTime: DateTime(2025, 08, 12, 09, 30, 12),
    );
    await noteLocalDataSource.createNote(note: insertData);
    await noteLocalDataSource.createNote(note: insertData2);

    final List<DetailsNotesModel> detailsNotesData = [
      DetailsNotesModel(
        amount: insertData.amount,
        datetime: insertData.dateTime,
        notes: [insertData],
      ),
    ];
    final data = await detailsNotesLocalDataSource.getDetailsNotes(
      dateTime: "2025-10",
    );

    expect(data, detailsNotesData);
  });
}
