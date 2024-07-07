import 'package:flutter/material.dart';

class AppColors {
  static const Color pureWhite = Color(0xFFFFFFFF);
  static const Color heliotropGrey = Color(0xFFA88EA6);
  static const Color cultured = Color(0xFFF7F7F7);
  //Used in prominent components
  static const Color darkJungleGreen = Color(0xFF101828);
  static const Color outerSpace = Color(0xFF2F3241);
  static const Color independence = Color(0xFF515662);
  //Used in top rated movies texts
  static const Color chineeseBlack = Color(0xFF161616);
  static const Color nickle = Color(0xFF737373);
}

class AppGradients {
  static const LinearGradient primary = LinearGradient(
    colors: [
      AppColors.heliotropGrey,
      AppColors.cultured,
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static LinearGradient muted = LinearGradient(
    colors: [
      AppColors.nickle.withOpacity(0.5),
      AppColors.nickle.withOpacity(0),
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
  static LinearGradient shimmer = const LinearGradient(
    colors: [
      AppColors.heliotropGrey,
      AppColors.pureWhite,
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
  static LinearGradient shimmerTextDark = LinearGradient(
    colors: [
      AppColors.nickle.withOpacity(0.5),
      AppColors.pureWhite.withOpacity(0.5),
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
  static LinearGradient shimmerTextLight = LinearGradient(
    colors: [
      AppColors.nickle.withOpacity(0.2),
      AppColors.pureWhite.withOpacity(0.5),
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
  static LinearGradient darkMuted = LinearGradient(
    colors: [
      AppColors.nickle.withOpacity(0.1),
      AppColors.nickle.withOpacity(0.3),
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}
