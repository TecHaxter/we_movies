import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:we_movies/core/constants/constants.dart';
import 'package:we_movies/core/helpers/helpers.dart';
import 'package:we_movies/domain/entity/entity.dart';
import 'package:we_movies/presentation/views/home/widgets/widgets.dart';
import 'package:we_movies/presentation/views/widgets/widgets.dart';

class TopRatedMovieInfoCardWidget extends StatelessWidget {
  final MovieEntity? movie;
  const TopRatedMovieInfoCardWidget({
    super.key,
    this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => underDevelopment(context),
      child: Container(
        padding: EdgeInsets.all(
          8.r,
        ),
        decoration: BoxDecoration(
          color: AppColors.pureWhite,
          borderRadius: BorderRadius.circular(32.r),
        ),
        child: movie == null
            ? const _ShimmerSkeleton()
            : Column(
                children: [
                  Container(
                    height: 192.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        24.r,
                      ),
                      color: AppColors.cultured.withOpacity(0.7),
                      image: (movie?.poster?.isNotEmpty ?? true)
                          ? DecorationImage(
                              image: CachedNetworkImageProvider(
                                movie!.poster!,
                              ),
                              fit: BoxFit.cover,
                            )
                          : null,
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: 24.h,
                          left: 16.w,
                          child: BlurredChipWidget(
                            child: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.remove_red_eye_outlined,
                                    color: AppColors.pureWhite,
                                    size: 20.sp,
                                  ),
                                  SizedBox(
                                    height: 2.h,
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
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  MovieDetailsWidget(
                    movie: movie,
                  ),
                ],
              ),
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
        Container(
          height: 192.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              24.r,
            ),
            color: AppColors.cultured.withOpacity(0.7),
          ),
          child: Stack(
            children: [
              Positioned(
                bottom: 24.h,
                left: 16.w,
                child: Shimmer(
                  gradient: AppGradients.shimmerTextDark,
                  child: CircleAvatar(
                    radius: 28.sp,
                    backgroundColor: AppColors.cultured.withOpacity(0.5),
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 16.h,
        ),
        const MovieDetailsWidget(
          movie: null,
        ),
      ],
    );
  }
}
