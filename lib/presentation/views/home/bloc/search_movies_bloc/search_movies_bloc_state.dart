import 'package:we_movies/domain/entity/entity.dart';

abstract class SearchMoviesBlocState {
  const SearchMoviesBlocState();
}

class EmptySearchMoviesInput extends SearchMoviesBlocState {
  final String? message;
  EmptySearchMoviesInput(this.message);
}

class SearchingMovies extends SearchMoviesBlocState {
  final String? message;
  SearchingMovies(this.message);
}

class EmptySearchMoviesResult extends SearchMoviesBlocState {
  final String? message;
  EmptySearchMoviesResult(this.message);
}

class FailedMoviesSearch extends SearchMoviesBlocState {
  final String message;
  FailedMoviesSearch(this.message);
}

class MoviesSearched extends SearchMoviesBlocState {
  final List<MovieEntity>? topRatedMovies;
  final List<MovieEntity>? nowPlayingMovies;
  MoviesSearched({
    this.topRatedMovies,
    this.nowPlayingMovies,
  });
}
