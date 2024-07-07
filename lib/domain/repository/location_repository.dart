import 'package:we_movies/core/helpers/helpers.dart';
import 'package:we_movies/domain/entity/entity.dart';

abstract class LocationRepository {
  Future<Responser<bool>> getPermissions();
  Future<Responser<LocationEntity>> getAddress();
}
