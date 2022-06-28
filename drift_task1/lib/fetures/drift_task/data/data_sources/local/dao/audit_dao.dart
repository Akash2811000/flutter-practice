import 'package:drift/drift.dart';
import 'package:drift_task1/fetures/drift_task/data/data_sources/local/database/drift_database.dart';

part 'audit_dao.g.dart';
@DriftAccessor(tables : [AuditTable])
class AuditDao extends DatabaseAccessor<AppDatabase> with _$AuditDaoMixin{

  final AppDatabase db;

  AuditDao(this.db) : super(db);

  Future<List<Audit>> watchAllAudit() => select(auditTable).get();

  Future<void> insertAudit(
      List<AuditTableCompanion> auditDetails) async {
    await batch((batch) {
      batch.insertAll(auditTable, auditDetails);
    });
  }

  Future updateAudit(Insertable<Audit> auditDetails) => update(auditTable).replace(auditDetails);

  deleteAudit(Insertable<Audit> auditDetails) {
    print(auditDetails);
    delete(auditTable).delete(auditDetails);}

}