import 'package:we_movies/domain/entity/entity.dart';

sealed class SearchMoviesBlocEvent {}

final class OnSearchMovies extends SearchMoviesBlocEvent {
  final String movieName;
  List<MovieEntity> topRatedMovies;
  List<MovieEntity> nowPlayingMovies;
  OnSearchMovies(
    this.movieName, {
    required this.topRatedMovies,
    required this.nowPlayingMovies,
  });
}

final class OnResetSearchMoviesInput extends SearchMoviesBlocEvent {
  OnResetSearchMoviesInput();
}
