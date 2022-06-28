import 'package:dartz/dartz.dart';
import 'package:drift_task1/core/error/failure.dart';
import 'package:drift_task1/core/usecases/usecase.dart';
import 'package:drift_task1/fetures/drift_task/data/data_sources/local/database/drift_database.dart';
import 'package:drift_task1/fetures/drift_task/domain/repositories/audit_entities_repository.dart';

class GetAuditEntities extends UseCase<List<Audit>,NoParams>{
  final AuditRepository auditRepository;

  GetAuditEntities(this.auditRepository);

  @override
  Future<Either<Failure, List<Audit>>> call(NoParams params) async{
   return await auditRepository.getAuditEntities();
  }

}