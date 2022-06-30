import 'package:api_dio_demo/core/error/failure.dart';
import 'package:api_dio_demo/core/usecase/usecase.dart';
import 'package:api_dio_demo/fetures/breaking_bad/data/model/QuoteModel.dart';
import 'package:api_dio_demo/fetures/breaking_bad/domain/repositories/breaking_bad_repository.dart';
import 'package:dartz/dartz.dart';

class GetQuoteBySeriesUsecase extends UseCase<List<QuoteModel>,SrParams>{
  final BreakingBadRepository breakingBadRepository;

  GetQuoteBySeriesUsecase(this.breakingBadRepository);
  @override
  Future<Either<Failure, List<QuoteModel>>> call(SrParams params) async{
    return await breakingBadRepository.getQuatosbyseries(params.seriesname);
  }

}

class  SrParams{
  final String seriesname;

  SrParams(this.seriesname);

}