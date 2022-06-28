import 'package:drift/drift.dart';
part 'drift_database.g.dart';
@DriftDatabase (tables: [EmployeeTable],daos: [EmployeeDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase (QueryExecutor e): super (e);

  @override
  int get schemaVersion => 1;
}