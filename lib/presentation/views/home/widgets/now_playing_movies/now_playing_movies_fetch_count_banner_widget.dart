import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:we_movies/core/constants/constants.dart';
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
              Text(
                "22 Movies are loaded in now playing",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
