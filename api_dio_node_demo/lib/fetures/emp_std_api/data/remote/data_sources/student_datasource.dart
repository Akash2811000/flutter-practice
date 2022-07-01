import 'package:api_dio_node_demo/core/error/failure.dart';
import 'package:api_dio_node_demo/fetures/emp_std_api/data/remote/models/StudentModel.dart';
import 'package:dio/dio.dart';

abstract class StudentDataSource {
  Future<List<StudentModel>> getAllStudentdatasource();

  Future<List<StudentModel>> createStudentDatasource(StudentModel studentModel);
  Future<List<StudentModel>> updateStudentDatasource(StudentModel studentModel,int studentid);

  Future<List<StudentModel>> deleteStudentDatasource(int studentid);
}

class StudentDataSourceImpl implements StudentDataSource {
  final Dio apiclient;

  StudentDataSourceImpl(this.apiclient);

  @override
  Future<List<StudentModel>> getAllStudentdatasource() async {
    try {
      print("datasource impl");
      //final baseurl = 'http://10.0.2.2:3000/students';
      //final baseurl = 'http://192.168.0.100:3000/students';
      final baseurl = 'http://192.168.102.79:3000/students';
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
    final baseurl = 'http://192.168.102.79:3000/students';
    // final baseurl = 'http://192.168.0.100:3000/students';
    try {
      Response response = await apiclient.post(
        baseurl,
        data: studentModel.toJson(),
      );
      Response responseData = await apiclient.get(baseurl);

      if (responseData.statusCode == 200 && response.statusCode == 200) {
        final List<StudentModel> studentlist = [];
        final jsonlist = responseData.data;
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

  @override
  Future<List<StudentModel>> deleteStudentDatasource(int studentid) async {
    final baseurl = 'http://192.168.102.79:3000/students';
    try {
      Response response = await apiclient.delete('${baseurl}/${studentid}');
      Response responseData = await apiclient.get(baseurl);

      if (responseData.statusCode == 200 && response.statusCode == 200) {
        final List<StudentModel> studentlist = [];
        final jsonlist = responseData.data;
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

  @override
  Future<List<StudentModel>> updateStudentDatasource(StudentModel studentModel, int studentid) async{
    final baseurl = 'http://192.168.102.79:3000/students';
    try {
      var newStudentmodel = {
        "name" : studentModel.name,
        "address" : studentModel.address
      };
      Response response = await apiclient.put('${baseurl}/${studentid}',data: newStudentmodel);
      print('this is studentid ${studentid}');
      print('this new ${newStudentmodel}');
      print('this is response date ${response.data}');
      Response responseData = await apiclient.get(baseurl);

      if (responseData.statusCode == 200 && response.statusCode == 200) {
        final List<StudentModel> studentlist = [];
        final jsonlist = responseData.data;
        for (var item in jsonlist) {
          studentlist.add(StudentModel.fromJson(item));
        }
        print('updated $studentlist');
        return (studentlist);
      } else {
        throw SocketException('msg');
        // return (ServerFailure());
      }

    }

    on DioError catch (error) {
      if (error.type == DioErrorType.connectTimeout) {
        throw SocketException(error.message);
      } else {
        throw SocketException(error.message);
      }
    }catch (exception) {
      throw ServerException(exception.toString());
    }

  }
}
