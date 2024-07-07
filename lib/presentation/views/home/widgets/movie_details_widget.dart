import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:we_movies/core/constants/constants.dart';
import 'package:we_movies/core/helpers/helpers.dart';
import 'package:we_movies/domain/entity/entity.dart';

class MovieDetailsWidget extends StatelessWidget {
  final bool isBackgroundBlurred;
  final MovieEntity? movie;
  const MovieDetailsWidget({
    super.key,
    this.isBackgroundBlurred = false,
    this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 16.h,
      ),
      child: movie == null
          ? const _ShimmerSkeleton()
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie?.title ?? 'Not available',
                  style: TextStyle(
                    color: isBackgroundBlurred
                        ? AppColors.pureWhite
                        : AppColors.darkJungleGreen,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.calendar_month,
                      color: isBackgroundBlurred
                          ? AppColors.pureWhite
                          : AppColors.nickle,
                      size: 18.sp,
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    Expanded(
                      child: Text(
                        movie?.overview ?? 'Not available',
                        maxLines: 2,
                        style: TextStyle(
                          color: isBackgroundBlurred
                              ? AppColors.pureWhite
                              : AppColors.nickle,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 40.w,
                    ),
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  "${(movie?.voteCount ?? 0).smallKilloMillionBillion} Votes",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                    color: isBackgroundBlurred
                        ? AppColors.pureWhite
                        : AppColors.nickle,
                  ),
                ),
              ],
            ),
    );
  }
}

class _ShimmerSkeleton extends StatelessWidget {
  const _ShimmerSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Shimmer(
          gradient: AppGradients.shimmerTextDark,
          child: Container(
            height: 20.sp,
            width: 140.w,
            decoration: BoxDecoration(
              color: AppColors.cultured.withOpacity(0.5),
              borderRadius: BorderRadius.circular(
                24.r,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        Shimmer(
          gradient: AppGradients.shimmerTextDark,
          child: Container(
            width: 200.w,
            height: 46.sp,
            decoration: BoxDecoration(
              color: AppColors.cultured.withOpacity(0.5),
              borderRadius: BorderRadius.circular(
                24.r,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        Shimmer(
          gradient: AppGradients.shimmerTextDark,
          child: Container(
            width: 40.w,
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
    );
  }
}
