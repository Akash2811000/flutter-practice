import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sqlite_demo/model/model.dart';

part 'dbcubit_state.dart';

class DbcubitCubit extends Cubit<DbcubitState> {
  DbcubitCubit() : super(DbcubitInitial()){
    emit(DbSucess("msg"));
  }
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
    try {
      await openDb();
      await _database.insert('model', model.toJson());
      emit(DbSucess("data inserted"));
      print("sucess");
    }
    catch(error) {
      emit(DbFail("fail to data enterd"));
      print(error);
    }
  }
  //
  Future<List<Model>> getModellist () async {
      await openDb();
      final List<Map<String, dynamic>> maps = await _database.query('model');
      return List.generate(maps.length, (i){
        return Model(
          id: maps[i]['id'],
          fruitName: maps[i]['fruitName'],
          quantity: maps[i]['quantity'],
        );
      });
  }
  // void getModellist () async {
  //   await openDb();
  //   final List<Map<String, dynamic>> maps = await _database.query('model');
  //   emit(DbModelGet(List.generate(maps.length, (i){
  //     return Model(
  //       id: maps[i]['id'],
  //       fruitName: maps[i]['fruitName'],
  //       quantity: maps[i]['quantity'],
  //     );
  //   })));
  // }


  updateModel (Model model,id) async {
    try {
      print(model.toJson());
      await openDb();
      await _database.update('model', model.toJson(),
      where: 'id = ?',whereArgs:  [id]);
      emit(DbSucess("success"));
      print('sucess');
    }
    catch (err){
      emit(DbFail('err'));
      print('hello $err');
    }
  }

  Future<void> deleteModel(id) async {
    try {
      await openDb();
      await _database.delete('model', where: "id = ?", whereArgs: [id]);
      emit(DbSucess('msg'));
    }catch (err){
      emit(DbFail("err"));
    }

  }
}
