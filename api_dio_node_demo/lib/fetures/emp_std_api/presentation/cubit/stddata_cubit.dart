import 'package:api_dio_node_demo/core/usecase/usecase.dart';
import 'package:api_dio_node_demo/fetures/emp_std_api/data/remote/models/StudentModel.dart';
import 'package:api_dio_node_demo/fetures/emp_std_api/domain/use_cases/create_student_usecase.dart';
import 'package:api_dio_node_demo/fetures/emp_std_api/domain/use_cases/get_all_student_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'stddata_state.dart';

class StddataCubit extends Cubit<StddataState> {
  StddataCubit(this.getAllStudentUsecase, this.createStudentUsecase)
      : super(StddataInitial());

  final GetAllStudentUsecase getAllStudentUsecase;
  final CreateStudentUsecase createStudentUsecase;

  getAllStudent() async {
    print("cubit");
    var res = await getAllStudentUsecase.call(NoParams());
    res.fold((l) {
      emit(StddataFail());
    }, (r) {
      print("this ${r.toString()}");
      emit(StddataSucess(r));
    });
  }

  createstudent(StudentModel studentModel) async {
    var res = await createStudentUsecase.call(Stdparams(studentModel));
    res.fold((l) {
      emit(StddataFail());
    }, (r) {
      emit(StddataSucess(r));
    });
  }
}
