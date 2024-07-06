import 'package:we_movies/core/helpers/helpers.dart';
import 'package:we_movies/domain/entity/entity.dart';

abstract class MoviesRepository {
  Future<Responser<List<MovieEntity>?>> fetchNowPlayingMovies({
    int page = 1,
  });
  Future<Responser<List<MovieEntity>?>> fetchTopRatedMovies({
    int page = 1,
  });
}
