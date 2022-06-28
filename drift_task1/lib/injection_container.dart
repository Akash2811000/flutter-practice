import 'package:drift_task1/fetures/drift_task/data/data_sources/local/dao/audit_dao.dart';
import 'package:drift_task1/fetures/drift_task/data/data_sources/local/database/drift_database.dart';
import 'package:drift_task1/fetures/drift_task/data/repositories/audit_repository_impl.dart';
import 'package:drift_task1/fetures/drift_task/domain/repositories/audit_entities_repository.dart';
import 'package:drift_task1/fetures/drift_task/domain/use_cases/add_audit_entities.dart';
import 'package:drift_task1/fetures/drift_task/domain/use_cases/delete_audit_entities.dart';
import 'package:drift_task1/fetures/drift_task/domain/use_cases/get_audit_entities.dart';
import 'package:drift_task1/fetures/drift_task/domain/use_cases/update_audit_entites.dart';
import 'package:drift_task1/fetures/drift_task/presentation/cubit/drift_cubit.dart';
import 'package:get_it/get_it.dart';
var sl = GetIt.instance;

Future<void> init() async {
  //cubit
  sl.registerFactory(() => DriftCubit(sl(),sl(),sl(),sl()));

  //repo
  sl.registerLazySingleton<AuditRepository>(() => AuditRepositoryImpl(appDatabase: sl()));

  //usecase
  sl.registerLazySingleton(() => AddAuditEntites(sl()));
  sl.registerLazySingleton(() => GetAuditEntities(sl()));
  sl.registerLazySingleton(() => DeleteAuditEntities(sl()));
  sl.registerLazySingleton(() => UpdateAuditEntities(sl()));

  //datasource
  sl.registerLazySingleton(() => AuditDao(sl()));
  sl.registerLazySingleton(() => AppDatabase(openConnection()));
}