
import 'package:api_dio_node_demo/fetures/emp_std_api/data/remote/data_sources/student_datasource.dart';
import 'package:api_dio_node_demo/fetures/emp_std_api/data/repositories/student_repo_impl.dart';
import 'package:api_dio_node_demo/fetures/emp_std_api/domain/repositories/student_repo.dart';
import 'package:api_dio_node_demo/fetures/emp_std_api/domain/use_cases/create_student_usecase.dart';
import 'package:api_dio_node_demo/fetures/emp_std_api/domain/use_cases/delete_student_usecase.dart';
import 'package:api_dio_node_demo/fetures/emp_std_api/domain/use_cases/get_all_student_usecase.dart';
import 'package:api_dio_node_demo/fetures/emp_std_api/domain/use_cases/upadate_student_usecase.dart';
import 'package:api_dio_node_demo/fetures/emp_std_api/presentation/cubit/stddata_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

var sl = GetIt.instance;

Future<void> init() async{

  sl.registerFactory(() => StddataCubit(sl(),sl(),sl(),sl()));

  sl.registerLazySingleton<StudentDataSource>(() => StudentDataSourceImpl(sl()));
  sl.registerLazySingleton<StudentRepo>(() => StudentRepoImpl(sl()));

  sl.registerLazySingleton(() => GetAllStudentUsecase(sl()));
  sl.registerLazySingleton(() => CreateStudentUsecase(sl()));
  sl.registerLazySingleton(() => DeleteStudentUsecase(sl()));
  sl.registerLazySingleton(() => UpdateStudentUsecase(sl()));

  sl.registerLazySingleton(() => Dio());


}