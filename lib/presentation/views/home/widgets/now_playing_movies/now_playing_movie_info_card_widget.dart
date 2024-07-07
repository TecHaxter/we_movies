import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:we_movies/core/constants/constants.dart';
import 'package:we_movies/core/helpers/helpers.dart';
import 'package:we_movies/domain/entity/entity.dart';
import 'package:we_movies/presentation/views/home/widgets/widgets.dart';
import 'package:we_movies/presentation/views/widgets/widgets.dart';

class NowPlayingMovieInfoCardWidget extends StatelessWidget {
  final int index;
  final bool isLast;
  final MovieEntity? movie;
  const NowPlayingMovieInfoCardWidget({
    super.key,
    required this.index,
    this.movie,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: index == 0 ? 16.w : 0.0,
        right: isLast ? 16.w : 0.0,
      ),
      child: InkWell(
        onTap: () => underDevelopment(context),
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
          child: movie == null
              ? const _ShimmerSkeleton()
              : Container(
                  width: 338.w,
                  height: double.maxFinite,
                  decoration: BoxDecoration(
                    color: AppColors.cultured.withOpacity(0.7),
                    image: (movie?.poster?.isNotEmpty ?? false)
                        ? DecorationImage(
                            image: CachedNetworkImageProvider(
                              movie!.poster!,
                            ),
                            fit: BoxFit.cover,
                          )
                        : null,
                  ),
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
                                    (movie?.popularity ?? 0)
                                        .smallKilloMillionBillion,
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
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 10,
                            sigmaY: 10,
                          ),
                          child: Container(
                            width: double.infinity,
                            color: AppColors.chineeseBlack.withOpacity(0.4),
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
                                      movie?.language ?? 'Not Available',
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        color: AppColors.pureWhite,
                                      ),
                                    ),
                                  ],
                                ),
                                MovieDetailsWidget(
                                  isBackgroundBlurred: true,
                                  movie: movie,
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}

class _ShimmerSkeleton extends StatelessWidget {
  const _ShimmerSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 338.w,
      height: double.maxFinite,
      decoration: BoxDecoration(
        color: AppColors.cultured.withOpacity(0.7),
      ),
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
                Shimmer(
                  gradient: AppGradients.shimmerTextLight,
                  child: Container(
                    width: 52.w,
                    height: 28.h,
                    decoration: BoxDecoration(
                      color: AppColors.cultured.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(
                        24.r,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 8.w,
                ),
                Shimmer(
                  gradient: AppGradients.shimmerTextLight,
                  child: Container(
                    width: 28.w,
                    height: 28.h,
                    decoration: BoxDecoration(
                      color: AppColors.cultured.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(
                        24.r,
                      ),
                    ),
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
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 10,
                sigmaY: 10,
              ),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.chineeseBlack.withOpacity(0.4),
                ),
                padding: EdgeInsets.only(
                  right: 16.w,
                  top: 8.w,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Shimmer(
                          gradient: AppGradients.shimmerTextDark,
                          child: Container(
                            width: 80.w,
                            height: 20.sp,
                            decoration: BoxDecoration(
                              color: AppColors.cultured.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(
                                24.r,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Shimmer(
                          gradient: AppGradients.shimmerTextDark,
                          child: Container(
                            width: 20.w,
                            height: 20.sp,
                            decoration: BoxDecoration(
                              color: AppColors.cultured.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(
                                24.r,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const MovieDetailsWidget(
                      isBackgroundBlurred: true,
                      movie: null,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
