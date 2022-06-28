import 'package:dartz/dartz.dart';
import 'package:drift_task1/core/error/failure.dart';
import 'package:drift_task1/fetures/drift_task/data/data_sources/local/database/drift_database.dart';

abstract class AuditRepository {
  Future<Either<Failure, List<Audit>>> getAuditEntities();

  Future<Either<Failure, void>> deleteAuditEntities(Audit auditDetails);
  Future<Either<Failure, void>> updateAuditEntities(Audit auditDetails);
  Future<Either<Failure, void>> addAuditEntites();
}