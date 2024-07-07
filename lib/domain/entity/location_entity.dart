import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_entity.freezed.dart';
part 'location_entity.g.dart';

@freezed
class LocationEntity with _$LocationEntity {
  const factory LocationEntity({
    /// Latitude
    double? latitude,

    /// Longitude
    double? longitude,

    /// The name associated with the placemark.
    String? name,

    /// The street associated with the placemark.
    String? street,

    /// The abbreviated country name, according to the two letter (alpha-2) [ISO standard](https://www.iso.org/iso-3166-country-codes.html).
    String? isoCountryCode,

    /// The name of the country associated with the placemark.
    String? country,

    /// The postal code associated with the placemark.
    String? postalCode,

    /// The name of the state or province associated with the placemark.
    String? administrativeArea,

    /// Additional administrative area information for the placemark.
    String? subAdministrativeArea,

    /// The name of the city associated with the placemark.
    String? locality,

    /// Additional city-level information for the placemark.
    String? subLocality,

    /// The street address associated with the placemark.
    String? thoroughfare,

    /// Additional street address information for the placemark.
    String? subThoroughfare,
  }) = _LocationEntity;

  factory LocationEntity.fromJson(Map<String, Object?> json) =>
      _$LocationEntityFromJson(json);
}
