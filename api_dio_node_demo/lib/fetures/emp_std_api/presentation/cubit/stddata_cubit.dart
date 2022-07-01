import 'package:api_dio_node_demo/core/usecase/usecase.dart';
import 'package:api_dio_node_demo/fetures/emp_std_api/data/remote/models/StudentModel.dart';
import 'package:api_dio_node_demo/fetures/emp_std_api/domain/use_cases/create_student_usecase.dart';
import 'package:api_dio_node_demo/fetures/emp_std_api/domain/use_cases/delete_student_usecase.dart';
import 'package:api_dio_node_demo/fetures/emp_std_api/domain/use_cases/get_all_student_usecase.dart';
import 'package:api_dio_node_demo/fetures/emp_std_api/domain/use_cases/upadate_student_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'stddata_state.dart';

class StddataCubit extends Cubit<StddataState> {
  StddataCubit(this.getAllStudentUsecase, this.createStudentUsecase, this.deleteStudentUsecase, this.updateStudentUsecase)
      : super(StddataInitial());

  final GetAllStudentUsecase getAllStudentUsecase;
  final CreateStudentUsecase createStudentUsecase;
  final DeleteStudentUsecase deleteStudentUsecase;
  final UpdateStudentUsecase updateStudentUsecase;

  getAllStudent() async {
    emit(StddataLoading());
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
    emit(StddataLoading());
    var res = await createStudentUsecase.call(Stdparams(studentModel));
    res.fold((l) {
      emit(StddataFail());
    }, (r) {
      print('rhis crestd ${r.toString()}');
      emit(StddataSucess(r));
    });
  }

  deletestudent(int studentid) async{
    emit(StddataLoading());
    var res = await deleteStudentUsecase.call(Idparams(studentid));
    res.fold((l) {
      emit(StddataFail());
    }, (r) {

      emit(StddataSucess(r));
    });
  }


  updateStudent(StudentModel studentModel, int studentid) async {
    emit(StddataLoading());
    var res = await updateStudentUsecase.call(Stdupdparams(studentModel,studentid));
    res.fold((l) {
      emit(StddataFail());
    }, (r) {

      emit(StddataSucess(r));
    });
  }





}
