import 'package:api_dio_demo/core/error/failure.dart';
import 'package:api_dio_demo/core/usecase/usecase.dart';
import 'package:api_dio_demo/fetures/breaking_bad/data/model/QuoteModel.dart';
import 'package:api_dio_demo/fetures/breaking_bad/domain/repositories/breaking_bad_repository.dart';
import 'package:dartz/dartz.dart';

class GetQuoteByRandom extends UseCase<List<QuoteModel>,NoParams>{
  final BreakingBadRepository breakingBadRepository;

  GetQuoteByRandom(this.breakingBadRepository);

  @override
  Future<Either<Failure, List<QuoteModel>>> call(NoParams params)async {
    return await breakingBadRepository.getQuatosbyRandom();
  }
}