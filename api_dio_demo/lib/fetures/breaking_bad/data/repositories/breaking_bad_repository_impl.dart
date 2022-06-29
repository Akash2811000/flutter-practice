

import 'package:api_dio_demo/core/error/failure.dart';
import 'package:api_dio_demo/fetures/breaking_bad/data/model/QuoteModel.dart';
import 'package:api_dio_demo/fetures/breaking_bad/data/remote/data_sources/breaking_bad_remote_datasource.dart';
import 'package:api_dio_demo/fetures/breaking_bad/domain/repositories/breaking_bad_repository.dart';
import 'package:dartz/dartz.dart';

class BreakingBadRepositoryImpl implements BreakingBadRepository {
BreakingBadRemoteDatasource breakingBadRemoteDatasource;

  BreakingBadRepositoryImpl(this.breakingBadRemoteDatasource);

  @override
  Future<Either<Failure, List<QuoteModel>>> getQuatos() async {
    print('repo');
    await breakingBadRemoteDatasource.getQuaoteDatasource();
    try {
     final res = await breakingBadRemoteDatasource.getQuaoteDatasource();
     print('this is');
     print(res);
      return Right(res);
    } catch (e) {
      print('fail rep');
      return Left(ServerFailure());
    }
  }
}
