import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:we_movies/core/constants/constants.dart';
import 'package:we_movies/presentation/views/home/bloc/bloc.dart';
import 'package:we_movies/presentation/views/home/bloc/now_playing_movies_bloc/now_playing_movies_bloc_event.dart';
import 'package:we_movies/presentation/views/home/bloc/top_rated_movies_bloc/top_rated_movies_bloc_event.dart';
import 'package:we_movies/presentation/views/home/widgets/widgets.dart';
import 'package:we_movies/presentation/views/widgets/widgets.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late ScrollController verticalScrollController;
  late ScrollController nowPlayingHorizontalScrollController;

  @override
  void initState() {
    super.initState();
    context.read<NowPlayingMoviesBloc>().add(OnFetchNowPlayingMovies());
    context.read<TopRatedMoviesBloc>().add(OnFetchTopRatedMovies());

    verticalScrollController = ScrollController()
      ..addListener(_verticleScrollHandler);
    nowPlayingHorizontalScrollController = ScrollController()
      ..addListener(_nowPlayingHorizontalScrollHandler);
  }

  bool searchMode = false;

  void _verticleScrollHandler() {
    if (searchMode) {
      return;
    }
    if (verticalScrollController.position.maxScrollExtent ==
        verticalScrollController.position.pixels) {
      context.read<TopRatedMoviesBloc>().add(OnFetchTopRatedMovies());
    }
  }

  void _nowPlayingHorizontalScrollHandler() {
    if (searchMode) {
      return;
    }
    if (nowPlayingHorizontalScrollController.position.pixels >=
        nowPlayingHorizontalScrollController.position.maxScrollExtent) {
      context.read<NowPlayingMoviesBloc>().add(OnFetchNowPlayingMovies());
    }
  }

  Future<void> _handlePullToRefresh() async {
    if (searchMode) {
      return;
    }
    context.read<NowPlayingMoviesBloc>().add(OnResetNowPlayingMovies());
    context.read<TopRatedMoviesBloc>().add(OnResetTopRatedMovies());
    context.read<NowPlayingMoviesBloc>().add(OnFetchNowPlayingMovies());
    context.read<TopRatedMoviesBloc>().add(OnFetchTopRatedMovies());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SearchMoviesBloc, SearchMoviesBlocState>(
      listener: (context, state) {
        searchMode = state is EmptySearchMoviesInput == false;
      },
      child: Scaffold(
        body: RefreshIndicator(
          onRefresh: _handlePullToRefresh,
          child: Container(
            color: AppColors.heliotropGrey,
            child: SafeArea(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: AppGradients.primary,
                ),
                child: SingleChildScrollView(
                  controller: verticalScrollController,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 8.h,
                      ),
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
                      NowPlayingMoviesComponentWidget(
                        scrollController: nowPlayingHorizontalScrollController,
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      const FeatureTitleDividerWidget(title: "TOP RATED"),
                      SizedBox(
                        height: 16.h,
                      ),
                      const TopRatedMoviesComponentWidget(),
                      SizedBox(
                        height: 8.h,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            if (index == 0) {
              return;
            }
            underDevelopment(context);
          },
          elevation: 0.0,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                AppAssets.logos.weWorkBlackLogo,
                width: 28.w,
              ),
              label: 'We Movies',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.map),
              label: 'Explore',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month),
              label: 'Upcoming',
            ),
          ],
        ),
      ),
    );
  }
}
