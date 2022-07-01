import 'package:api_dio_node_demo/core/error/failure.dart';
import 'package:api_dio_node_demo/core/usecase/usecase.dart';
import 'package:api_dio_node_demo/fetures/emp_std_api/data/remote/models/StudentModel.dart';
import 'package:api_dio_node_demo/fetures/emp_std_api/domain/repositories/student_repo.dart';
import 'package:dartz/dartz.dart';

class DeleteStudentUsecase extends UseCase<List<StudentModel>, Idparams>{

  final StudentRepo studentRepo;

  DeleteStudentUsecase(this.studentRepo);
  @override
  Future<Either<Failure, List<StudentModel>>> call(params) async{
    return await studentRepo.deletestudentrepo(params.id);
  }

}

class Idparams {
  final int id;

  Idparams(this.id);

}