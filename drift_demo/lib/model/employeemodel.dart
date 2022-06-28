import 'package:equatable/equatable.dart';

class EmployeesEntities extends Equatable {
  final int? employeeId;
  final String? employeeName;
  final int? employeeSalary;
  final String? employeeJoiningDate;

  EmployeesEntities({
    this.employeeId,
    this.employeeName,
    this.employeeSalary,
    this.employeeJoiningDate,
  });

  factory EmployeesEntities.fromJson(Map<String, dynamic> json) => EmployeesEntities(
    employeeId: json["EmployeeId"],
    employeeName: json["EmployeeName"],
    employeeSalary: json["EmployeeSalary"],
    employeeJoiningDate: json["EmployeeJoiningDate"],
  );


  Map<String, dynamic> toJson() => {
    "EmployeeId": employeeId,
    "EmployeeName": employeeName,
    "EmployeeSalary": employeeSalary,
    "EmployeeJoiningDate": employeeJoiningDate,
  };


  @override
  List<Object?> get props => [employeeId!, employeeName!, employeeSalary!, employeeJoiningDate!];
}