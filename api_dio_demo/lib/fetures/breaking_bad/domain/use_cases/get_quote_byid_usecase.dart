import 'package:api_dio_demo/core/error/failure.dart';
import 'package:api_dio_demo/core/usecase/usecase.dart';
import 'package:api_dio_demo/fetures/breaking_bad/data/model/QuoteModel.dart';
import 'package:api_dio_demo/fetures/breaking_bad/domain/repositories/breaking_bad_repository.dart';
import 'package:dartz/dartz.dart';

class GetQuoteByIdUsecase extends UseCase<List<QuoteModel>,IdParams>{
  final BreakingBadRepository breakingBadRepository;

  GetQuoteByIdUsecase(this.breakingBadRepository);
  @override
  Future<Either<Failure, List<QuoteModel>>> call(IdParams params) async{
    return await breakingBadRepository.getQuatosbyId(params.id);
  }
  
}
class IdParams {

  final int id;

  IdParams({required this.id});

}