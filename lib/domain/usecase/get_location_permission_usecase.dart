import 'package:we_movies/core/helpers/helpers.dart';
import 'package:we_movies/domain/repository/repository.dart';

sealed class GetLocationPermissionUsecase {
  Future<Responser<bool>> call();
}

class GetLocationPermissionUsecaseImpl implements GetLocationPermissionUsecase {
  final LocationRepository locationRepository;
  const GetLocationPermissionUsecaseImpl(this.locationRepository);
  @override
  Future<Responser<bool>> call() {
    return locationRepository.getPermissions();
  }
}
