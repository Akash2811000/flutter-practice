import 'package:api_dio_node_demo/core/error/failure.dart';
import 'package:api_dio_node_demo/fetures/emp_std_api/data/remote/models/StudentModel.dart';
import 'package:dartz/dartz.dart';

abstract class StudentRepo {
  Future<Either<Failure,List<StudentModel>>> getAllStudent();
}