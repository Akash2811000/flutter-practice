
import 'package:drift_task1/core/usecases/usecase.dart';
import 'package:drift_task1/fetures/drift_task/data/data_sources/local/database/drift_database.dart';
import 'package:drift_task1/fetures/drift_task/domain/use_cases/add_audit_entities.dart';
import 'package:drift_task1/fetures/drift_task/domain/use_cases/delete_audit_entities.dart';
import 'package:drift_task1/fetures/drift_task/domain/use_cases/get_audit_entities.dart';
import 'package:drift_task1/fetures/drift_task/domain/use_cases/update_audit_entites.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
part 'drift_state.dart';

class DriftCubit extends Cubit<DriftState> {
  DriftCubit(this.addAuditEntites, this.getAuditEntities, this.deleteAuditEntities, this.updateAuditEntities) : super(DriftInitial());

  final AddAuditEntites addAuditEntites;
  final GetAuditEntities getAuditEntities;
  final DeleteAuditEntities deleteAuditEntities;
  final UpdateAuditEntities updateAuditEntities;

  insertaudit()async{
    await addAuditEntites.call(NoParams());
    getaudit();

  }

  getaudit() async {
    final datalist = await getAuditEntities.call(NoParams());
    datalist.fold((l) => null, (r) => emit(DriftSucess(auditlist: r)));

  }


  deleteaudit(Audit audit) async {
    await deleteAuditEntities.call(audit);
  getaudit();
  }

  updateaudit(Audit audit) async {
    await updateAuditEntities.call(audit);
    getaudit();
  }
}
