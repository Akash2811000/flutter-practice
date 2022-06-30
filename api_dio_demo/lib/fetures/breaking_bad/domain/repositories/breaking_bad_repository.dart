import 'package:api_dio_demo/core/error/failure.dart';
import 'package:api_dio_demo/fetures/breaking_bad/data/model/QuoteModel.dart';
import 'package:dartz/dartz.dart';
abstract class BreakingBadRepository{
  Future<Either<Failure,List<QuoteModel>>> getQuatos();
  Future<Either<Failure,List<QuoteModel>>> getQuatosbyId(int quotid);
  Future<Either<Failure,List<QuoteModel>>> getQuatosbyRandom();
  Future<Either<Failure,List<QuoteModel>>> getQuatosbyseries(String seriesname);


}