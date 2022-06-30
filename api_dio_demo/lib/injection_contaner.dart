import 'package:api_dio_demo/fetures/breaking_bad/data/remote/data_sources/breaking_bad_remote_datasource.dart';
import 'package:api_dio_demo/fetures/breaking_bad/data/repositories/breaking_bad_repository_impl.dart';
import 'package:api_dio_demo/fetures/breaking_bad/domain/repositories/breaking_bad_repository.dart';
import 'package:api_dio_demo/fetures/breaking_bad/domain/use_cases/get_quatoes_by_random_series_usecase.dart';
import 'package:api_dio_demo/fetures/breaking_bad/domain/use_cases/get_quatos_usecase.dart';
import 'package:api_dio_demo/fetures/breaking_bad/domain/use_cases/get_quote_byid_usecase.dart';
import 'package:api_dio_demo/fetures/breaking_bad/domain/use_cases/get_quotes_by_random_usecase.dart';
import 'package:api_dio_demo/fetures/breaking_bad/domain/use_cases/get_quotes_by_series_usecase.dart';
import 'package:api_dio_demo/fetures/breaking_bad/presentation/cubit/breaking_bad_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

var sl = GetIt.instance;

Future<void> init() async {
  //cubit
  sl.registerFactory(() => BreakingBadCubit(sl(),sl(),sl(),sl(),sl()));
  //repo
  sl.registerLazySingleton<BreakingBadRemoteDatasource>(() => BreakingBadRemoteDatasourceImpl(sl()));
  sl.registerLazySingleton<BreakingBadRepository>(() => BreakingBadRepositoryImpl(sl()));

  // //usecase
  sl.registerLazySingleton(() => GetQuatosUsecase(sl()));
  sl.registerLazySingleton(() => GetQuoteByIdUsecase(sl()));
  sl.registerLazySingleton(() => GetQuoteBySeriesUsecase(sl()));
  sl.registerLazySingleton(() => GetQuoteByRandom(sl()));
  sl.registerLazySingleton(() => GetQuatosByRandomAutherUsecase(sl()));

  sl.registerLazySingleton(() => Dio());

}