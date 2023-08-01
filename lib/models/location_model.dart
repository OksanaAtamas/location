import 'package:geolocator/geolocator.dart';

class LocationModel {
  double latitude;
  double longitude;

  LocationModel({required this.latitude, required this.longitude});

  factory LocationModel.fromPosition(Position position) {
    return LocationModel(latitude: position.latitude, longitude: position.longitude);
  }
}
