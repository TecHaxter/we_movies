import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:we_movies/core/constants/constants.dart';
import 'package:we_movies/presentation/bloc/bloc.dart';
import 'package:we_movies/presentation/views/home/home_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    context.read<AddressBloc>().add(OnFetchAddress());
  }

  bool allowClickAndFetchLocation = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddressBloc, AddressBlocState>(
      listener: (context, state) {
        if (state is AddressLoaded) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeView(),
            ),
          );
        } else if (state is AddressNotFound) {
          allowClickAndFetchLocation = true;
          SnackBar snackBar = SnackBar(
            content: Text(
              '${state.message} Click on the animation to refetch.',
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.cultured,
        body: Center(
          child: InkWell(
            onTap: () {
              if (allowClickAndFetchLocation) {
                context.read<AddressBloc>().add(OnFetchAddress());
                allowClickAndFetchLocation = false;
              }
            },
            child: Lottie.asset(
              AppAssets.animations.splashLottie,
              width: 300.r,
              height: 300.r,
            ),
          ),
        ),
      ),
    );
  }
}
