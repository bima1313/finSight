import 'package:fin_sight/core/databases/sqlite.dart';
import 'package:fin_sight/core/errors/exceptions.dart';
import 'package:fin_sight/features/history/data/datasource/history_local_data_source.dart';
import 'package:fin_sight/features/home/data/datasource/note_local_data_source.dart';
import 'package:fin_sight/features/home/data/models/note_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart'
    show
        sqfliteFfiInit,
        databaseFactory,
        databaseFactoryFfi,
        inMemoryDatabasePath;

void main() {
  setUpAll(() {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  });

  group('local datasource tests', () {
    late SQLite db;
    late HistoryLocalDataSourceImpl historyLocalDataSource;
    late NoteLocalDataSourceImpl noteLocalDataSource;
    setUp(() async {
      db = SQLite(dbPath: inMemoryDatabasePath);
      historyLocalDataSource = HistoryLocalDataSourceImpl(dbHelper: db);
      noteLocalDataSource = NoteLocalDataSourceImpl(dbHelper: db);
    });

    tearDown(() async => await db.closeDb());

    // get total function
    test("get total amount success", () async {
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

      final data = await historyLocalDataSource.getTotal(year: 2025);

      expect(data, insertData.amount + insertData2.amount);
    });
    test(
      "should throw exception when data for the given year does not exist",
      () async {
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
        final data = historyLocalDataSource.getTotal(year: 2026);

        await expectLater(data, throwsA(isA<DatabaseException>()));
      },
    );

    // get years function

    test("should return list of year data", () async {
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
        dateTime: DateTime(2026, 08, 12, 09, 30, 12),
      );
      await noteLocalDataSource.createNote(note: insertData);
      await noteLocalDataSource.createNote(note: insertData2);
      final data = await historyLocalDataSource.getYears();

      expect(data.length, 2);
    });
    test("should return [] when data of years does not exist", () async {
      final data = await historyLocalDataSource.getYears();
      expect(data, []);
    });
    test("get histories success", () async {
      final insertData = NoteModel(
        title: "testing",
        category: "test",
        amount: 1.0,
        dateTime: DateTime(2025, 03, 23, 09, 30, 12),
      );
      final insertData2 = NoteModel(
        title: "testing2",
        category: "test",
        amount: 3.0,
        dateTime: DateTime(2025, 05, 23, 09, 30, 12),
      );
      await noteLocalDataSource.createNote(note: insertData);
      await noteLocalDataSource.createNote(note: insertData2);
      final data = await historyLocalDataSource.getHistories(year: 2025);

      expect(data.length, 2);
    });
  });
}
