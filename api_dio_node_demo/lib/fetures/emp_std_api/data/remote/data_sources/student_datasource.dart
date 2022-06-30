import 'package:api_dio_node_demo/core/error/failure.dart';
import 'package:api_dio_node_demo/fetures/emp_std_api/data/remote/models/StudentModel.dart';
import 'package:dio/dio.dart';

abstract class StudentDataSource {
  Future<List<StudentModel>> getAllStudentdatasource();

  Future<List<StudentModel>> createStudentDatasource(
      StudentModel studentModel);
}

class StudentDataSourceImpl implements StudentDataSource {
  final Dio apiclient;

  StudentDataSourceImpl(this.apiclient);

  @override
  Future<List<StudentModel>> getAllStudentdatasource() async {
    try {
      print("datasource impl");
      //final baseurl = 'http://10.0.2.2:3000/students';
      final baseurl = 'http://192.168.0.100:3000/students';
      final response = await apiclient.get(baseurl);
      print('http://127.0.0.1:3000/students');
      print(response.data);
      if (response.statusCode == 200) {
        final List<StudentModel> studentlist = [];
        final jsonlist = response.data;
        for (var item in jsonlist) {
          studentlist.add(StudentModel.fromJson(item));
        }

        return (studentlist);
      } else {
        throw SocketException('msg');
        // return (ServerFailure());
      }
    } on DioError catch (error) {
      if (error.type == DioErrorType.connectTimeout) {
        throw SocketException(error.message);
      } else {
        throw SocketException(error.message);
      }
    } catch (exception) {
      throw ServerException(exception.toString());
    }
    print("datas");
    throw ServerException("exception");
  }

  @override
  Future<List<StudentModel>> createStudentDatasource(
      StudentModel studentModel) async {
    final baseurl = 'http://192.168.0.100:3000/students';
    try {
      Response response = await apiclient.post(
        baseurl,
        data: studentModel.toJson(),
      );

      if (response.statusCode == 200) {
        final List<StudentModel> studentlist = [];
        final jsonlist = response.data;
        for (var item in jsonlist) {
          studentlist.add(StudentModel.fromJson(item));
        }
        return (studentlist);
      } else {
        throw SocketException('msg');
        // return (ServerFailure());
      }
    } on DioError catch (error) {
      if (error.type == DioErrorType.connectTimeout) {
        throw SocketException(error.message);
      } else {
        throw SocketException(error.message);
      }
    } catch (exception) {
      throw ServerException(exception.toString());
    }
  }

// Future<StudentModel?> createStudentDatasource( StudentModel studentModel) async {
//   StudentModel? retrivestudent;
//   final baseurl = 'http://192.168.0.100:3000/students';
//   try {
//     Response response = await apiclient.post(
//       baseurl,
//       data: studentModel!.toJson(),
//     );
//
//     print('User created: ${response.data}');
//
//     retrivestudent = StudentModel.fromJson(response.data);
//   } catch (e) {
//     print('Error creating user: $e');
//   }
//
//   return retrivestudent;
// }
}
