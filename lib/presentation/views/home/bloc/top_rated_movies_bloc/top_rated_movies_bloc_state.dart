import 'package:we_movies/domain/entity/entity.dart';

abstract class TopRatedMoviesBlocState {
  const TopRatedMoviesBlocState();
}

class TopRatedMoviesInitial extends TopRatedMoviesBlocState {
  final String? message;
  TopRatedMoviesInitial(this.message);
}

class TopRatedMoviesLoading extends TopRatedMoviesBlocState {
  final String? message;
  TopRatedMoviesLoading(this.message);
}

class TopRatedMoviesEmpty extends TopRatedMoviesBlocState {
  final String? message;
  TopRatedMoviesEmpty(this.message);
}

class TopRatedMoviesFailed extends TopRatedMoviesBlocState {
  final String message;
  TopRatedMoviesFailed(this.message);
}

class TopRatedMoviesLoaded extends TopRatedMoviesBlocState {
  final List<MovieEntity> movies;
  final int page;
  TopRatedMoviesLoaded(
    this.movies,
    this.page,
  );
}
