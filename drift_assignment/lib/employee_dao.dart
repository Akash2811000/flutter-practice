import 'package:drift/drift.dart';
import 'package:drift_assignment/drift_database.dart';
import 'package:drift_assignment/empmodel.dart';

part 'employee_dao.g.dart';
@DriftAccessor(tables : [EmployeeTable])

class EmployeeDao extends DatabaseAccessor<AppDatabase> with _$AuditEntityDaoMixin{
  final AppDatabase db;
  EmployeeDao(this.db) : super(db);

  Future<List<EmployeeEntities>> watchAllEmployee() => select(employeeTable).get();

  Future<void> insertEmployee (
      List<EmployeeTableCompanion> employeeDetails) async {
    await batch((batch)  {
      batch.insertAll(employeeTable, employeeDetails);
    });
  }

}