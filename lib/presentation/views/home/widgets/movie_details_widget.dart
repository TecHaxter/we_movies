import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:we_movies/core/constants/constants.dart';
import 'package:we_movies/core/helpers/helpers.dart';

class MovieDetailsWidget extends StatelessWidget {
  final bool isBackgroundBlurred;
  const MovieDetailsWidget({
    super.key,
    this.isBackgroundBlurred = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 16.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Godzilla x Kong: The NewEmpire".hardcoded,
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
                  "Ayoung Bruce Wayne(Christian Bale) travels to the Far East,where he's trained"
                      .hardcoded,
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
            "716 Votes".hardcoded,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
              color:
                  isBackgroundBlurred ? AppColors.pureWhite : AppColors.nickle,
            ),
          ),
        ],
      ),
    );
  }
}
