import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:we_movies/core/helpers/helpers.dart';
import 'package:we_movies/domain/entity/entity.dart';
import 'package:we_movies/presentation/views/home/bloc/bloc.dart';
import 'package:we_movies/presentation/views/home/widgets/widgets.dart';

class NowPlayingMoviesComponentWidget extends StatelessWidget {
  final ScrollController scrollController;
  const NowPlayingMoviesComponentWidget({
    super.key,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 394.h,
      child: BlocConsumer<NowPlayingMoviesBloc, NowPlayingMoviesBlocState>(
        listener: (context, state) {
          String error = '';
          if (state is NowPlayingMoviesFailed) {
            error =
                'Error occurred while fetching now playing movies'.hardcoded;
          } else if (state is NowPlayingMoviesEmpty) {
            error = 'No now playing movies found'.hardcoded;
          }
          if (error.isEmpty) {
            return;
          }
          final snackBar = SnackBar(
            content: Text(error),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        buildWhen: (previous, current) {
          return (previous is NowPlayingMoviesLoading &&
                  current is NowPlayingMoviesLoaded) ||
              (previous is NowPlayingMoviesInitial &&
                  current is NowPlayingMoviesLoading);
        },
        builder: (contex, nowPlayingState) {
          return BlocBuilder<SearchMoviesBloc, SearchMoviesBlocState>(
            buildWhen: (previous, current) =>
                current is SearchingMovies ||
                current is MoviesSearched ||
                current is EmptySearchMoviesInput,
            builder: (context, searchBlocState) {
              List<MovieEntity> movies = [];
              if (searchBlocState is MoviesSearched) {
                movies = searchBlocState.nowPlayingMovies ?? [];
              } else if (searchBlocState is SearchingMovies) {
                movies = [];
              } else {
                movies = nowPlayingState is NowPlayingMoviesLoaded
                    ? nowPlayingState.movies
                    : [];
              }
              return ListView.separated(
                controller: scrollController,
                scrollDirection: Axis.horizontal,
                itemCount: movies.isEmpty ? 2 : movies.length + 1,
                separatorBuilder: (context, index) => SizedBox(
                  width: 16.w,
                ),
                itemBuilder: (context, index) => NowPlayingMovieInfoCardWidget(
                  index: index,
                  movie: (movies.length - 1) >= index ? movies[index] : null,
                  isLast:
                      index == ((movies.isEmpty ? 2 : movies.length + 1) - 1),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
