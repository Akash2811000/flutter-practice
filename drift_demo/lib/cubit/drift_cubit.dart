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
  DriftCubit() : super(DriftInitial());
  AppDatabase appDatabase = AppDatabase();
  Future<void> addEmployeeEntities() async {
    // try {

    print("calling");
    var jsonText = await rootBundle.loadString('assets/employee.json');
    Map<String, dynamic> map = json.decode(jsonText);
    List<dynamic> data = map["auditEntity"];

    List<EmployeesEntities> subList =
        data.map((e) => EmployeesEntities.fromJson(e)).toList();

    List<EmployeeTableCompanion> list = [];
    print(subList);
    for (var element in subList) {
      print('hii');
      print(element.employeeName);
      // print("this is $element");
      final d = EmployeeTableCompanion.insert(
        employeeId: Value(element.employeeId),
        employeeName: Value(element.employeeName),
        employeeSalary: Value(element.employeeSalary),
        employeeJoiningDate: Value(element.employeeJoiningDate),
      );
      print('This is data $d');
      list.add(d);
      print("this is list $list");
    }
    final add = await appDatabase.employeeDao.insertEmployee(list);
    emit(DriftSucess());

    // } catch (e) {
    //
    // }
  }

  Future<List<Employee>> getData() async {
    // try{
    List<Employee> get = await appDatabase.employeeDao.watchAllEmployee();
    emit(DriftSucess());
    return get;
    // }on Exception{
    //  emit(EmpInsFail());
    //  return ;
    // }
  }


  void deletedata (Employee e) async {
    final delete = await appDatabase.employeeDao.deleteEmployee(e);
    emit(DriftSucess());
  }

  void updateEmployeeEntities(Employee e) async {
    final update = await appDatabase.employeeDao
        .updateEmployee(e);
    emit(DriftSucess());
  }



}
