import 'package:api_dio_node_demo/core/error/failure.dart';
import 'package:api_dio_node_demo/core/usecase/usecase.dart';
import 'package:api_dio_node_demo/fetures/emp_std_api/data/remote/models/StudentModel.dart';
import 'package:api_dio_node_demo/fetures/emp_std_api/domain/repositories/student_repo.dart';
import 'package:dartz/dartz.dart';

class UpdateStudentUsecase extends UseCase<List<StudentModel> , Stdupdparams>{

  final StudentRepo studentRepo;

  UpdateStudentUsecase(this.studentRepo);

  @override
  Future<Either<Failure, List<StudentModel>>> call(Stdupdparams params) async {

    return await studentRepo.updatetudentrepo(params.studentModel,params.studentid);
  }

}

class Stdupdparams {
  final StudentModel studentModel;
  final int studentid;

  Stdupdparams(this.studentModel, this.studentid);

}