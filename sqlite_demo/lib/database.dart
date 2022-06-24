import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sqlite_demo/model/model.dart';

class DbManager {
  late Database _database;

  Future openDb() async {
    _database = await openDatabase(join(await getDatabasesPath(), 'ss.db'),
        version: 1, onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE model(id INTEGER PRIMARY KEY autoincrement ,fruitName TEXT, quantity TEXT)');
    });
    return _database;
  }
  Future insertModel(Model model) async {
    await openDb();
    return await _database.insert('model', model.toJson());
  }


}
