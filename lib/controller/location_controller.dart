import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/models/location_model.dart';
import 'package:location/services/location_service.dart';

class LocationController extends ChangeNotifier {
  final LocationService _locationService = LocationService();
  bool _isTracking = false;
  LocationModel? _currentLocation;

  bool get isTracking => _isTracking;
  LocationModel? get currentLocation => _currentLocation;

  Future<void> toggleTracking() async {
    if (_isTracking) {
      _isTracking = false;
      notifyListeners();
      return;
    }

    LocationPermission permission = await _locationService.requestLocationPermission();
    if (permission == LocationPermission.denied) {
      permission = await _locationService.requestLocationPermission();
      if (permission == LocationPermission.denied) {
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return;
    }

    _isTracking = true;
    _locationService.getPositionStream().listen((location) {
      _currentLocation = location;
      notifyListeners();
    });

    notifyListeners();
  }
}
