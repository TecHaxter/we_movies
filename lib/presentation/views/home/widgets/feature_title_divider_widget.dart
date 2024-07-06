import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:we_movies/core/constants/constants.dart';

class FeatureTitleDividerWidget extends StatelessWidget {
  final String title;
  const FeatureTitleDividerWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
      ),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            width: 24.w,
          ),
          Expanded(
            child: SizedBox(
              height: 2.h,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    2.r,
                  ),
                  gradient: AppGradients.muted,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
