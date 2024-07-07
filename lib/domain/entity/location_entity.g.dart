// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LocationEntityImpl _$$LocationEntityImplFromJson(Map<String, dynamic> json) =>
    _$LocationEntityImpl(
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      name: json['name'] as String?,
      street: json['street'] as String?,
      isoCountryCode: json['isoCountryCode'] as String?,
      country: json['country'] as String?,
      postalCode: json['postalCode'] as String?,
      administrativeArea: json['administrativeArea'] as String?,
      subAdministrativeArea: json['subAdministrativeArea'] as String?,
      locality: json['locality'] as String?,
      subLocality: json['subLocality'] as String?,
      thoroughfare: json['thoroughfare'] as String?,
      subThoroughfare: json['subThoroughfare'] as String?,
    );

Map<String, dynamic> _$$LocationEntityImplToJson(
        _$LocationEntityImpl instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'name': instance.name,
      'street': instance.street,
      'isoCountryCode': instance.isoCountryCode,
      'country': instance.country,
      'postalCode': instance.postalCode,
      'administrativeArea': instance.administrativeArea,
      'subAdministrativeArea': instance.subAdministrativeArea,
      'locality': instance.locality,
      'subLocality': instance.subLocality,
      'thoroughfare': instance.thoroughfare,
      'subThoroughfare': instance.subThoroughfare,
    };
