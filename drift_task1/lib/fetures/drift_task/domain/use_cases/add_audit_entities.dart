
import 'package:dartz/dartz.dart';
import 'package:drift_task1/core/error/failure.dart';
import 'package:drift_task1/core/usecases/usecase.dart';
import 'package:drift_task1/fetures/drift_task/domain/repositories/audit_entities_repository.dart';

class AddAuditEntites extends UseCase<void,NoParams>{
  final AuditRepository auditRepository;

  AddAuditEntites(this.auditRepository);

  @override
  Future<Either<Failure, void>> call(NoParams params) async{
    return await auditRepository.addAuditEntites();
  }
}