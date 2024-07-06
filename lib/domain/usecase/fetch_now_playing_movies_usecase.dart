import 'package:we_movies/core/helpers/helpers.dart';
import 'package:we_movies/domain/entity/entity.dart';
import 'package:we_movies/domain/repository/repository.dart';

sealed class FetchNowPlayingMoviesUsecase {
  Future<Responser<List<MovieEntity>?>> call({
    int page = 1,
  });
}

class FetchNowPlayingMoviesUsecaseImpl implements FetchNowPlayingMoviesUsecase {
  final MoviesRepository moviesReposiotry;
  const FetchNowPlayingMoviesUsecaseImpl(this.moviesReposiotry);
  @override
  Future<Responser<List<MovieEntity>?>> call({int page = 1}) {
    return moviesReposiotry.fetchNowPlayingMovies(page: page);
  }
}
