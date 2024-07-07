import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:we_movies/core/config/config.dart';
import 'package:we_movies/core/constants/constants.dart';
import 'package:we_movies/presentation/bloc/bloc.dart';
import 'package:we_movies/presentation/views/home/bloc/bloc.dart';
import 'package:we_movies/presentation/views/splash/splash_view.dart';
import 'package:we_movies/presentation/views/views.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await serviceBootup();
  injectionContainer();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AddressBloc>(
            create: (_) => locator.get<AddressBloc>(),
          ),
          BlocProvider<NowPlayingMoviesBloc>(
            create: (_) => locator.get<NowPlayingMoviesBloc>(),
          ),
          BlocProvider<TopRatedMoviesBloc>(
            create: (_) => locator.get<TopRatedMoviesBloc>(),
          ),
          BlocProvider<SearchMoviesBloc>(
            create: (_) => locator.get<SearchMoviesBloc>(),
          ),
        ],
        child: MaterialApp(
          title: 'We Movies',
          debugShowCheckedModeBanner: false,
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
          home: const SplashView(),
        ),
      ),
    );
  }
}
