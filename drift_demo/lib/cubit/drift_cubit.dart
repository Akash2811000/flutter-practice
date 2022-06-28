import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';
import 'package:drift_demo/core/error/failure.dart';
import 'package:drift_demo/database/drift_database.dart';
import 'package:drift_demo/model/employeemodel.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';

part 'drift_state.dart';

class DriftCubit extends Cubit<DriftState> {
  DriftCubit(this.appDatabase) : super(DriftInitial());
  final AppDatabase appDatabase;
  Future<Either<Failure, void>?>? addEmployeeEntities() async {
    try {
      print("calling");
      var jsonText = await rootBundle.loadString('assets/employee.json');
      Map<String, dynamic> map = json.decode(jsonText);
      List<dynamic> data = map["auditEntity"];
      List<EmployeesEntities> subList = data.map((e) => EmployeesEntities.fromJson(e)).toList();
      List<EmployeeTableCompanion> list = [];

      for (var element in subList) {
        final data = EmployeeTableCompanion.insert(
          employeeId: Value(element.employeeId),
          employeeName: Value(element.employeeName),
          employeeSalary: Value(element.employeeSalary),
          employeeJoiningDate: Value(element.employeeJoiningDate),
        );
        list.add(data);
        print(list);
      }
      final add = await appDatabase.employeeDao.insertEmployee(list);
      return Right(add);
    } catch (e) {
      return Left(LocalFailure());
    }
  }

}
