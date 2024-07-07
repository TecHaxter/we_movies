import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:we_movies/core/helpers/helpers.dart';
import 'package:we_movies/domain/entity/entity.dart';
import 'package:we_movies/presentation/views/home/bloc/bloc.dart';
import 'package:we_movies/presentation/views/home/widgets/widgets.dart';

class TopRatedMoviesComponentWidget extends StatelessWidget {
  const TopRatedMoviesComponentWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TopRatedMoviesBloc, TopRatedMoviesBlocState>(
      listener: (context, state) {
        String error = '';
        if (state is TopRatedMoviesFailed) {
          error = 'Error occurred while fetching top rated movies'.hardcoded;
        } else if (state is TopRatedMoviesEmpty) {
          error = 'No top rated movies found'.hardcoded;
        }
        if (error.isEmpty) {
          return;
        }
        final snackBar = SnackBar(
          content: Text(error),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      buildWhen: (previous, current) =>
          (previous is TopRatedMoviesLoading &&
              current is TopRatedMoviesLoaded) ||
          (previous is TopRatedMoviesInitial &&
              current is TopRatedMoviesLoading),
      builder: (context, topRatedBlocState) {
        return BlocBuilder<SearchMoviesBloc, SearchMoviesBlocState>(
          buildWhen: (previous, current) =>
              current is SearchingMovies ||
              current is MoviesSearched ||
              current is EmptySearchMoviesInput,
          builder: (context, searchBlocState) {
            List<MovieEntity> movies = [];
            if (searchBlocState is MoviesSearched) {
              movies = searchBlocState.topRatedMovies ?? [];
            } else if (searchBlocState is SearchingMovies) {
              movies = [];
            } else {
              movies = topRatedBlocState is TopRatedMoviesLoaded
                  ? topRatedBlocState.movies
                  : [];
            }
            return ListView.separated(
              itemCount: movies.isEmpty ? 2 : movies.length + 1,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
              ),
              separatorBuilder: (context, index) => SizedBox(
                height: 8.h,
              ),
              itemBuilder: (context, index) => TopRatedMovieInfoCardWidget(
                movie: (movies.length - 1) >= index ? movies[index] : null,
              ),
            );
          },
        );
      },
    );
  }
}
