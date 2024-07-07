import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:we_movies/core/helpers/helpers.dart';
import 'package:we_movies/domain/usecase/usecase.dart';
import 'package:we_movies/presentation/bloc/bloc.dart';

class AddressBloc extends Bloc<AddressBlocEvent, AddressBlocState> {
  final FetchLocationUsecase fetchLocationUsecase;
  AddressBloc(this.fetchLocationUsecase)
      : super(
          InitialAddress(
            'Initial state',
          ),
        ) {
    on<OnFetchAddress>(
      (event, emit) async {
        try {
          emit(
            LoadingAddress('Searching location'),
          );
          final res = await fetchLocationUsecase.call();
          final location = res.fold((l) => null, (r) => r);
          if (res.isLeft() || location == null) {
            throw res.asLeft() ?? "Could not fetch location.";
          }
          emit(
            AddressLoaded(
              location: location,
            ),
          );
        } catch (e) {
          emit(
            AddressNotFound(e.toString()),
          );
        }
      },
      transformer: debounceTransformer(const Duration(milliseconds: 300)),
    );
  }

  @override
  void onChange(Change<AddressBlocState> change) {
    log("Address Bloc State: ${change.currentState}");
    super.onChange(change);
  }
}
