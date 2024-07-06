import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:we_movies/core/constants/constants.dart';
import 'package:we_movies/core/helpers/helpers.dart';
import 'package:we_movies/presentation/views/home/widgets/widgets.dart';
import 'package:we_movies/presentation/views/widgets/widgets.dart';

class TopRatedMovieInfoCardWidget extends StatelessWidget {
  const TopRatedMovieInfoCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(
        8.r,
      ),
      decoration: BoxDecoration(
        color: AppColors.pureWhite,
        borderRadius: BorderRadius.circular(32.r),
      ),
      child: Column(
        children: [
          Container(
            height: 192.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                24.r,
              ),
              color: AppColors.chineeseBlack,
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
                            "71K".hardcoded,
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
          const MovieDetailsWidget(),
        ],
      ),
    );
  }
}
