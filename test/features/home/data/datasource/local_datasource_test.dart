import 'package:fin_sight/core/databases/sqlite.dart';
import 'package:fin_sight/features/home/data/datasource/note_local_data_source.dart';
import 'package:fin_sight/shared/data/models/note_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqlite3/sqlite3.dart';

void main() {
  final dummyDateTime = DateTime(2026, 08, 29, 16, 38);
  group("Note local datasouce test", () {
    late SQLite db;
    late NoteLocalDataSourceImpl localDataSourceImpl;
    setUp(() async {
      db = SQLite(overrideDb: sqlite3.openInMemory());
      localDataSourceImpl = NoteLocalDataSourceImpl(dbHelper: db);
    });
    tearDown(() async => await db.closeDb());
    test('Fetching notes success but return the data is empty', () async {
      final data = await localDataSourceImpl.getNotes();
      expect(data, []);
    });
    test('Fetching Notes Failed', () async {
      final insert = NoteModel(
        title: "test",
        category: "testing",
        amount: 1.0,
        dateTime: DateTime(2018, 02, 14, 23, 32, 12),
      );

      await localDataSourceImpl.createNote(note: insert);

      final data = await localDataSourceImpl.getNotes();

      // it will return empty because get the data only current date (dateTime.now())
      expect(data.length, 0);
      expect(data, isNot([insert]));
    });
    test('Create Note Success', () async {
      final insert = NoteModel(
        title: "test",
        category: "testing",
        amount: 1.0,
        dateTime: dummyDateTime,
      );

      await localDataSourceImpl.createNote(note: insert);

      final data = await localDataSourceImpl.getNotes(datetime: dummyDateTime);

      expect(data.length, 1);
      expect(data, [insert]);
    });
    test("Fetching notes success", () async {
      final insert1 = NoteModel(
        title: "title",
        category: "category",
        amount: 100,
        dateTime: dummyDateTime,
      );
      await localDataSourceImpl.createNote(note: insert1);
      final insert2 = NoteModel(
        title: "title",
        category: "category",
        amount: 100,
        dateTime: DateTime(2017, 9, 7, 17, 30, 30),
      );
      final allData = [insert1, insert2];
      await localDataSourceImpl.createNote(note: insert2);
      final data = await localDataSourceImpl.getNotes(datetime: dummyDateTime);

      expect(data, isNot(allData));
      expect(data, [insert1]);
    });

    test(
      "Should store SQL injection characters as plain text without breaking the database",
      () async {
        final maliciousNote = NoteModel(
          title: "'; DROP TABLE notes; --",
          category: "testing",
          amount: 1.0,
          dateTime: dummyDateTime,
        );

        await localDataSourceImpl.createNote(note: maliciousNote);

        final data = await localDataSourceImpl.getNotes(
          datetime: dummyDateTime,
        );

        expect(data.length, 1);
        expect(data.first.title, maliciousNote.title);
      },
    );
  });
}
