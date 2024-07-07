import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:we_movies/core/constants/constants.dart';
import 'package:we_movies/presentation/views/home/bloc/bloc.dart';
import 'package:we_movies/presentation/views/widgets/widgets.dart';

class NowPlayingMoviesFetchCountBannerWidget extends StatelessWidget {
  const NowPlayingMoviesFetchCountBannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
      ),
      child: ClipPath(
        clipper: WeMoviesTopRatedCutOutBoxClipperWidget(
          curveRadius: 24,
          topLeftCutOutSize: Size(
            160.w,
            40.h,
          ),
          bottomRightCutOutSize: Size(
            60.w,
            60.h,
          ),
        ),
        child: Container(
          width: double.infinity,
          height: 124.h,
          decoration: BoxDecoration(
            gradient: AppGradients.darkMuted,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 16.h,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "We Movies",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              BlocBuilder<NowPlayingMoviesBloc, NowPlayingMoviesBlocState>(
                builder: (context, state) {
                  if (state is NowPlayingMoviesLoaded) {
                    return Text(
                      "${state.movies.length} Movies are loaded in now playing",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    );
                  } else if (state is NowPlayingMoviesLoading ||
                      state is NowPlayingMoviesInitial) {
                    return Text(
                      "Fetching now playing movies..",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    );
                  }
                  return Text(
                    "Error occurred while fetching now playing movies",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
