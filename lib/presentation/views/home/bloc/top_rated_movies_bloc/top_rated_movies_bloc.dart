import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:we_movies/core/helpers/helpers.dart';
import 'package:we_movies/domain/entity/entity.dart';
import 'package:we_movies/domain/usecase/usecase.dart';
import 'package:we_movies/presentation/views/home/bloc/bloc.dart';
import 'package:we_movies/presentation/views/home/bloc/top_rated_movies_bloc/top_rated_movies_bloc_state.dart';

class TopRatedMoviesBloc
    extends Bloc<TopRatedMoviesBlocEvent, TopRatedMoviesBlocState> {
  final FetchTopRatedMoviesUsecase fetchTopRatedMoviesUsecase;

  TopRatedMoviesBloc(this.fetchTopRatedMoviesUsecase)
      : super(
          TopRatedMoviesInitial(
            'Initial state',
          ),
        ) {
    on<OnFetchTopRatedMovies>(
      (event, emit) async {
        List<MovieEntity>? movies;
        int page = 1;
        if (state is TopRatedMoviesLoaded) {
          movies = (state as TopRatedMoviesLoaded).movies;
          page = (state as TopRatedMoviesLoaded).page + 1;
        }
        emit(TopRatedMoviesLoading(
          'Wait while we fetch more movies for you',
        ));
        final res = await fetchTopRatedMoviesUsecase.call(
          page: page,
        );
        final data = res.fold((l) => null, (r) => r);
        TopRatedMoviesBlocState? errorState;
        if (res.isLeft()) {
          errorState = TopRatedMoviesFailed(
            'Error occurred while fetching movies',
          );
        } else if (data?.isEmpty ?? true) {
          errorState = TopRatedMoviesEmpty(
            'Error occurred while fetching movies',
          );
        }
        if (errorState != null) {
          emit(errorState);
          await Future.delayed(const Duration(seconds: 2));
        }
        movies ??= [];
        movies.addAll(data ?? []);
        if (movies.isNotEmpty) {
          emit(TopRatedMoviesLoaded(
            movies,
            page,
          ));
        }
      },
      transformer: debounceTransformer(const Duration(milliseconds: 300)),
    );
    on<OnResetTopRatedMovies>(
      (event, emit) {
        emit(TopRatedMoviesInitial('Reseting state'));
      },
      transformer: debounceTransformer(const Duration(milliseconds: 300)),
    );
  }

  @override
  void onChange(Change<TopRatedMoviesBlocState> change) {
    log("Top Rated Movies Bloc State: ${change.currentState}");
    super.onChange(change);
  }
}
