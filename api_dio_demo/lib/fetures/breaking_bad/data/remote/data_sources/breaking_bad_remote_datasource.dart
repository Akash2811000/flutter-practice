import 'package:api_dio_demo/core/error/exception.dart';
import 'package:api_dio_demo/core/error/failure.dart';
import 'package:api_dio_demo/fetures/breaking_bad/data/model/QuoteModel.dart';
import 'package:api_dio_demo/utils/constant.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class BreakingBadRemoteDatasource {
  Future<List<QuoteModel>> getQuaoteDatasource();

  Future<List<QuoteModel>> getQuaoteByidDatasource(int quateid);

  Future<List<QuoteModel>> getQuaoteByRandomDatasource();

  Future<List<QuoteModel>> getQuaoteByseriesDatasource(String series);

  Future<List<QuoteModel>> getQuaoteRandomByautherDatasource(String series);
}

class BreakingBadRemoteDatasourceImpl implements BreakingBadRemoteDatasource {
  final Dio apiclient;

  BreakingBadRemoteDatasourceImpl(this.apiclient);

  @override
  Future<List<QuoteModel>> getQuaoteDatasource() async {
    try {
      final response = await apiclient.get('${Constant.baseurl}/api/quotes');
      //final response = await apiclient.get('${Constant.baseurl}api/quotes');
      print("hello");
      if (response.statusCode == 200) {
        final List<QuoteModel> quateslist = [];
        final jsonlist = response.data;
        for (var item in jsonlist) {
          quateslist.add(QuoteModel.fromJson(item));
        }

        return (quateslist);
      } else {
        // throw SocketException('msg');
         throw ServerException;
      }
    } on DioError catch (error) {print(error);
      print('on');
      if (error.type == DioErrorType.connectTimeout) {
        print('if');
        throw SocketException(error.message);
      } else {
        print('else');
        throw ServerException(error.message);
      }
    }
  }

  @override
  Future<List<QuoteModel>> getQuaoteByidDatasource(int quateid) async {
    try {
      final response =
          await apiclient.get('${Constant.baseurl}/api/quotes/$quateid');
      if (response.statusCode == 200) {
        final List<QuoteModel> quateslist = [];
        final jsonlist = response.data;
        for (var item in jsonlist) {
          quateslist.add(QuoteModel.fromJson(item));
        }
        print("this is quoteslist $quateslist");
        return (quateslist);
      } else {
        throw SocketException('msg');
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
  Future<List<QuoteModel>> getQuaoteByseriesDatasource(String series) async {
    try {
      final response =
          await apiclient.get('${Constant.baseurl}/api/quotes?series=$series');

      if (response.statusCode == 200) {
        final List<QuoteModel> quateslist = [];
        final jsonlist = response.data;
        for (var item in jsonlist) {
          quateslist.add(QuoteModel.fromJson(item));
        }

        return (quateslist);
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
  Future<List<QuoteModel>> getQuaoteByRandomDatasource() async {
    try {
      final response =
          await apiclient.get('${Constant.baseurl}/api/quote/random');

      if (response.statusCode == 200) {
        final List<QuoteModel> quateslist = [];
        final jsonlist = response.data;
        for (var item in jsonlist) {
          quateslist.add(QuoteModel.fromJson(item));
        }

        return (quateslist);
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
  Future<List<QuoteModel>> getQuaoteRandomByautherDatasource(
      String series) async {
    print("ds called");
    try {
      final response =
          await apiclient.get('${Constant.baseurl}/api/quote/random?author=$series');
      print(response.realUri);
        print('this is rando auther response ${response.data}');
      if (response.statusCode == 200) {
        final List<QuoteModel> quateslist = [];
        final jsonlist = response.data;
        for (var item in jsonlist) {
          quateslist.add(QuoteModel.fromJson(item));
        }

        return (quateslist);
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
}
