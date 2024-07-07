import 'package:we_movies/core/helpers/helpers.dart';
import 'package:we_movies/domain/entity/entity.dart';
import 'package:we_movies/domain/repository/repository.dart';

sealed class FetchLocationUsecase {
  Future<Responser<LocationEntity>> call();
}

class FetchLocationUsecaseImpl implements FetchLocationUsecase {
  final LocationRepository locationRepository;
  const FetchLocationUsecaseImpl(this.locationRepository);
  @override
  Future<Responser<LocationEntity>> call() async {
    try {
      final permissionRes = await locationRepository.getPermissions();
      final permission = permissionRes.fold((l) => null, (r) => r);
      if (permissionRes.isLeft() || (permission != true)) {
        throw "Location permission error";
      }
      return locationRepository.getAddress();
    } catch (e) {
      return failed(e.toString());
    }
  }
}
