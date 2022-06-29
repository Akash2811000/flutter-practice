
import 'package:api_dio_demo/core/usecase/usecase.dart';
import 'package:api_dio_demo/fetures/breaking_bad/domain/use_cases/get_quatos_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'breaking_bad_state.dart';

class BreakingBadCubit extends Cubit<BreakingBadState> {
  BreakingBadCubit(this.getQuatosUsecase) : super(BreakingBadInitial());

  final GetQuatosUsecase getQuatosUsecase;

  getQuotes() async{
    print("object");
    var res = await getQuatosUsecase.call(NoParams());
    res.fold((l)  {
      print('fail');
      emit(BreakingBadFail());
    }, (r) {
      print('cubit');
      print(r);
      emit(BreakingBadSuccess());
    });

  }
}
