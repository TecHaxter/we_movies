import 'package:freezed_annotation/freezed_annotation.dart';
part 'movie_entity.freezed.dart';
part 'movie_entity.g.dart';

@freezed
class MovieEntity with _$MovieEntity {
  const factory MovieEntity({
    int? id,
    String? title,
    String? overview,
    String? poster,
    int? starRating,
    int? voteCount,
    int? popularity,
    String? language,
  }) = _MovieEntity;

  factory MovieEntity.fromJson(Map<String, Object?> json) =>
      _$MovieEntityFromJson(json);
}
