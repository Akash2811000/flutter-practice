import 'package:api_dio_demo/core/error/failure.dart';
import 'package:api_dio_demo/core/usecase/usecase.dart';
import 'package:api_dio_demo/fetures/breaking_bad/data/model/QuoteModel.dart';
import 'package:api_dio_demo/fetures/breaking_bad/domain/use_cases/get_quatoes_by_random_series_usecase.dart';
import 'package:api_dio_demo/fetures/breaking_bad/domain/use_cases/get_quatos_usecase.dart';
import 'package:api_dio_demo/fetures/breaking_bad/domain/use_cases/get_quote_byid_usecase.dart';
import 'package:api_dio_demo/fetures/breaking_bad/domain/use_cases/get_quotes_by_random_usecase.dart';
import 'package:api_dio_demo/fetures/breaking_bad/domain/use_cases/get_quotes_by_series_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'breaking_bad_state.dart';

class BreakingBadCubit extends Cubit<BreakingBadState> {
  BreakingBadCubit(this.getQuatosUsecase, this.getQuoteByIdUsecase,
      this.getQuoteBySeriesUsecase, this.getQuoteByRandom, this.getQuatosByRandomAutherUsecase)
      : super(BreakingBadInitial());

  final GetQuatosUsecase getQuatosUsecase;
  final GetQuoteByIdUsecase getQuoteByIdUsecase;
  final GetQuoteBySeriesUsecase getQuoteBySeriesUsecase;
  final GetQuoteByRandom getQuoteByRandom;
  final GetQuatosByRandomAutherUsecase getQuatosByRandomAutherUsecase;

  getQuotes() async {
    emit(BreakingBadQuoteLoader());
    var res = await getQuatosUsecase.call(NoParams());
    res.fold((l) {
      print('this is error ${l}');
      if(l is ServerFailure){
        l.code;
        print(l.code);
      }
      emit(BreakingBadFail());
    }, (r) {
      emit(BreakingBadQuoteSuccess(r));
    });
  }

  getQuotesByid(int quoteid) async {
    emit(BreakingBadQuoteLoader());
    var res = await getQuoteByIdUsecase.call(IdParams(id: quoteid));
    res.fold((l) {
      emit(BreakingBadFail());
    }, (r) {

      emit(BreakingBadQuoteSuccess(r));
    });
  }

  getQuotesByseries(String series) async {
    emit(BreakingBadQuoteLoader());
    var res = await getQuoteBySeriesUsecase.call(SrParams(seriesname: series));
    res.fold((l) {
      emit(BreakingBadFail());
    }, (r) {

      emit(BreakingBadQuoteSuccess(r));
    });
  }

  void serch(a) {
    if (a == 0) {

      emit(serchInActive());
    } else {

      emit(serchActive());
    }
  }

  checkNumStr(String data) {
    var b = RegExp(r'^[0-9]+$').hasMatch(data);
    if (b == true) {
      getQuotesByid(int.parse(data));
    } else {
      getQuotesByseries(data);
    }
  }



  getQuoteByrandom()async{
    emit(BreakingBadQuoteLoader());
    var res = await getQuoteByRandom.call(NoParams());
    res.fold((l) {
      emit(BreakingBadFail());
    }, (r) {

      emit(BreakingBadQuoteSuccess(r));
    });
  }


  getQuotesSeriesByranom(String series)async{
    emit(BreakingBadQuoteLoader());

    var res = await getQuatosByRandomAutherUsecase.call(SrParams(seriesname: series));
    res.fold((l) {
      emit(BreakingBadFail());
    }, (r) {
      print("this ${r.toString()}");
      emit(BreakingBadQuoteSuccess(r));
    });
  }
}
