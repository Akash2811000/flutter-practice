import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:drift_demo/dao/employee_dao.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;


part 'drift_database.g.dart';

@DataClassName('Employee')
class EmployeeTable extends Table {
  IntColumn get employeeId => integer().nullable()();
  TextColumn get employeeName => text().nullable()();
  IntColumn get employeeSalary => integer().nullable()();
  TextColumn get employeeJoiningDate => text().nullable()();

  @override
  Set<Column> get primaryKey => {employeeId};
}

@DriftDatabase(tables: [EmployeeTable], daos: [EmployeeDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase(QueryExecutor e)
      : super(e);

  @override
  int get schemaVersion => 1;

}

LazyDatabase openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getDatabasesPath();
    final file = File(p.join(dbFolder, 'employeedb.sqlite'));
    return NativeDatabase(file);
  });
}
