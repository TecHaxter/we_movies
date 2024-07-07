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
  Future<Responser<List<MovieEntity>?>> call({int page = 1}) async {
    try {
      final moviesRes = await moviesReposiotry.fetchTopRatedMovies(page: page);
      final movies = moviesRes.fold((l) => null, (r) => r);
      if (moviesRes.isLeft() || movies == null) {
        throw 'Could not fetch top rated movies';
      }
      moviesReposiotry.putTopRatedMoviesInCache(movies: movies);
      return success(movies);
    } catch (e) {
      if (page == 1) {
        return moviesReposiotry.getTopRatedMoviesFromCache();
      }
      return failed(e.toString());
    }
  }
}
