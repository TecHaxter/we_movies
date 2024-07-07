import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:we_movies/core/helpers/helpers.dart';
import 'package:we_movies/domain/entity/entity.dart';
import 'package:we_movies/domain/usecase/usecase.dart';
import 'package:we_movies/presentation/views/home/bloc/bloc.dart';

class NowPlayingMoviesBloc
    extends Bloc<NowPlayingMoviesBlocEvent, NowPlayingMoviesBlocState> {
  final FetchNowPlayingMoviesUsecase fetchUpcomingMoviesUsecase;

  NowPlayingMoviesBloc(this.fetchUpcomingMoviesUsecase)
      : super(
          NowPlayingMoviesInitial(
            'Initial state',
          ),
        ) {
    on<OnFetchNowPlayingMovies>(
      (event, emit) async {
        List<MovieEntity>? movies;
        int page = 1;
        if (state is NowPlayingMoviesLoaded) {
          movies = (state as NowPlayingMoviesLoaded).movies;
          page = (state as NowPlayingMoviesLoaded).page + 1;
        }
        emit(NowPlayingMoviesLoading(
          'Wait while we fetch more movies for you',
          15,
        ));
        final res = await fetchUpcomingMoviesUsecase.call(
          page: page,
        );
        final data = res.fold((l) => null, (r) => r);
        NowPlayingMoviesBlocState? errorState;
        if (res.isLeft()) {
          errorState = NowPlayingMoviesFailed(
            'Error occurred while fetching movies',
          );
        } else if (data?.isEmpty ?? true) {
          errorState = NowPlayingMoviesEmpty(
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
          emit(NowPlayingMoviesLoaded(
            movies,
            page,
          ));
        }
      },
      transformer: debounceTransformer(const Duration(milliseconds: 300)),
    );
  }

  @override
  void onChange(Change<NowPlayingMoviesBlocState> change) {
    log("Now Playing Movies Bloc State: ${change.currentState}");
    super.onChange(change);
  }
}
