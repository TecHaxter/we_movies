import 'package:we_movies/core/helpers/helpers.dart';
import 'package:we_movies/domain/entity/entity.dart';
import 'package:we_movies/domain/repository/repository.dart';

sealed class FetchTopRatedMoviesUsecase {
  Future<Responser<List<MovieEntity>?>> call({
    int page = 1,
  });
}

class FetchTopRatedMoviesUsecaseImpl implements FetchTopRatedMoviesUsecase {
  final MoviesRepository moviesReposiotry;
  const FetchTopRatedMoviesUsecaseImpl(this.moviesReposiotry);
  @override
  Future<Responser<List<MovieEntity>?>> call({int page = 1}) {
    return moviesReposiotry.fetchTopRatedMovies(page: page);
  }
}
