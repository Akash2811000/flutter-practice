import 'package:api_dio_demo/core/usecase/usecase.dart';
import 'package:api_dio_demo/fetures/breaking_bad/data/model/QuoteModel.dart';
import 'package:api_dio_demo/fetures/breaking_bad/domain/use_cases/get_quatos_usecase.dart';
import 'package:api_dio_demo/fetures/breaking_bad/domain/use_cases/get_quote_byid_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'breaking_bad_state.dart';

class BreakingBadCubit extends Cubit<BreakingBadState> {
  BreakingBadCubit(this.getQuatosUsecase, this.getQuoteByIdUsecase) : super(BreakingBadInitial());

  final GetQuatosUsecase getQuatosUsecase;
  final GetQuoteByIdUsecase getQuoteByIdUsecase;

  getQuotes() async {
    emit(BreakingBadQuoteLoader());
    print("object");
    var res = await getQuatosUsecase.call(NoParams());
    res.fold((l) {
      emit(BreakingBadFail());
    }, (r) {

      emit(BreakingBadQuoteSuccess(r));
    });
  }

  getQuotesByid(int quoteid) async {
    print("by id cubit");
    emit(BreakingBadQuoteLoader());
    var res = await getQuoteByIdUsecase.call(IdParams(id: quoteid));
    res.fold((l) {
      emit(BreakingBadFail());
    }, (r) {
      print("this ${r.toString()}");
      emit(BreakingBadQuoteSuccess(r));
    });
  }

  void serch(a){
    if(a==1){
      emit(serchInActive());

    }else {
      emit(serchActive());

    }
  }







}
