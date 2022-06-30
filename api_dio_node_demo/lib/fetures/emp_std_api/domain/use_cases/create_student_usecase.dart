import 'package:api_dio_node_demo/core/error/failure.dart';
import 'package:api_dio_node_demo/core/usecase/usecase.dart';
import 'package:api_dio_node_demo/fetures/emp_std_api/data/remote/models/StudentModel.dart';
import 'package:api_dio_node_demo/fetures/emp_std_api/domain/repositories/student_repo.dart';
import 'package:dartz/dartz.dart';

class CreateStudentUsecase extends UseCase<List<StudentModel> , Stdparams>{
final StudentRepo studentRepo;

CreateStudentUsecase(this.studentRepo);

  @override
  Future<Either<Failure, List<StudentModel>>> call(params) async {
   return await studentRepo.createstudent(params.studentModel);
  }

}

class Stdparams {
 final StudentModel studentModel;

  Stdparams(this.studentModel);

}