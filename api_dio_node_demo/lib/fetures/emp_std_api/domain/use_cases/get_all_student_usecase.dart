import 'package:api_dio_node_demo/core/usecase/usecase.dart';
import 'package:api_dio_node_demo/fetures/emp_std_api/data/remote/models/StudentModel.dart';
import 'package:api_dio_node_demo/fetures/emp_std_api/domain/repositories/student_repo.dart';

class GetAllStudentUsecase extends UseCase<List<StudentModel>,NoParams>{
  final StudentRepo studentRepo;

  GetAllStudentUsecase(this.studentRepo);


}