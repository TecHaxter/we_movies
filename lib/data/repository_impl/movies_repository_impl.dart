import 'package:we_movies/core/helpers/helpers.dart';
import 'package:we_movies/data/source/source.dart';
import 'package:we_movies/domain/entity/movie_entity.dart';
import 'package:we_movies/domain/repository/repository.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final MoviesDataSource moviesDataSource;
  final LanguagesDataSource languagesDataSource;
  final CachingDataSource cachingDataSource;
  const MoviesRepositoryImpl(
    this.moviesDataSource,
    this.languagesDataSource,
    this.cachingDataSource,
  );

  @override
  Future<Responser<List<MovieEntity>?>> fetchNowPlayingMovies(
      {int page = 1}) async {
    try {
      final res = await moviesDataSource.fetchNowPlayingMovies(page: page);
      final json = res.fold((l) => null, (r) => r);
      if (res.isLeft()) {
        throw 'Error occurred while fetching upcoming movies';
      }
      final movies = (json?['results'] as List).map<MovieEntity>(
        (e) {
          final map = Map<String, dynamic>.from(e as Map);
          try {
            return MovieEntity(
              id: map['id'] as int?,
              title: map['title'] as String?,
              overview: map['overview'] as String?,
              poster: ((map['poster_path'] as String?)?.isNotEmpty ?? false)
                  ? 'https://image.tmdb.org/t/p/original/${map['poster_path'] as String?}'
                  : null,
              popularity: (map['popularity'] as double?)?.toInt(),
              voteCount: map['vote_count'] as int?,
              language: languagesDataSource.data.firstWhere(
                (e) => e['iso_639_1'] == map['original_language'],
                orElse: () => <String, String>{},
              )['english_name'],
            );
          } catch (e) {
            rethrow;
          }
        },
      ).toList();
      return success(movies);
    } catch (e) {
      return failed(e.toString());
    }
  }

  @override
  Future<Responser<List<MovieEntity>?>> fetchTopRatedMovies(
      {int page = 1}) async {
    try {
      final res = await moviesDataSource.fetchTopRatedMovies(page: page);
      final json = res.fold((l) => null, (r) => r);
      if (res.isLeft()) {
        throw 'Error occurred while fetching upcoming movies';
      }
      final movies = (json?['results'] as List).map<MovieEntity>(
        (e) {
          final map = Map<String, dynamic>.from(e as Map);
          try {
            return MovieEntity(
              id: map['id'] as int?,
              title: map['title'] as String?,
              overview: map['overview'] as String?,
              poster: ((map['poster_path'] as String?)?.isNotEmpty ?? false)
                  ? 'https://image.tmdb.org/t/p/original/${map['poster_path'] as String?}'
                  : null,
              popularity: (map['popularity'] as double?)?.toInt(),
              voteCount: map['vote_count'] as int?,
              language: languagesDataSource.data.firstWhere(
                (e) => e['iso_639_1'] == map['original_language'],
                orElse: () => <String, String>{},
              )['english_name'],
            );
          } catch (e) {
            rethrow;
          }
        },
      ).toList();
      return success(movies);
    } catch (e) {
      return failed(e.toString());
    }
  }

  @override
  Future<Responser<List<MovieEntity>?>> getNowPlayingMoviesFromCache() async {
    try {
      final data =
          (await cachingDataSource.getData('now_playing') as List?)?.map(
        (e) => Map<String, dynamic>.from(
          e as Map,
        ),
      );
      final movies = data?.map((e) => MovieEntity.fromJson(e)).toList();
      return success(movies);
    } catch (e) {
      return failed(e.toString());
    }
  }

  @override
  Future<Responser<List<MovieEntity>?>> getTopRatedMoviesFromCache() async {
    try {
      final data = (await cachingDataSource.getData('top_rated') as List?)?.map(
        (e) => Map<String, dynamic>.from(
          e as Map,
        ),
      );
      final movies = data?.map((e) => MovieEntity.fromJson(e)).toList();
      return success(movies);
    } catch (e) {
      return failed(e.toString());
    }
  }

  @override
  Future<Responser<bool>> putNowPlayingMoviesInCache(
      {required List<MovieEntity> movies}) async {
    try {
      await cachingDataSource.insertData(
        'now_playing',
        movies.map((e) => e.toJson()).toList(),
      );
      return success(true);
    } catch (e) {
      return failed(e.toString());
    }
  }

  @override
  Future<Responser<bool>> putTopRatedMoviesInCache(
      {required List<MovieEntity> movies}) async {
    try {
      await cachingDataSource.insertData(
        'top_rated',
        movies.map((e) => e.toJson()).toList(),
      );
      return success(true);
    } catch (e) {
      return failed(e.toString());
    }
  }
}
