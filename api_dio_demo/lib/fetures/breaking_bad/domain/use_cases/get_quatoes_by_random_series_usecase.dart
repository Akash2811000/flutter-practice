import 'package:api_dio_demo/core/error/failure.dart';
import 'package:api_dio_demo/core/usecase/usecase.dart';
import 'package:api_dio_demo/fetures/breaking_bad/data/model/QuoteModel.dart';
import 'package:api_dio_demo/fetures/breaking_bad/domain/repositories/breaking_bad_repository.dart';
import 'package:api_dio_demo/fetures/breaking_bad/domain/use_cases/get_quotes_by_series_usecase.dart';
import 'package:dartz/dartz.dart';

class GetQuatosByRandomAutherUsecase extends UseCase<List<QuoteModel>,SrParams> {
  final BreakingBadRepository breakingBadRepository;

  GetQuatosByRandomAutherUsecase(this.breakingBadRepository);

  @override
  Future<Either<Failure, List<QuoteModel>>> call(SrParams params) async{
    return await breakingBadRepository.getQuatosbyRandomauther(params.seriesname);
  }

}