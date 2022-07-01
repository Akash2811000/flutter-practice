import 'package:api_dio_node_demo/core/error/failure.dart';
import 'package:api_dio_node_demo/fetures/emp_std_api/data/remote/models/StudentModel.dart';
import 'package:dartz/dartz.dart';

abstract class StudentRepo {
  Future<Either<Failure,List<StudentModel>>> getAllStudent();
  Future<Either<Failure,List<StudentModel>>> createstudent(StudentModel studentModel);
  Future<Either<Failure,List<StudentModel>>> updatetudentrepo(StudentModel studentModel,int studentid);
  Future<Either<Failure,List<StudentModel>>> deletestudentrepo(int studentid);
}