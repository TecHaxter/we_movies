import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:we_movies/core/constants/constants.dart';

class BlurredChipWidget extends StatelessWidget {
  final Widget child;
  const BlurredChipWidget({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(
        64.r,
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 20,
          sigmaY: 20,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.nickle.withOpacity(
              0.1,
            ),
          ),
          padding: EdgeInsets.all(
            4.w,
          ),
          child: child,
        ),
      ),
    );
  }
}
