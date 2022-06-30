import 'package:api_dio_node_demo/core/error/failure.dart';
import 'package:api_dio_node_demo/fetures/emp_std_api/data/remote/data_sources/student_datasource.dart';
import 'package:api_dio_node_demo/fetures/emp_std_api/data/remote/models/StudentModel.dart';
import 'package:api_dio_node_demo/fetures/emp_std_api/domain/repositories/student_repo.dart';
import 'package:dartz/dartz.dart';

class StudentRepoImpl implements StudentRepo{

 final StudentDataSource studentDataSource;


 StudentRepoImpl(this.studentDataSource);
  @override
  Future<Either<Failure, List<StudentModel>>> getAllStudent() async{
    try {
      final res = await studentDataSource.getAllStudentdatasource();

      return Right(res);
    } catch (e) {
      return Left(ServerFailure());
    }
    print("repo impl");
    return Left(ServerFailure());
  }

  @override
  Future<Either<Failure, List<StudentModel>>> createstudent(StudentModel studentModel) async{
    try {
      final res = await studentDataSource.createStudentDatasource(studentModel);

      return Right(res);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}