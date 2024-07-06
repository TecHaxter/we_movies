import 'package:dio/dio.dart';
import 'package:we_movies/core/helpers/helpers.dart';

sealed class MoviesDataSource {
  Future<Responser<Map<String, dynamic>>> fetchTopRatedMovies({int page = 1});
  Future<Responser<Map<String, dynamic>>> fetchNowPlayingMovies({int page = 1});
}

class MoviesDataSourceImpl implements MoviesDataSource {
  final Dio dio;
  const MoviesDataSourceImpl(this.dio);
  @override
  Future<Responser<Map<String, dynamic>>> fetchTopRatedMovies(
      {int page = 1}) async {
    try {
      final res = await dio.get(
        'movie/now_playing',
        queryParameters: {
          'page': page,
        },
      );
      if (res.statusCode != 200) {
        throw res.statusMessage ?? 'Status Code Error: ${res.statusCode}';
      }

      return success(
        Map.from(res.data as Map),
      );
    } catch (e) {
      return failed(e.toString());
    }
  }

  @override
  Future<Responser<Map<String, dynamic>>> fetchNowPlayingMovies(
      {int page = 1}) async {
    try {
      final res = await dio.get(
        'movie/now_playing',
        queryParameters: {
          'page': page,
        },
      );
      if (res.statusCode != 200) {
        throw res.statusMessage ?? 'Status Code Error: ${res.statusCode}';
      }
      return success(
        Map.from(res.data as Map),
      );
    } catch (e) {
      return failed(e.toString());
    }
  }
}
