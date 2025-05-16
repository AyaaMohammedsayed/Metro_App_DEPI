import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:metro_app/Notification/logic/notification_service.dart';

class LocationService {
  static bool useFakeLocation = true;

  static Stream<Position> getFakePositionStream(double destLat, double destLng) async* {
    while (true) {
      await Future.delayed(Duration(seconds: 1));
      yield Position(
   
           latitude: destLat + 0.0005,
        longitude: destLng + 0.0005,
        timestamp: DateTime.now(),
        accuracy: 5,
        altitude: 0,
        heading: 0,
        speed: 0,
        speedAccuracy: 0,
        floor: 0,
        isMocked: true,
        headingAccuracy: 0,
        altitudeAccuracy: 0,
      );
    }
  }

  static Future<Position> getCurrentPosition(double destLat, double destLng) async {
    if (useFakeLocation) {
      return Position(

           latitude: destLat + 0.0005,
        longitude: destLng + 0.0005,
        timestamp: DateTime.now(),
        accuracy: 5,
        altitude: 0,
        heading: 0,
        speed: 0,
        speedAccuracy: 0,
        floor: 0,
        isMocked: true,
        headingAccuracy: 0,
        altitudeAccuracy: 0,
      );
    } else {
      return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.medium, // تغيير الدقة إلى متوسطة
      );
    }
  }

  static Future<Position> determinePosition(double destinationLat, double destinationLng) async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Location services are disabled.');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception('Location permissions are permanently denied.');
    }

    return await getCurrentPosition(destinationLat, destinationLng);
  }

  static Future<void> checkProximityAndNotify(
      double destinationLat, double destinationLng) async {
    Position currentPosition = await determinePosition(destinationLat, destinationLng);

    double distanceInMeters = Geolocator.distanceBetween(
      currentPosition.latitude,
      currentPosition.longitude,
      destinationLat,
      destinationLng,
    );

    if (distanceInMeters <= 100) {
      await showProximityNotification();
    }
  }

  static StreamSubscription<Position>? _positionStreamSubscription;

  static void startMonitoringProximity({
    required double destinationLat,
    required double destinationLng,
    required VoidCallback onNotificationSent,
  }) {
    _positionStreamSubscription?.cancel();

    const distanceThreshold = 100.0;

    Stream<Position> positionStream;

    if (useFakeLocation) {
      positionStream = getFakePositionStream(destinationLat, destinationLng);
    } else {
      positionStream = Geolocator.getPositionStream(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.medium, // تغيير الدقة هنا كمان
          distanceFilter: 10,
        ),
      );
    }

    _positionStreamSubscription = positionStream.listen((Position position) async {
      double distance = Geolocator.distanceBetween(
        position.latitude,
        position.longitude,
        destinationLat,
        destinationLng,
      );

      print('Current distance: $distance meters');

      if (distance <= distanceThreshold) {
        await showProximityNotification();
        onNotificationSent();
        _positionStreamSubscription?.cancel();
      }
    });
  }

  static void stopMonitoring() {
    _positionStreamSubscription?.cancel();
  }
}