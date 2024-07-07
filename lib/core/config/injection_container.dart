import 'dart:async';

import 'package:dio/dio.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:we_movies/core/helpers/helpers.dart';
import 'package:we_movies/data/repository_impl/repository_impl.dart';
import 'package:we_movies/data/source/source.dart';
import 'package:we_movies/domain/repository/repository.dart';
import 'package:we_movies/domain/usecase/usecase.dart';
import 'package:we_movies/presentation/bloc/bloc.dart';
import 'package:we_movies/presentation/views/home/bloc/bloc.dart';

final locator = GetIt.instance;

Future<void> injectionContainer() async {
  _coreRegister();
  _blocRegister();
  await _dataSourceRegister();
  _repositoryRegister();
  _usecaseRegister();
}

Future<void> _dataSourceRegister() async {
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
  locator.registerLazySingletonAsync<CachingDataSource>(
    () async => CachingDataSourceImpl(
      await getApplicationDocumentsDirectory(),
      Hive,
    )..init(),
  );

  // Wait for CachingDataSource to be ready
  await locator.isReady<CachingDataSource>();
}

Future<void> _repositoryRegister() async {
  locator.registerLazySingletonAsync<MoviesRepository>(
    // Await the async registration
    () async => MoviesRepositoryImpl(
      locator.get<MoviesDataSource>(),
      locator.get<LanguagesDataSource>(),
      locator.get<CachingDataSource>(),
    ),
  );
  locator.registerLazySingleton<LocationRepository>(
    () => LocationRepositoryImpl(
      locator.get<LocationDataSource>(),
    ),
  );
  await locator.isReady<MoviesRepository>();
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
  locator.registerLazySingleton<FetchLocationUsecase>(
    () => FetchLocationUsecaseImpl(
      locator.get<LocationRepository>(),
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
  locator.registerFactory<AddressBloc>(
    () => AddressBloc(
      locator.get<FetchLocationUsecase>(),
    ),
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
