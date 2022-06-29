import 'package:api_dio_demo/fetures/breaking_bad/data/model/QuoteModel.dart';

abstract class BreakingBadRemoteDatasource {
  Future<QuoteModel> getQuaoteDatasource();
}


class BreakingBadRemoteDatasourceImpl implements BreakingBadRemoteDatasource{
  @override
  Future<QuoteModel> getQuaoteDatasource() {
    // TODO: implement getQuaoteDatasource
    throw UnimplementedError();
  }

  // Future<Either<Failures, List<EpisodeModel>>> getAllEpisodesOfSeries(
  //     String seriesName) async {
  //   try {
  //     final response = await apiClient.get('$breakingBadApiBaseUrl/episodes',
  //         queryParameters: {'author': 'jesse Pinkman'});
  //     if (response.statusCode == 200) {
  //       final episodesList = <EpisodeModel>[];
  //       final jsonList = response.data;
  //       for (var item in jsonList) {
  //         episodesList.add(EpisodeModel.fromJson(item));
  //       }
  //       return Right(episodesList);
  //     } else {
  //       return Left(ServerException());
  //     }
  //   } on DioError catch (error) {
  //     if (error.type == DioErrorType.connectTimeout) {
  //       throw SocketException(error.message);
  //     }
  //   } catch (exception) {
  //     throw ServerException(exception: exception.toString());
  //   }
  //   return Left(ServerException(
  //       exception:
  //       'getAllEpisodesOfSeries : failed to get all episode of series.'));
  // }


}