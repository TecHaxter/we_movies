import 'package:we_movies/core/helpers/http/error_handling/responser.dart';
import 'package:we_movies/data/source/source.dart';
import 'package:we_movies/domain/entity/movie_entity.dart';
import 'package:we_movies/domain/repository/repository.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final MoviesDataSource moviesDataSource;
  final LanguagesDataSource languagesDataSource;
  const MoviesRepositoryImpl(
    this.moviesDataSource,
    this.languagesDataSource,
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
          try {
            final map = Map<String, dynamic>.from(e as Map);
            return MovieEntity(
              id: map['id'] as int?,
              title: map['title'] as String?,
              overview: map['overview'] as String?,
              poster: map['poster_path'] as String?,
              popularity: map['popularity'] as int?,
              voteCount: map['vote_count'] as int?,
              language: languagesDataSource.data.firstWhere(
                (e) => e['iso_639_1'] == map['language'] as String?,
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
          try {
            final map = Map<String, dynamic>.from(e as Map);
            return MovieEntity(
              id: map['id'] as int?,
              title: map['title'] as String?,
              overview: map['overview'] as String?,
              poster: map['poster_path'] as String?,
              popularity: map['popularity'] as int?,
              voteCount: map['vote_count'] as int?,
              language: languagesDataSource.data.firstWhere(
                (e) => e['iso_639_1'] == map['language'] as String?,
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
}
