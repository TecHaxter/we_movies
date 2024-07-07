import 'package:dio/dio.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_it/get_it.dart';
import 'package:we_movies/core/helpers/helpers.dart';
import 'package:we_movies/data/repository_impl/repository_impl.dart';
import 'package:we_movies/data/source/source.dart';
import 'package:we_movies/domain/repository/repository.dart';
import 'package:we_movies/domain/usecase/fetch_now_playing_movies_usecase.dart';
import 'package:we_movies/domain/usecase/fetch_top_rated_movies_usecase.dart';
import 'package:we_movies/presentation/views/home/bloc/bloc.dart';

final locator = GetIt.instance;

void injectionContainer() {
  _coreRegister();
  _blocRegister();
  _dataSourceRegister();
  _repositoryRegister();
  _usecaseRegister();
}

void _dataSourceRegister() {
  locator.registerLazySingleton<MoviesDataSource>(
    () => MoviesDataSourceImpl(
      locator.get<Dio>(),
    ),
  );

  locator.registerLazySingleton<LanguagesDataSource>(
    () => LanguagesDataSourceImpl(),
  );

  locator.registerLazySingleton<LocationDataSource>(
    () => LocationDataSourceImpl(
      locator.get<GeocodingPlatform>(),
      locator.get<GeolocatorPlatform>(),
    ),
  );
}

void _repositoryRegister() {
  locator.registerLazySingleton<MoviesRepository>(
    () => MoviesRepositoryImpl(
      locator.get<MoviesDataSource>(),
      locator.get<LanguagesDataSource>(),
    ),
  );
}

void _usecaseRegister() {
  locator.registerLazySingleton<FetchNowPlayingMoviesUsecase>(
    () => FetchNowPlayingMoviesUsecaseImpl(
      locator.get<MoviesRepository>(),
    ),
  );
  locator.registerLazySingleton<FetchTopRatedMoviesUsecase>(
    () => FetchTopRatedMoviesUsecaseImpl(
      locator.get<MoviesRepository>(),
    ),
  );
}

void _blocRegister() {
  locator.registerFactory<NowPlayingMoviesBloc>(
    () => NowPlayingMoviesBloc(
      locator.get<FetchNowPlayingMoviesUsecase>(),
    ),
  );
  locator.registerFactory<TopRatedMoviesBloc>(
    () => TopRatedMoviesBloc(
      locator.get<FetchTopRatedMoviesUsecase>(),
    ),
  );
  locator.registerFactory<SearchMoviesBloc>(
    () => SearchMoviesBloc(),
  );
}

void _coreRegister() {
  locator.registerFactory<Dio>(
    () => Dio(
      BaseOptions(
        baseUrl: 'https://api.themoviedb.org/3/',
      ),
    )..interceptors.add(apiKeyInterceptor),
  );
  locator.registerFactory<GeocodingPlatform>(
    () => GeocodingPlatform.instance!,
  );
  locator.registerFactory<GeolocatorPlatform>(
    () => GeolocatorPlatform.instance,
  );
}
