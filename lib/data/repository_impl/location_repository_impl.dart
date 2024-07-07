import 'package:we_movies/core/helpers/helpers.dart';
import 'package:we_movies/data/source/source.dart';
import 'package:we_movies/domain/entity/entity.dart';
import 'package:we_movies/domain/entity/location_entity.dart';
import 'package:we_movies/domain/repository/repository.dart';

class LocationRepositoryImpl implements LocationRepository {
  final LocationDataSource locationDataSource;
  const LocationRepositoryImpl(this.locationDataSource);
  @override
  Future<Responser<LocationEntity>> getAddress() async {
    try {
      final coordsRes = await locationDataSource.getCoordinates();
      final coords = coordsRes.fold((l) => null, (r) => r);
      if (coordsRes.isLeft() || coords == null) {
        throw "Could not get coordinates";
      }
      final placeRes = await locationDataSource.reverseGeocodeCoordinates(
        latitude: coords.$1,
        longitude: coords.$2,
      );
      final place = placeRes.fold((l) => null, (r) => r);
      if (placeRes.isLeft() || place == null) {
        throw "Could not detect location";
      }
      LocationEntity location = LocationEntity.fromJson(place);
      location = location.copyWith(
        latitude: coords.$1,
        longitude: coords.$2,
      );
      return success(location);
    } catch (e) {
      return failed(e.toString());
    }
  }

  @override
  Future<Responser<bool>> getPermissions() {
    return locationDataSource.getPermission();
  }
}
