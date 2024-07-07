import 'package:we_movies/domain/entity/entity.dart';

abstract class AddressBlocState {
  const AddressBlocState();
}

class InitialAddress extends AddressBlocState {
  final String? message;
  InitialAddress(this.message);
}

class LoadingAddress extends AddressBlocState {
  final String? message;
  LoadingAddress(this.message);
}

class AddressNotFound extends AddressBlocState {
  final String message;
  AddressNotFound(this.message);
}

class AddressLoaded extends AddressBlocState {
  final LocationEntity? location;
  AddressLoaded({
    this.location,
  });
}
