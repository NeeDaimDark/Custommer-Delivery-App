import '/flutter_flow/flutter_flow_util.dart';
import 'track_order_widget.dart' show TrackOrderWidget;
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as latlong2;
import 'package:geolocator/geolocator.dart';
import 'dart:async';

class TrackOrderModel extends FlutterFlowModel<TrackOrderWidget> {
  // Map controller for OpenStreetMap
  final mapController = MapController();

  // Location tracking fields
  latlong2.LatLng? mapCenter;
  Position? currentPosition;
  StreamSubscription<Position>? positionStream;

  // Request and check location permissions
  Future<bool> handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return false;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return false;
    }

    return true;
  }

  // Get current location
  Future<void> getCurrentLocation() async {
    if (!await handleLocationPermission()) return;

    try {
      Position position = await Geolocator.getCurrentPosition();
      currentPosition = position;
      mapCenter = latlong2.LatLng(position.latitude, position.longitude);
    } catch (e) {
      print('Error getting location: $e');
    }
  }

  // Start location updates
  void startLocationUpdates() {
    positionStream = Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 10,
      ),
    ).listen((Position position) {
      currentPosition = position;
      mapCenter = latlong2.LatLng(position.latitude, position.longitude);
    });
  }

  @override
  void initState(BuildContext context) {
    mapCenter =
        const latlong2.LatLng(36.212, 9.871); // Initial position as requested
    getCurrentLocation();
    startLocationUpdates();
  }

  @override
  void dispose() {
    positionStream?.cancel();
  }
}
