import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqlite3/sqlite3.dart';

class SQLite {
  const SQLite({this.overrideDb});
  final Database? overrideDb;
  static Database? _db;

  Future<Database> getDb() async {
    if (_db != null) return _db!;

    _db = await _initDb();

    return _db!;
  }

  Future<void> closeDb() async {
    _db!.close();
    _db = null;
  }

  Future<Database> _initDb() async {
    if (overrideDb != null) {
      _db = overrideDb;
    } else {
      final dbDir = await getApplicationDocumentsDirectory();
      _db = sqlite3.open(join(dbDir.path, 'cash_flow_database.db'));
    }

    const targetVersion = 1;

    final result = _db!.select('PRAGMA user_version;');
    final currentVersion = result.first['user_version'] as int;

    if (currentVersion == 0) {
      _db!.execute('''CREATE TABLE expense(
          id integer primary key autoincrement not null,
          title text not null,
          amount real not null,
          category text not null,
          created_at text
          )
          ''');

      _db!.execute('PRAGMA user_version = $targetVersion;');
    }

    return _db!;
  }
}

extension StatementParametersSqlite on Map<String, Object?> {
  StatementParameters toStatementParameters() {
    return StatementParameters.named(this);
  }
}
