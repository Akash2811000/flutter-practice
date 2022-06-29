import 'package:api_dio_demo/core/usecase/usecase.dart';
import 'package:api_dio_demo/fetures/breaking_bad/data/model/QuoteModel.dart';
import 'package:api_dio_demo/fetures/breaking_bad/domain/use_cases/get_quatos_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'breaking_bad_state.dart';

class BreakingBadCubit extends Cubit<BreakingBadState> {
  BreakingBadCubit(this.getQuatosUsecase) : super(BreakingBadInitial());

  final GetQuatosUsecase getQuatosUsecase;

  getQuotes() async {
    emit(BreakingBadQuoteLoader());
    print("object");
    var res = await getQuatosUsecase.call(NoParams());
    res.fold((l) {
      emit(BreakingBadFail());
    }, (r) {
      print('cubit');
      print(r);
      emit(BreakingBadQuoteSuccess(r));
    });
  }







}
