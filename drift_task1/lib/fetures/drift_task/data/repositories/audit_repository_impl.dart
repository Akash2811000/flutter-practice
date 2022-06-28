import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';
import 'package:drift_task1/core/error/failure.dart';
import 'package:drift_task1/fetures/drift_task/data/data_sources/local/database/drift_database.dart';
import 'package:drift_task1/fetures/drift_task/data/models/AuditModel.dart';
import 'package:drift_task1/fetures/drift_task/domain/repositories/audit_entities_repository.dart';
import 'package:flutter/services.dart';

class AuditRepositoryImpl implements AuditRepository{
  final AppDatabase appDatabase;

  AuditRepositoryImpl({required this.appDatabase});

  @override
  Future<Either<Failure, void>> addAuditEntites() async {
    try {
      var jsonText = await rootBundle.loadString('assets/Entity.json');
      Map<String, dynamic> map = json.decode(jsonText);
      List<dynamic> data = map["auditEntity"];
      List<AuditModel> subList = data.map((e) => AuditModel.fromJson(e)).toList();
      List<AuditTableCompanion> list = [];

      for (var element in subList) {
        final data = AuditTableCompanion.insert(
          auditEntityId: Value(element.auditEntityId),
          auditId: Value(element.auditId),
          auditEntityName: Value(element.auditEntityName),
          auditEntityTypeId: Value(element.auditEntityTypeId),
          auditParentEntityId: Value(element.auditParentEntityId),
          sequenceNo: Value(element.sequenceNo),
          entityEndDate: Value(element.entityEndDate),
          isLeafNode: Value(element.isLeafNode),
          barcodeNFC: Value(element.barcodeNFC),
          entityLevel: Value(element.entityLevel),
          entityException: Value(element.entityException),
        );
        list.add(data);
      }
      final add = await appDatabase.auditDao.insertAudit(list);
      return Right(add);
    } catch (e) {
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, List<Audit>>> getAuditEntities() async {
    try{
      final get = await appDatabase.auditDao.watchAllAudit();
      return Right(get);
    }on Exception{
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteAuditEntities(Audit auditDetails) async{
    await appDatabase.auditDao.deleteAudit(auditDetails);
    return Right(null);
  }

  @override
  Future<Either<Failure, void>> updateAuditEntities(Audit auditDetails) async{
    final update = await appDatabase.auditDao.updateAudit(auditDetails);
    return Right(update);
  }

}