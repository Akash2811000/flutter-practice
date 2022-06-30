import 'package:api_dio_node_demo/core/error/failure.dart';
import 'package:api_dio_node_demo/fetures/emp_std_api/data/remote/models/StudentModel.dart';
import 'package:dio/dio.dart';

abstract class StudentDataSource {
  Future<List<StudentModel>> getAllStudentdatasource();
}



class StudentDataSourceImpl implements StudentDataSource{
 final Dio apiclient;

  StudentDataSourceImpl(this.apiclient);
  @override
  Future<List<StudentModel>> getAllStudentdatasource() async{
    // try {
    //   final response = await apiclient.get('http://127.0.0.1:3000/students');
    //   if (response.statusCode == 200) {
    //     final List<StudentModel> studentlist = [];
    //     final jsonlist = response.data;
    //     for (var item in jsonlist) {
    //       studentlist.add(StudentModel.fromJson(item));
    //     }
    //
    //     return (studentlist);
    //   } else {
    //     throw SocketException('msg');
    //     // return (ServerFailure());
    //   }
    // } on DioError catch (error) {
    //   if (error.type == DioErrorType.connectTimeout) {
    //     throw SocketException(error.message);
    //   } else {
    //     throw SocketException(error.message);
    //   }
    // } catch (exception) {
    //   throw ServerException(exception.toString());
    // }
    print("datas");
    throw ServerException("exception");
  }
}