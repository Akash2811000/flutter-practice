import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:drift_task1/fetures/drift_task/data/data_sources/local/dao/audit_dao.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;

part 'drift_database.g.dart';

@DataClassName('Audit')
class AuditTable extends Table {


  IntColumn get auditEntityId => integer().nullable()();
  IntColumn get auditId => integer().nullable()();
  TextColumn get auditEntityName => text().nullable()();
  IntColumn get auditEntityTypeId => integer().nullable()();
  IntColumn get auditParentEntityId => integer().nullable()();
  IntColumn get sequenceNo => integer().nullable()();
  TextColumn get entityEndDate => text().nullable()();
  BoolColumn get isLeafNode => boolean().nullable()();
  TextColumn get barcodeNFC => text().nullable()();
  IntColumn get entityLevel => integer().nullable()();
  BoolColumn get entityException => boolean().nullable()();
  TextColumn get scheduleOccurrenceIds => text().nullable()();

  @override
  Set<Column> get primaryKey => {auditEntityId};
}

@DriftDatabase(tables: [AuditTable], daos: [AuditDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase(QueryExecutor e)
      : super(e);

  @override
  int get schemaVersion => 1;

}

LazyDatabase openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getDatabasesPath();
    final file = File(p.join(dbFolder, 'auditdb.sqlite'));
    return NativeDatabase(file);
  });
}