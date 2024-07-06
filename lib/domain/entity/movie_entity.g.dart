// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MovieEntityImpl _$$MovieEntityImplFromJson(Map<String, dynamic> json) =>
    _$MovieEntityImpl(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      overview: json['overview'] as String?,
      poster: json['poster'] as String?,
      starRating: (json['starRating'] as num?)?.toInt(),
      voteCount: (json['voteCount'] as num?)?.toInt(),
      popularity: (json['popularity'] as num?)?.toInt(),
      language: json['language'] as String?,
    );

Map<String, dynamic> _$$MovieEntityImplToJson(_$MovieEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'overview': instance.overview,
      'poster': instance.poster,
      'starRating': instance.starRating,
      'voteCount': instance.voteCount,
      'popularity': instance.popularity,
      'language': instance.language,
    };
