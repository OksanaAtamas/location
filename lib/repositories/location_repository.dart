import 'package:geolocator/geolocator.dart';
import 'package:location/models/location_model.dart';

class LocationRepository {
  Future<LocationPermission> requestLocationPermission() async {
    return await Geolocator.requestPermission();
  }

  Stream<Position> getPositionStream() {
    return Geolocator.getPositionStream();
  }
}
