import 'package:api_dio_node_demo/core/usecase/usecase.dart';
import 'package:api_dio_node_demo/fetures/emp_std_api/domain/use_cases/get_all_student_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'stddata_state.dart';

class StddataCubit extends Cubit<StddataState> {
  StddataCubit(this.getAllStudentUsecase) : super(StddataInitial());

  final GetAllStudentUsecase getAllStudentUsecase;

  getAllStudent()async{
    print("cubit");
    var res = await getAllStudentUsecase.call(NoParams());
    res.fold((l) {
      emit(StddataFail());
    }, (r) {
      print("this ${r.toString()}");
      emit(StddataSucess());
    });
  }


}
