import 'package:api_dio_node_demo/core/error/failure.dart';
import 'package:api_dio_node_demo/core/usecase/usecase.dart';
import 'package:api_dio_node_demo/fetures/emp_std_api/data/remote/models/StudentModel.dart';
import 'package:api_dio_node_demo/fetures/emp_std_api/domain/repositories/student_repo.dart';
import 'package:dartz/dartz.dart';

class GetAllStudentUsecase extends UseCase<List<StudentModel>,NoParams>{
  final StudentRepo studentRepo;

  GetAllStudentUsecase(this.studentRepo);

  @override
  Future<Either<Failure, List<StudentModel>>> call(NoParams params) async{
    print("usecase");
    return await studentRepo.getAllStudent();
  }


}