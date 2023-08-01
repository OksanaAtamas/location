import 'package:geolocator/geolocator.dart';
import 'package:location/repositories/location_repository.dart';
import 'package:location/models/location_model.dart';

class LocationService {
  final LocationRepository _repository = LocationRepository();

  Future<LocationPermission> requestLocationPermission() async {
    return await _repository.requestLocationPermission();
  }

  Stream<LocationModel> getPositionStream() {
    return _repository.getPositionStream().map((position) => LocationModel.fromPosition(position));
  }
}
