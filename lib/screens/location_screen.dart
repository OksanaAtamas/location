import 'package:flutter/material.dart';
import 'package:location/controller/location_controller.dart';
import 'package:provider/provider.dart';
import 'package:location/models/location_model.dart';

class LocationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.watch<LocationController>().isTracking
            ? "Відстежується"
            : "Не відстежується"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Geolocation:",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            if (context.watch<LocationController>().currentLocation != null)
              Column(
                children: [
                  Text(
                    "Latitude:",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${context.watch<LocationController>().currentLocation!.latitude}",
                    style: TextStyle(fontSize: 24),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Longitude:",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${context.watch<LocationController>().currentLocation!.longitude}",
                    style: TextStyle(fontSize: 24),
                  ),
                ],
              ),
            if (context.watch<LocationController>().currentLocation == null)
              Text(
                "error",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => context.read<LocationController>().toggleTracking(),
            child: Icon(
              context.watch<LocationController>().isTracking
                  ? Icons.stop
                  : Icons.play_arrow,
            ),
          ),
          SizedBox(height: 10),
          Text(
            context.watch<LocationController>().isTracking
                ? "Припинити відстеження"
                : "Почати відстеження",
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
