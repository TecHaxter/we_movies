import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:we_movies/core/constants/constants.dart';
import 'package:we_movies/presentation/views/views.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(
        430,
        932,
      ),
      minTextAdapt: true,
      child: MaterialApp(
        title: 'We Movies',
        theme: ThemeData(
          useMaterial3: true,
          fontFamily: AppFontFamilies.poppins,
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            selectedLabelStyle: TextStyle(
              fontFamily: AppFontFamilies.poppins,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
            unselectedLabelStyle: TextStyle(
              fontFamily: AppFontFamilies.poppins,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
            selectedItemColor: AppColors.darkJungleGreen,
            selectedIconTheme: IconThemeData(
              color: AppColors.darkJungleGreen,
            ),
            unselectedItemColor: AppColors.independence,
            unselectedIconTheme: IconThemeData(
              color: AppColors.independence,
            ),
          ),
        ),
        home: const HomeView(),
      ),
    );
  }
}
