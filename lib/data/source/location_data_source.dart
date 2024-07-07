import 'package:flutter/foundation.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:we_movies/core/helpers/helpers.dart';

sealed class LocationDataSource {
  Future<Responser<bool>> getPermission();
  Future<Responser<(double, double)>> getCoordinates();
  Future<Responser<Map<String, dynamic>>> reverseGeocodeCoordinates({
    required double latitude,
    required double longitude,
  });
}

class LocationDataSourceImpl implements LocationDataSource {
  final GeolocatorPlatform geolocator;
  final GeocodingPlatform geocoding;
  const LocationDataSourceImpl(
    this.geocoding,
    this.geolocator,
  );

  @override
  Future<Responser<bool>> getPermission() async {
    try {
      LocationPermission permission = await geolocator.checkPermission();
      if (permission == LocationPermission.always ||
          permission == LocationPermission.whileInUse) {
        return success(true);
      }
      if (permission == LocationPermission.deniedForever) {
        final canOpenSettings = await geolocator.openLocationSettings();
        if (canOpenSettings == false) {
          throw "Can not open settings app for granting permission";
        }
      } else {
        await geolocator.requestPermission();
      }
      return getPermission();
    } catch (e) {
      return failed(e.toString());
    }
  }

  @override
  Future<Responser<(double, double)>> getCoordinates() async {
    try {
      late LocationSettings locationSettings;
      if (defaultTargetPlatform == TargetPlatform.android) {
        locationSettings = AndroidSettings(
          accuracy: LocationAccuracy.best,
          forceLocationManager: false,
        );
      } else {
        locationSettings = const LocationSettings(
          accuracy: LocationAccuracy.best,
        );
      }
      Position position = await geolocator.getCurrentPosition(
        locationSettings: locationSettings,
      );
      return success((position.latitude, position.longitude));
    } catch (e) {
      return failed(e.toString());
    }
  }

  @override
  Future<Responser<Map<String, dynamic>>> reverseGeocodeCoordinates({
    required double latitude,
    required double longitude,
  }) async {
    try {
      List<Placemark> places =
          await geocoding.placemarkFromCoordinates(latitude, longitude);
      if (places.isEmpty) {
        throw 'Could not detect the place';
      }
      return success(places.first.toJson());
    } catch (e) {
      return failed(e.toString());
    }
  }
}
