import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:we_movies/core/constants/constants.dart';
import 'package:we_movies/domain/entity/entity.dart';
import 'package:we_movies/presentation/views/home/bloc/bloc.dart';

class SearchMoviesTextBoxWidget extends StatefulWidget {
  const SearchMoviesTextBoxWidget({super.key});

  @override
  State<SearchMoviesTextBoxWidget> createState() =>
      _SearchMoviesTextBoxWidgetState();
}

class _SearchMoviesTextBoxWidgetState extends State<SearchMoviesTextBoxWidget> {
  late TextEditingController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TextEditingController()
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
      ),
      child: BlocBuilder<NowPlayingMoviesBloc, NowPlayingMoviesBlocState>(
          buildWhen: (previous, current) =>
              (previous is NowPlayingMoviesLoading &&
                  current is NowPlayingMoviesLoaded),
          builder: (context, nowPlayingState) {
            final nowPlayingMovies = (nowPlayingState is NowPlayingMoviesLoaded)
                ? nowPlayingState.movies
                : <MovieEntity>[];
            return BlocBuilder<TopRatedMoviesBloc, TopRatedMoviesBlocState>(
                buildWhen: (previous, current) =>
                    (previous is TopRatedMoviesLoading &&
                        current is TopRatedMoviesLoaded),
                builder: (context, topRatedState) {
                  final topRatedMovies = (topRatedState is TopRatedMoviesLoaded)
                      ? topRatedState.movies
                      : <MovieEntity>[];
                  return TextFormField(
                    controller: controller,
                    onChanged: (value) {
                      if (value.isEmpty) {
                        context.read<SearchMoviesBloc>().add(
                              OnResetSearchMoviesInput(),
                            );
                        return;
                      }
                      context.read<SearchMoviesBloc>().add(
                            OnSearchMovies(
                              value,
                              topRatedMovies: topRatedMovies,
                              nowPlayingMovies: nowPlayingMovies,
                            ),
                          );
                    },
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 10.h,
                        horizontal: 8.r,
                      ),
                      fillColor: AppColors.cultured,
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                        borderRadius: BorderRadius.circular(
                          24.r,
                        ),
                      ),
                      labelText: 'Search Movies by name...',
                      labelStyle: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w300,
                      ),
                      hintText: 'Once upon a time in hollywood',
                      hintStyle: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w300,
                        color: AppColors.nickle.withOpacity(0.5),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      prefixIcon: const Icon(
                        Icons.search,
                      ),
                      suffixIcon: controller.value.text.isEmpty
                          ? const SizedBox()
                          : InkWell(
                              onTap: () {
                                controller.clear();
                                context.read<SearchMoviesBloc>().add(
                                      OnResetSearchMoviesInput(),
                                    );
                              },
                              child: const Icon(
                                Icons.close,
                              ),
                            ),
                    ),
                  );
                });
          }),
    );
  }
}
