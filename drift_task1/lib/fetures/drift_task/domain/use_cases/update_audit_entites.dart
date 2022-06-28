import 'package:dartz/dartz.dart';
import 'package:drift_task1/core/error/failure.dart';
import 'package:drift_task1/core/usecases/usecase.dart';
import 'package:drift_task1/fetures/drift_task/data/data_sources/local/database/drift_database.dart';
import 'package:drift_task1/fetures/drift_task/domain/repositories/audit_entities_repository.dart';

class UpdateAuditEntities extends UseCase<void,Audit>{
  final AuditRepository auditRepository;

  UpdateAuditEntities(this.auditRepository);

  @override
  Future<Either<Failure, void>?>? call(Audit params) async{
    return await auditRepository.updateAuditEntities(params);
  }

}