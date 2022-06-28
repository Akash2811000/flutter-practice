import 'package:equatable/equatable.dart';

class EmployeeEntities extends Equatable{
  final int? employeeId;
  final String? employeeName;
  final int? employeeSalary;
  final String? empdoj;

  EmployeeEntities({required this.employeeId, this.employeeName, this.employeeSalary, this.empdoj});

  @override
  // TODO: implement props
  List<Object?> get props => [employeeId,employeeName,employeeSalary,empdoj];

}