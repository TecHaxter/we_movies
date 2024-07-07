import 'package:we_movies/domain/entity/entity.dart';

abstract class NowPlayingMoviesBlocState {
  const NowPlayingMoviesBlocState();
}

class NowPlayingMoviesInitial extends NowPlayingMoviesBlocState {
  final String? message;
  NowPlayingMoviesInitial(
    this.message,
  );
}

class NowPlayingMoviesLoading extends NowPlayingMoviesBlocState {
  final String? message;
  final int loadingCount;
  NowPlayingMoviesLoading(
    this.message,
    this.loadingCount,
  );
}

class NowPlayingMoviesEmpty extends NowPlayingMoviesBlocState {
  final String? message;
  NowPlayingMoviesEmpty(this.message);
}

class NowPlayingMoviesFailed extends NowPlayingMoviesBlocState {
  final String message;
  NowPlayingMoviesFailed(this.message);
}

class NowPlayingMoviesLoaded extends NowPlayingMoviesBlocState {
  final List<MovieEntity> movies;
  final int page;
  NowPlayingMoviesLoaded(
    this.movies,
    this.page,
  );
}
