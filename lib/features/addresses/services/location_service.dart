import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationData {
  final double latitude;
  final double longitude;
  final String street;
  final String city;
  final String state;
  final String zipCode;
  final String fullAddress;

  LocationData({
    required this.latitude,
    required this.longitude,
    required this.street,
    required this.city,
    required this.state,
    required this.zipCode,
    required this.fullAddress,
  });
}

class LocationService {
  /// Get current location from GPS
  Future<LocationData?> getCurrentLocation() async {
    try {
      // Check permissions
      final permission = await _checkPermissions();
      if (!permission) {
        throw Exception('Location permission denied');
      }

      // Get current position
      final position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
          distanceFilter: 10,
        ),
      );

      // Reverse geocode to get address
      return await _getAddressFromCoordinates(
        position.latitude,
        position.longitude,
      );
    } catch (e) {
      print('Error getting current location: $e');
      return null;
    }
  }

  /// Get address from coordinates (reverse geocoding)
  Future<LocationData?> _getAddressFromCoordinates(
    double latitude,
    double longitude,
  ) async {
    try {
      final placemarks = await placemarkFromCoordinates(latitude, longitude);

      if (placemarks.isEmpty) {
        return null;
      }

      final placemark = placemarks.first;

      return LocationData(
        latitude: latitude,
        longitude: longitude,
        street: placemark.street ?? '',
        city: placemark.locality ?? '',
        state: placemark.administrativeArea ?? '',
        zipCode: placemark.postalCode ?? '',
        fullAddress: [
          if (placemark.street != null && placemark.street!.isNotEmpty)
            placemark.street,
          if (placemark.subLocality != null &&
              placemark.subLocality!.isNotEmpty)
            placemark.subLocality,
          if (placemark.locality != null && placemark.locality!.isNotEmpty)
            placemark.locality,
          if (placemark.administrativeArea != null &&
              placemark.administrativeArea!.isNotEmpty)
            placemark.administrativeArea,
          if (placemark.postalCode != null && placemark.postalCode!.isNotEmpty)
            placemark.postalCode,
          if (placemark.country != null && placemark.country!.isNotEmpty)
            placemark.country,
        ].join(', '),
      );
    } catch (e) {
      print('Error reverse geocoding: $e');
      return null;
    }
  }

  /// Check and request location permissions
  Future<bool> _checkPermissions() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled
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

  /// Convert LatLng to LocationData
  Future<LocationData?> getAddressFromLatLng(LatLng latLng) async {
    return await _getAddressFromCoordinates(latLng.latitude, latLng.longitude);
  }
}