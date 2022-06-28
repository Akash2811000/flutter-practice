

class EmployeesEntities {
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
    "EmployeeId": employeeId ?? 0,
    "EmployeeName": employeeName ?? '',
    "EmployeeSalary": employeeSalary ?? 0,
    "EmployeeJoiningDate": employeeJoiningDate ?? '',
  };



}