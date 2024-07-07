import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:we_movies/core/helpers/helpers.dart';
import 'package:we_movies/presentation/views/home/bloc/bloc.dart';

class SearchMoviesBloc
    extends Bloc<SearchMoviesBlocEvent, SearchMoviesBlocState> {
  SearchMoviesBloc()
      : super(
          EmptySearchMoviesInput(
            'Initial state',
          ),
        ) {
    on<OnSearchMovies>(
      (event, emit) async {
        try {
          emit(
            SearchingMovies('Searching movies'),
          );
          final nowPlayingMovies = event.nowPlayingMovies
              .where((e) => e.title?.contains(event.movieName) ?? false)
              .toList();
          final topRatedMovies = event.topRatedMovies
              .where((e) => e.title?.contains(event.movieName) ?? false)
              .toList();
          emit(
            MoviesSearched(
              nowPlayingMovies: nowPlayingMovies,
              topRatedMovies: topRatedMovies,
            ),
          );
        } catch (e) {
          emit(
            FailedMoviesSearch('Searching failed!'),
          );
        }
      },
      transformer: debounceTransformer(const Duration(milliseconds: 300)),
    );
    on<OnResetSearchMoviesInput>(
      (event, emit) async {
        emit(
          EmptySearchMoviesInput('Input reset'),
        );
      },
      transformer: debounceTransformer(const Duration(milliseconds: 300)),
    );
  }

  @override
  void onChange(Change<SearchMoviesBlocState> change) {
    log("Search Movies Bloc State: ${change.currentState}");
    super.onChange(change);
  }
}
