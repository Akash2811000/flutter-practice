import 'package:api_dio_demo/core/error/exception.dart';
import 'package:api_dio_demo/core/error/failure.dart';
import 'package:api_dio_demo/fetures/breaking_bad/data/model/QuoteModel.dart';
import 'package:api_dio_demo/utils/constant.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class BreakingBadRemoteDatasource {
  Future< List<QuoteModel>> getQuaoteDatasource();
}

class BreakingBadRemoteDatasourceImpl implements BreakingBadRemoteDatasource {
  final Dio apiclient;

  BreakingBadRemoteDatasourceImpl(this.apiclient);

  @override
  Future<List<QuoteModel>> getQuaoteDatasource() async {
    print('datasource');
    try {
      final response =
          await apiclient.get('${Constant.baseurl}/api/quotes');
      if (response.statusCode == 200) {
        final List<QuoteModel>quateslist = [];
        final jsonlist = response.data;
        for (var item in jsonlist) {
          quateslist.add(QuoteModel.fromJson(item));
          print(item);
        }
        print(quateslist);
        return (quateslist);
      } else {
        throw SocketException('msg');
        // return (ServerFailure());
      }
    } on DioError catch (error) {
      if (error.type == DioErrorType.connectTimeout) {
         throw SocketException(error.message);
      }else{
        throw SocketException(error.message);
      }
    } catch (exception) {
       throw ServerException(exception.toString());
    }

  }










}
