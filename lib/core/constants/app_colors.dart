import 'package:flutter/material.dart';

class AppColors {
  static const heliotropGrey = Color(0xFFA88EA6);
  static const cultured = Color(0xFFF7F7F7);
  //Used in prominent components
  static const darkJungleGreen = Color(0xFF101828);
  static const outerSpace = Color(0xFF2F3241);
  static const independence = Color(0xFF515662);
  //Used in top rated movies texts
  static const chineeseBlack = Color(0xFF161616);
  static const nickle = Color(0xFF737373);
}

class AppGradients {
  static const LinearGradient primary = LinearGradient(colors: [
    AppColors.heliotropGrey,
    AppColors.cultured,
  ]);
}
