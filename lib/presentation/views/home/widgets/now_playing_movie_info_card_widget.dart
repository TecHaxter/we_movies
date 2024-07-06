import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:we_movies/core/constants/constants.dart';
import 'package:we_movies/core/helpers/helpers.dart';
import 'package:we_movies/presentation/views/home/widgets/widgets.dart';
import 'package:we_movies/presentation/views/widgets/widgets.dart';

class NowPlayingMovieInfoCardWidget extends StatelessWidget {
  final int index;
  const NowPlayingMovieInfoCardWidget({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: index == 0 ? 16.w : 0.0,
        right: index == 29 ? 16.w : 0.0,
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
        clipBehavior: Clip.hardEdge,
        child: Container(
          width: 338.w,
          height: double.maxFinite,
          color: Colors.amber,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 8.h,
                  right: 8.h,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    BlurredChipWidget(
                      child: Row(
                        children: [
                          Icon(
                            Icons.remove_red_eye_outlined,
                            color: AppColors.pureWhite,
                            size: 18.sp,
                          ),
                          SizedBox(
                            width: 4.w,
                          ),
                          Text(
                            "716".hardcoded,
                            style: TextStyle(
                              color: AppColors.pureWhite,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    BlurredChipWidget(
                      child: Icon(
                        Icons.heart_broken,
                        color: AppColors.pureWhite,
                        size: 18.sp,
                      ),
                    ),
                  ],
                ),
              ),
              ClipPath(
                clipper: WeMoviesTopRatedCutOutBoxClipperWidget(
                  curveRadius: 20,
                  topLeftCutOutSize: Size(
                    200.w,
                    32.h,
                  ),
                ),
                child: Container(
                  width: double.infinity,
                  color: Colors.blue,
                  padding: EdgeInsets.only(
                    right: 16.w,
                    top: 8.w,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.language_outlined,
                            color: AppColors.pureWhite,
                            size: 16.sp,
                          ),
                          SizedBox(
                            width: 4.w,
                          ),
                          Text(
                            "English".hardcoded,
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: AppColors.pureWhite,
                            ),
                          ),
                        ],
                      ),
                      const MovieDetailsWidget(
                        isBackgroundBlurred: true,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
