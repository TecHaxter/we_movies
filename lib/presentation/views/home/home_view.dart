import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:we_movies/core/constants/constants.dart';
import 'package:we_movies/presentation/views/home/widgets/widgets.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.heliotropGrey,
        child: SafeArea(
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: AppGradients.primary,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const HomeAppBarWidget(),
                  SizedBox(
                    height: 16.h,
                  ),
                  const SearchMoviesTextBoxWidget(),
                  SizedBox(
                    height: 24.h,
                  ),
                  const NowPlayingMoviesFetchCountBannerWidget(),
                  SizedBox(
                    height: 24.h,
                  ),
                  const FeatureTitleDividerWidget(title: "NOW PLAYING"),
                  SizedBox(
                    height: 16.h,
                  ),
                  SizedBox(
                    height: 394.h,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: 30,
                      separatorBuilder: (context, index) => SizedBox(
                        width: 16.w,
                      ),
                      itemBuilder: (context, index) =>
                          NowPlayingMovieInfoCardWidget(
                        index: index,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  const FeatureTitleDividerWidget(title: "TOP RATED"),
                  SizedBox(
                    height: 16.h,
                  ),
                  ListView.separated(
                    itemCount: 30,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                    ),
                    separatorBuilder: (context, index) => SizedBox(
                      height: 8.h,
                    ),
                    itemBuilder: (context, index) =>
                        const TopRatedMovieInfoCardWidget(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {},
        elevation: 0.0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'We Movies',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'Upcoming',
          ),
        ],
      ),
    );
  }
}

// class NowPlayingCutOutBoxClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     Path path = Path();
//     path.lineTo(size.width * 0.08, size.height * 0.11);
//     path.cubicTo(size.width * 0.06, size.height * 0.11, size.width * 0.01,
//         size.height * 0.13, size.width * 0.01, size.height * 0.19);
//     path.cubicTo(size.width * 0.01, size.height * 0.19, size.width * 0.01,
//         size.height * 0.94, size.width * 0.01, size.height * 0.94);
//     path.cubicTo(size.width * 0.01, size.height * 0.96, size.width * 0.02,
//         size.height, size.width * 0.07, size.height);
//     path.cubicTo(size.width * 0.07, size.height, size.width * 0.73, size.height,
//         size.width * 0.73, size.height);
//     path.cubicTo(size.width * 0.76, size.height, size.width * 0.8, size.height,
//         size.width * 0.8, size.height * 0.94);
//     path.cubicTo(size.width * 0.8, size.height * 0.91, size.width * 0.83,
//         size.height * 0.84, size.width * 0.93, size.height * 0.84);
//     path.cubicTo(size.width * 0.95, size.height * 0.84, size.width,
//         size.height * 0.82, size.width, size.height * 0.77);
//     path.cubicTo(size.width, size.height * 0.77, size.width, size.height * 0.07,
//         size.width, size.height * 0.07);
//     path.cubicTo(
//         size.width, size.height * 0.05, size.width, 0, size.width * 0.92, 0);
//     path.cubicTo(
//         size.width * 0.92, 0, size.width * 0.49, 0, size.width * 0.49, 0);
//     path.cubicTo(size.width * 0.47, 0, size.width * 0.43, size.height * 0.02,
//         size.width * 0.43, size.height * 0.06);
//     path.cubicTo(size.width * 0.43, size.height * 0.08, size.width * 0.41,
//         size.height * 0.11, size.width * 0.37, size.height * 0.11);
//     path.cubicTo(size.width * 0.37, size.height * 0.11, size.width * 0.08,
//         size.height * 0.11, size.width * 0.08, size.height * 0.11);
//     path.cubicTo(size.width * 0.08, size.height * 0.11, size.width * 0.08,
//         size.height * 0.11, size.width * 0.08, size.height * 0.11);
//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) => false;
// }

// class WeMoviesTopRatedCutOutBoxClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     Path path = Path();
//     path = Path();
//     path.lineTo(size.width * 0.06, size.height * 0.32);
//     path.cubicTo(size.width * 0.04, size.height * 0.32, 0, size.height * 0.37,
//         0, size.height * 0.54);
//     path.cubicTo(
//         0, size.height * 0.54, 0, size.height * 0.79, 0, size.height * 0.79);
//     path.cubicTo(0, size.height * 0.86, size.width * 0.01, size.height,
//         size.width * 0.06, size.height);
//     path.cubicTo(size.width * 0.06, size.height, size.width * 0.78, size.height,
//         size.width * 0.78, size.height);
//     path.cubicTo(size.width * 0.8, size.height, size.width * 0.84,
//         size.height * 0.96, size.width * 0.84, size.height * 0.79);
//     path.cubicTo(size.width * 0.84, size.height * 0.72, size.width * 0.86,
//         size.height * 0.59, size.width * 0.91, size.height * 0.59);
//     path.cubicTo(size.width * 0.91, size.height * 0.59, size.width * 0.94,
//         size.height * 0.59, size.width * 0.94, size.height * 0.59);
//     path.cubicTo(size.width * 0.96, size.height * 0.59, size.width,
//         size.height * 0.54, size.width, size.height * 0.39);
//     path.cubicTo(size.width, size.height * 0.39, size.width, size.height / 5,
//         size.width, size.height / 5);
//     path.cubicTo(size.width, size.height * 0.14, size.width, size.height * 0.01,
//         size.width * 0.94, size.height * 0.01);
//     path.cubicTo(size.width * 0.94, size.height * 0.01, size.width / 2,
//         size.height * 0.01, size.width / 2, size.height * 0.01);
//     path.cubicTo(size.width * 0.48, size.height * 0.01, size.width * 0.45,
//         size.height * 0.04, size.width * 0.45, size.height * 0.16);
//     path.cubicTo(size.width * 0.45, size.height / 5, size.width * 0.44,
//         size.height * 0.32, size.width * 0.4, size.height * 0.32);
//     path.cubicTo(size.width * 0.4, size.height * 0.32, size.width * 0.06,
//         size.height * 0.32, size.width * 0.06, size.height * 0.32);
//     path.cubicTo(size.width * 0.06, size.height * 0.32, size.width * 0.06,
//         size.height * 0.32, size.width * 0.06, size.height * 0.32);
//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) => false;
// }

// class NowPlayingInnerCutOutBoxClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     Path path = Path();
//     path = Path();
//     path.lineTo(size.width * 0.06, size.height * 0.32);
//     path.cubicTo(size.width * 0.04, size.height * 0.32, 0, size.height * 0.36,
//         0, size.height * 0.54);
//     path.cubicTo(0, size.height * 0.54, 0, size.height, 0, size.height);
//     path.cubicTo(
//         0, size.height, size.width, size.height, size.width, size.height);
//     path.cubicTo(size.width, size.height, size.width, size.height / 5,
//         size.width, size.height / 5);
//     path.cubicTo(size.width, size.height * 0.14, size.width, size.height * 0.01,
//         size.width * 0.94, size.height * 0.01);
//     path.cubicTo(size.width * 0.94, size.height * 0.01, size.width / 2,
//         size.height * 0.01, size.width / 2, size.height * 0.01);
//     path.cubicTo(size.width * 0.48, size.height * 0.01, size.width * 0.45,
//         size.height * 0.04, size.width * 0.45, size.height * 0.16);
//     path.cubicTo(size.width * 0.45, size.height / 5, size.width * 0.44,
//         size.height * 0.32, size.width * 0.4, size.height * 0.32);
//     path.cubicTo(size.width * 0.4, size.height * 0.32, size.width * 0.06,
//         size.height * 0.32, size.width * 0.06, size.height * 0.32);
//     path.cubicTo(size.width * 0.06, size.height * 0.32, size.width * 0.06,
//         size.height * 0.32, size.width * 0.06, size.height * 0.32);

//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) => false;
// }
