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
  Future<Responser<List<MovieEntity>?>> call({int page = 1}) async {
    try {
      final moviesRes =
          await moviesReposiotry.fetchNowPlayingMovies(page: page);
      final movies = moviesRes.fold((l) => null, (r) => r);
      if (moviesRes.isLeft() || movies == null) {
        throw 'Could not fetch now playing movies';
      }
      moviesReposiotry.putNowPlayingMoviesInCache(movies: movies);
      return success(movies);
    } catch (e) {
      if (page == 1) {
        return moviesReposiotry.getNowPlayingMoviesFromCache();
      }
      return failed(e.toString());
    }
  }
}
