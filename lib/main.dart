import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:location/services/location_service.dart';
import 'package:location/controller/location_controller.dart';
import 'package:location/screens/location_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LocationController()),
        Provider(create: (_) => LocationService()),
      ],
      child: MaterialApp(
        title: 'Location Tracking App',
        home: LocationScreen(),
      ),
    );
  }
}
