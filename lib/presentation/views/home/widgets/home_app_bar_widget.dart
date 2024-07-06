import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:we_movies/core/constants/constants.dart';
import 'package:we_movies/core/helpers/extensions/string_extension.dart';

class HomeAppBarWidget extends StatelessWidget {
  const HomeAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      const WidgetSpan(
                        child: Icon(
                          Icons.location_city,
                        ),
                      ),
                      WidgetSpan(
                        child: SizedBox(
                          width: 6.w,
                        ),
                      ),
                      TextSpan(
                        text: 'Redstone Oaks'.hardcoded,
                        style: TextStyle(
                          fontFamily: AppFontFamilies.dmSans,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.chineeseBlack,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  "Vishnu Dev Nagar, Wakad, Pimpri-Chinchwa, Maharashtra, India"
                      .hardcoded,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: AppFontFamilies.dmSans,
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 40.w,
          ),
          CircleAvatar(
            radius: 24.r,
            backgroundColor: AppColors.pureWhite,
          ),
        ],
      ),
    );
  }
}
